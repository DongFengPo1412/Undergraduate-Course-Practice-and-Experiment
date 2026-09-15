%% 模式识别大作业：贝叶斯决策与密度估计（非参数估计）
clear; clc; close all;

% --- 超参数 ---
h_parzen = 0.08;    % Parzen窗带宽
k_neighbor = 15;    % k-NN近邻数
n_sub = 500;        % 非参数估计采样数（控制计算量）

%% 1. 数据加载与分类器训练
load('array_sample.mat'); % [Gray, R, G, B, Label]
I309 = im2double(imread('309.bmp'));
load('Mask.mat'); 

% 准备橙(1)/白(-1)分类数据
trainData = array_sample;
idxO = (trainData(:,5) == 1);
idxW = (trainData(:,5) == -1);
P1 = sum(idxO) / size(trainData,1);
P2 = sum(idxW) / size(trainData,1);

% --- A. 参数估计 (Gaussian) ---
modelOW.muC1 = mean(trainData(idxO, 2:4))'; 
modelOW.SigmaC1 = cov(trainData(idxO, 2:4)) + 1e-6*eye(3);
modelOW.muC2 = mean(trainData(idxW, 2:4))'; 
modelOW.SigmaC2 = cov(trainData(idxW, 2:4)) + 1e-6*eye(3);

% --- B. 非参数估计下采样 (Parzen/k-NN) ---
subO = randsample(find(idxO), min(n_sub, sum(idxO)));
subW = randsample(find(idxW), min(n_sub, sum(idxW)));
modelOW.sub_C1 = trainData(subO, 2:4);
modelOW.sub_C2 = trainData(subW, 2:4);
modelOW.h = h_parzen;
modelOW.k = k_neighbor;
modelOW.P1 = P1; modelOW.P2 = P2;

% --- C. 鱼/背景分割模型 (利用309图训练) ---
modelFB = train_fb_model(I309, Mask);

%% 2. 任务执行 (309-317.bmp)
imgFiles = {'309.bmp', '311.bmp', '313.bmp', '315.bmp', '317.bmp'};

for f = 1:length(imgFiles)
    I = im2double(imread(imgFiles{f}));
    [H, W, ~] = size(I);
    
    % 第一步：自动分割鱼区域 
    if strcmp(imgFiles{f}, '309.bmp')
        BW = logical(Mask);
    else
        BW = segment_fish(I, modelFB);
    end
    
    % 第二步：在鱼区域内使用三种方法进行橙白分类
    [res_Param, res_Parzen, res_KNN] = classify_triple_methods(I, BW, modelOW);
    
    % 第三步：可视化展示
    figure('Name', ['结果对比: ', imgFiles{f}], 'Color', 'w', 'Position', [100, 100, 1000, 700]);
    subplot(2,2,1); imshow(I); title([imgFiles{f}, ' 原图']);
    subplot(2,2,2); imshow(label2rgb_nemo(res_Param, BW));  title('方法1: 参数估计 (Gaussian)');
    subplot(2,2,3); imshow(label2rgb_nemo(res_Parzen, BW)); title('方法2: Parzen窗');
    subplot(2,2,4); imshow(label2rgb_nemo(res_KNN, BW));    title('方法3: k-NN');
end

%% ===================== 核心算法函数 =====================

function [L1, L2, L3] = classify_triple_methods(I, BW, mod)
    [H, W, ~] = size(I);
    idx = find(BW);
    test_C = reshape(I, [], 3); test_C = test_C(idx, :);
    L1 = zeros(H, W); L2 = zeros(H, W); L3 = zeros(H, W);
    
    % 1. 参数估计判别
    p1 = mvnpdf(test_C, mod.muC1', mod.SigmaC1);
    p2 = mvnpdf(test_C, mod.muC2', mod.SigmaC2);
    L1(idx) = (p1 * mod.P1 > p2 * mod.P2) * 2 - 1;
    
    % 2. Parzen 窗判别
    D1 = pdist2(test_C, mod.sub_C1, 'squaredeuclidean');
    D2 = pdist2(test_C, mod.sub_C2, 'squaredeuclidean');
    pz1 = sum(exp(-D1/(2*mod.h^2)), 2);
    pz2 = sum(exp(-D2/(2*mod.h^2)), 2);
    L2(idx) = (pz1 * mod.P1 > pz2 * mod.P2) * 2 - 1;
    
    % 3. k-NN 判别
    [~, d1] = knnsearch(mod.sub_C1, test_C, 'K', mod.k);
    [~, d2] = knnsearch(mod.sub_C2, test_C, 'K', mod.k);
    L3(idx) = (d1(:, mod.k) < d2(:, mod.k)) * 2 - 1;
end

function BW = segment_fish(I, model)
    [H, W, ~] = size(I);
    [C, R] = meshgrid(1:W, 1:H);
    X = reshape(cat(3, I, R/H, C/W), [], 5); % 融合颜色与空间特征
    
    Lf = log_mvnpdf(X, model.mu_f, model.Sig_f) + log(model.Pf);
    Lb = log_mvnpdf(X, model.mu_b, model.Sig_b) + log(model.Pb);
    BW = reshape(Lf > Lb, H, W);
    
    % 后处理：形态学+最大连通域剔除噪点
    BW = bwareaopen(imfill(imclose(BW, strel('disk', 5)), 'holes'), 400);
    stats = regionprops(BW, 'Area', 'PixelIdxList');
    if ~isempty(stats)
        [~, maxIdx] = max([stats.Area]);
        BW = false(size(BW)); BW(stats(maxIdx).PixelIdxList) = true;
    end
end

function model = train_fb_model(I, BW)
    [H, W, ~] = size(I);
    [C, R] = meshgrid(1:W, 1:H);
    X = reshape(cat(3, I, R/H, C/W), [], 5);
    Y = BW(:);
    Xf = X(Y == 1, :); Xb = X(Y == 0, :);
    if size(Xb,1) > size(Xf,1)*2, Xb = Xb(randperm(size(Xb,1), size(Xf,1)*2), :); end
    model.mu_f = mean(Xf)'; model.Sig_f = cov(Xf) + 1e-5*eye(5);
    model.mu_b = mean(Xb)'; model.Sig_b = cov(Xb) + 1e-5*eye(5);
    model.Pf = size(Xf,1)/(size(Xf,1)+size(Xb,1)); model.Pb = 1 - model.Pf;
end

function logp = log_mvnpdf(x, mu, Sigma)
    d = size(x, 2); dev = x - mu';
    logp = -0.5 * (d*log(2*pi) + log(det(Sigma)) + sum((dev / Sigma) .* dev, 2));
end

function rgb = label2rgb_nemo(L, BW)
    rgb = zeros([size(L), 3]);
    orange = (L == 1) & BW;
    white  = (L == -1) & BW;
    rgb(:,:,1) = orange * 1.0 + white * 1.0;
    rgb(:,:,2) = orange * 0.5 + white * 1.0;
    rgb(:,:,3) = orange * 0.0 + white * 1.0;
end