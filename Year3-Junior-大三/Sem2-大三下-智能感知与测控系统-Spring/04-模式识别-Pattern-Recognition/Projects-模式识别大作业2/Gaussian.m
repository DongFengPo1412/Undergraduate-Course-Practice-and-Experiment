%% 大作业2：基于贝叶斯决策的Nemo鱼像素点分类（参数估计）
% 任务要求：实现Nemo鱼身像素的分类（任务1）及其他Nemo鱼图分割与分类（任务2）
clear; clc; close all;

%% 1. 数据加载与预处理
fprintf('正在加载数据...\n');
I309 = im2double(imread('309.bmp'));
load('Mask.mat');         
load('array_sample.mat');  

imgFiles = {'311.bmp', '313.bmp', '315.bmp', '317.bmp'};

%% 2. 训练分类器模型
% --- 模型A: 橙/白分类器 ---
% sample结构: [Gray, R, G, B, Label(1/-1)]
trainData = array_sample;
idxO = (trainData(:,5) == 1);
idxW = (trainData(:,5) == -1);

% 提取特征
featGray = trainData(:,1);
featRGB  = trainData(:,2:4);

% 计算先验概率
modelOW.P1 = sum(idxO) / size(trainData,1);
modelOW.P2 = sum(idxW) / size(trainData,1);

% 灰度模型参数 (1D Gaussian)
modelOW.muG1 = mean(featGray(idxO));
modelOW.muG2 = mean(featGray(idxW));
modelOW.sigG1 = std(featGray(idxO)) + 1e-6;
modelOW.sigG2 = std(featGray(idxW)) + 1e-6;

% 彩色模型参数 (3D Gaussian)
modelOW.muC1 = mean(featRGB(idxO,:))';
modelOW.muC2 = mean(featRGB(idxW,:))';
modelOW.SigmaC1 = cov(featRGB(idxO,:)) + 1e-6*eye(3);
modelOW.SigmaC2 = cov(featRGB(idxW,:)) + 1e-6*eye(3);

% --- 模型B: 鱼/背景分类器 ---
modelFB = train_fish_bg_model(I309, Mask);

%% 3. 任务 1 
fprintf('正在处理任务 1 (309.bmp)...\n');
BW309 = logical(Mask);
[res309_G, res309_C] = classify_pixels(I309, BW309, modelOW);

figure('Name', '任务1: 309.bmp 分类结果', 'NumberTitle', 'off', 'Color', 'w');
visualize_results(I309, BW309, res309_G, res309_C, '309.bmp');

%% 4. 任务 2 
fprintf('正在处理任务 2 (311-317.bmp)...\n');
for i = 1:length(imgFiles)
    I = im2double(imread(imgFiles{i}));
    
    % 第一步：贝叶斯自动分割鱼区域
    BW = segment_fish(I, modelFB);
    
    % 第二步：在鱼区域内进行橙白分类
    [res_G, res_C] = classify_pixels(I, BW, modelOW);
    
    figure('Name', ['任务2: ', imgFiles{i}], 'NumberTitle', 'off', 'Color', 'w');
    visualize_results(I, BW, res_G, res_C, imgFiles{i});
end

fprintf('所有任务处理完成。\n');

%% ===================== 核心逻辑函数 =====================

function model = train_fish_bg_model(I, BW)
    % 提取特征 [R, G, B, Row_norm, Col_norm]
    [H, W, ~] = size(I);
    [C, R] = meshgrid(1:W, 1:H);
    featMap = cat(3, I, R/H, C/W);
    X = reshape(featMap, [], 5);
    Y = BW(:);
    
    X_f = X(Y == 1, :);
    X_b = X(Y == 0, :);
    
    % 随机下采样背景，防止类别极度不平衡
    if size(X_b,1) > size(X_f,1)*2
        X_b = X_b(randperm(size(X_b,1), size(X_f,1)*2), :);
    end
    
    model.Pf = size(X_f,1) / (size(X_f,1) + size(X_b,1));
    model.Pb = size(X_b,1) / (size(X_f,1) + size(X_b,1));
    model.mu_f = mean(X_f)';
    model.mu_b = mean(X_b)';
    model.Sig_f = cov(X_f) + 1e-5*eye(5);
    model.Sig_b = cov(X_b) + 1e-5*eye(5);
end

function BW = segment_fish(I, model)
    [H, W, ~] = size(I);
    [C, R] = meshgrid(1:W, 1:H);
    X = reshape(cat(3, I, R/H, C/W), [], 5);
    
    % 贝叶斯判别 (Log-Likelihood)
    L_f = log_mvnpdf(X, model.mu_f, model.Sig_f) + log(model.Pf);
    L_b = log_mvnpdf(X, model.mu_b, model.Sig_b) + log(model.Pb);
    
    BW = reshape(L_f > L_b, H, W);
    
    % 形态学后处理
    BW = bwareaopen(BW, 300); 
    BW = imfill(imclose(BW, strel('disk', 5)), 'holes'); 
    
    % 仅保留最大连通域
    stats = regionprops(BW, 'Area', 'PixelIdxList');
    if ~isempty(stats)
        [~, maxIdx] = max([stats.Area]);
        BW = false(size(BW));
        BW(stats(maxIdx).PixelIdxList) = true;
    end
end

function [L_gray, L_rgb] = classify_pixels(I, BW, model)
    [H, W, ~] = size(I);
    Igray = rgb2gray(I);
    idx = find(BW);
    
    L_gray = zeros(H, W);
    L_rgb = zeros(H, W);
    
    % --- 灰度分类 (向量化) ---
    xg = Igray(idx);
    g1 = -0.5*log(2*pi) - log(model.sigG1) - (xg - model.muG1).^2 / (2*model.sigG1^2) + log(model.P1);
    g2 = -0.5*log(2*pi) - log(model.sigG2) - (xg - model.muG2).^2 / (2*model.sigG2^2) + log(model.P2);
    L_gray(idx) = (g1 > g2) * 2 - 1; 
    
    % --- 彩色分类 (向量化) ---
    Ir = I(:,:,1); Ig = I(:,:,2); Ib = I(:,:,3);
    xc = [Ir(idx), Ig(idx), Ib(idx)];
    
    c1 = log_mvnpdf(xc, model.muC1, model.SigmaC1) + log(model.P1);
    c2 = log_mvnpdf(xc, model.muC2, model.SigmaC2) + log(model.P2);
    L_rgb(idx) = (c1 > c2) * 2 - 1;
end

function logp = log_mvnpdf(x, mu, Sigma)
    % 高效率的多维正态分布对数概率密度
    d = size(x, 2);
    dev = x - mu';
    invSig = inv(Sigma);
    logDetSig = log(det(Sigma));
    quadform = sum((dev * invSig) .* dev, 2);
    logp = -0.5 * (d * log(2*pi) + logDetSig + quadform);
end

function visualize_results(I, BW, L_G, L_C, name)
    subplot(2,2,1); imshow(I); title([name, ' 原图']);
    subplot(2,2,2); imshow(BW); title('分割区域 (Fish Mask)');
    
    % 颜色映射处理
    subplot(2,2,3); imshow(label2rgb_custom(L_G, BW)); title('灰度贝叶斯分类');
    subplot(2,2,4); imshow(label2rgb_custom(L_C, BW)); title('彩色贝叶斯分类');
end

function rgb = label2rgb_custom(L, BW)
    [H, W] = size(L);
    rgb = zeros(H, W, 3);
    % 橙色 (Label=1): [1, 0.5, 0]
    orange = (L == 1) & BW;
    white  = (L == -1) & BW;
    
    rgb(:,:,1) = orange * 1.0 + white * 1.0;
    rgb(:,:,2) = orange * 0.5 + white * 1.0;
    rgb(:,:,3) = orange * 0.0 + white * 1.0;
end