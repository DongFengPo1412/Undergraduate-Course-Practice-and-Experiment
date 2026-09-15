%% 模式识别大作业：贝叶斯决策与密度估计（终极纯净版：灰度/彩色全包揽 + 面积强杀）
clear; clc; close all;

% ==========================================
% 超参数设置
% ==========================================
h_parzen = 0.08;       % Parzen窗的窗口宽度
k_neighbor = 15;       % k-NN的近邻数
n_sub = 500;           % 下采样样本数（防止内存溢出）

%% 1. 数据加载与预处理
fprintf('正在加载并初始化归一化训练数据...\n');
load('array_sample.mat'); % 1:Gray, 2-4:RGB, 5:Label

train_gray = array_sample(:, 1);
train_rgb  = array_sample(:, 2:4);
labels     = array_sample(:, 5);

% 动态获取类别标签
unique_labels = unique(labels);
if length(unique_labels) < 2
    error('样本数据中的类别标签不足两种，请检查 array_sample.mat');
end
label_fish = max(unique_labels); % 1: 鱼
label_bg   = min(unique_labels); % -1: 背景

idx1 = (labels == label_fish);
idx2 = (labels == label_bg);

% 计算先验概率
P_w1 = sum(idx1) / length(labels);
P_w2 = sum(idx2) / length(labels);

% 计算参数估计(Gaussian)所需的均值和方差/协方差矩阵
mu1 = mean(train_rgb(idx1,:)); sigma1 = cov(train_rgb(idx1,:)) + eye(3)*1e-5;
mu2 = mean(train_rgb(idx2,:)); sigma2 = cov(train_rgb(idx2,:)) + eye(3)*1e-5;

mu1_g = mean(train_gray(idx1)); sig1_g = var(train_gray(idx1)) + 1e-5;
mu2_g = mean(train_gray(idx2)); sig2_g = var(train_gray(idx2)) + 1e-5;

% 提取非参数估计所用的下采样训练集
sub1 = randsample(find(idx1), min(n_sub, sum(idx1)));
sub2 = randsample(find(idx2), min(n_sub, sum(idx2)));

train_rgb_sub1 = train_rgb(sub1,:);
train_rgb_sub2 = train_rgb(sub2,:);

% --- 补充灰度的下采样数据，用于灰度非参数估计 ---
train_gray_sub1 = train_gray(sub1);
train_gray_sub2 = train_gray(sub2);

%% 2. 任务一：309.bmp 图像分割 (结合 Mask.mat)
fprintf('\n--- 正在执行任务一 (309.bmp) ---\n');
load('Mask.mat');         
img_309_rgb = imread('309.bmp');
img_309_db = double(img_309_rgb) / 255; 
[h_309, w_309, ~] = size(img_309_db);

test_rgb_309 = reshape(img_309_db, [], 3);
test_gray_309 = reshape(rgb2gray(img_309_db), [], 1);
mask_vec = double(Mask(:) > 0); 

% 【HSV 严格橙色狙击】
hsv_309 = rgb2hsv(img_309_db);
H_309 = reshape(hsv_309(:,:,1), h_309, w_309); 
S_309 = reshape(hsv_309(:,:,2), h_309, w_309); 
V_309 = reshape(hsv_309(:,:,3), h_309, w_309);
% 严格限制：色相在橙红区，饱和度高，且明度不能太暗 (排除暗褐色礁石)
strict_orange_309 = ((H_309 < 0.1) | (H_309 > 0.92)) & (S_309 > 0.5) & (V_309 > 0.2);

% ==================== 灰度特征全套 ====================
% 1. 灰度特征 + 参数估计
p1_g = normpdf(test_gray_309, mu1_g, sqrt(sig1_g));
p2_g = normpdf(test_gray_309, mu2_g, sqrt(sig2_g));
res_309_gray_param = reshape(((p1_g * P_w1) > (p2_g * P_w2)) .* mask_vec, h_309, w_309);

% 2. 灰度特征 + Parzen 窗
D1_g = pdist2(test_gray_309, train_gray_sub1, 'squaredeuclidean');
D2_g = pdist2(test_gray_309, train_gray_sub2, 'squaredeuclidean');
p1_g_parzen = sum(exp(-D1_g/(2*h_parzen^2)), 2); 
p2_g_parzen = sum(exp(-D2_g/(2*h_parzen^2)), 2);
res_309_gray_parzen = reshape(((p1_g_parzen * P_w1) > (p2_g_parzen * P_w2)) .* mask_vec, h_309, w_309);

% 3. 灰度特征 + k-NN
[~, d1_g_knn] = knnsearch(train_gray_sub1, test_gray_309, 'K', k_neighbor);
[~, d2_g_knn] = knnsearch(train_gray_sub2, test_gray_309, 'K', k_neighbor);
res_309_gray_knn = reshape((d1_g_knn(:,k_neighbor) < d2_g_knn(:,k_neighbor)) .* mask_vec, h_309, w_309);

% ==================== 彩色特征全套 ====================
% 4. 彩色特征 + 参数估计
p1_param = mvnpdf(test_rgb_309, mu1, sigma1);
p2_param = mvnpdf(test_rgb_309, mu2, sigma2);
res_309_rgb_param = reshape(((p1_param * P_w1) > (p2_param * P_w2)) .* mask_vec, h_309, w_309);

% 5. 彩色特征 + Parzen 窗
D1 = pdist2(test_rgb_309, train_rgb_sub1, 'squaredeuclidean');
D2 = pdist2(test_rgb_309, train_rgb_sub2, 'squaredeuclidean');
p1_parzen = sum(exp(-D1/(2*h_parzen^2)), 2); 
p2_parzen = sum(exp(-D2/(2*h_parzen^2)), 2);
res_309_rgb_parzen = reshape(((p1_parzen * P_w1) > (p2_parzen * P_w2)) .* mask_vec, h_309, w_309);

% 6. 彩色特征 + k-NN
[~, d1_knn] = knnsearch(train_rgb_sub1, test_rgb_309, 'K', k_neighbor);
[~, d2_knn] = knnsearch(train_rgb_sub2, test_rgb_309, 'K', k_neighbor);
res_309_rgb_knn = reshape((d1_knn(:,k_neighbor) < d2_knn(:,k_neighbor)) .* mask_vec, h_309, w_309);

% 合并，并用 bwareaopen 抹杀所有细小噪点
out_309_gray_param  = uint8(bwareaopen(res_309_gray_param  & strict_orange_309, 100)) * 255;
out_309_gray_parzen = uint8(bwareaopen(res_309_gray_parzen & strict_orange_309, 100)) * 255;
out_309_gray_knn    = uint8(bwareaopen(res_309_gray_knn    & strict_orange_309, 100)) * 255;

out_309_rgb_param   = uint8(bwareaopen(res_309_rgb_param   & strict_orange_309, 100)) * 255;
out_309_rgb_parzen  = uint8(bwareaopen(res_309_rgb_parzen  & strict_orange_309, 100)) * 255;
out_309_rgb_knn     = uint8(bwareaopen(res_309_rgb_knn     & strict_orange_309, 100)) * 255;

figure('Name', '任务一：309.bmp (灰度与彩色全方法对比)', 'Position', [50, 100, 1400, 800]);
subplot(2,3,1); imshow(out_309_gray_param); title('1. 灰度 + 参数估计');
subplot(2,3,2); imshow(out_309_gray_parzen); title(sprintf('2. 灰度 + Parzen (h=%.2f)', h_parzen));
subplot(2,3,3); imshow(out_309_gray_knn); title(sprintf('3. 灰度 + k-NN (k=%d)', k_neighbor));
subplot(2,3,4); imshow(out_309_rgb_param); title('4. 彩色 + 参数估计');
subplot(2,3,5); imshow(out_309_rgb_parzen); title('5. 彩色 + Parzen');
subplot(2,3,6); imshow(out_309_rgb_knn); title('6. 彩色 + k-NN');


%% 3. 任务二：其他4张彩色图像分割 (面积强杀，拒绝一切噪点)
fprintf('\n--- 正在执行任务二 (311, 313, 315, 317.bmp) ---\n');
img_files = {'311.bmp', '313.bmp', '315.bmp', '317.bmp'};

figure('Name', '任务二：其余四张图 (大面积连通域强杀噪点，绝对纯净版)', 'Position', [150, 150, 1200, 800]);

for i = 1:length(img_files)
    fprintf('正在处理图像: %s ...\n', img_files{i});
    
    img_rgb = imread(img_files{i});
    img_db = double(img_rgb) / 255; 
    [hi, wi, ~] = size(img_db);
    test_rgb = reshape(img_db, [], 3);
    
    % 【HSV 严格橙色狙击】
    hsv_i = rgb2hsv(img_db);
    H_i = hsv_i(:,:,1); S_i = hsv_i(:,:,2); V_i = hsv_i(:,:,3);
    
    % 严格限制颜色，排除发暗发灰的杂质
    strict_orange_i = ((H_i < 0.1) | (H_i > 0.92)) & (S_i > 0.5) & (V_i > 0.2);
    
    % ==============================================
    % 方法一: 参数估计
    % ==============================================
    p1_p = mvnpdf(test_rgb, mu1, sigma1);
    p2_p = mvnpdf(test_rgb, mu2, sigma2);
    res_p = reshape(((p1_p * P_w1) > (p2_p * P_w2)), hi, wi); 
    % 核心强杀：bwareaopen(..., 400) 直接抹去面积小于 400 像素的所有噪点块
    out_p = uint8(bwareaopen(res_p & strict_orange_i, 400)) * 255; 
    
    % ==============================================
    % 方法二: Parzen 窗
    % ==============================================
    D1_pz = pdist2(test_rgb, train_rgb_sub1, 'squaredeuclidean');
    D2_pz = pdist2(test_rgb, train_rgb_sub2, 'squaredeuclidean');
    p1_pz = sum(exp(-D1_pz/(2*h_parzen^2)), 2);
    p2_pz = sum(exp(-D2_pz/(2*h_parzen^2)), 2);
    res_pz = reshape(((p1_pz * P_w1) > (p2_pz * P_w2)), hi, wi);
    out_pz = uint8(bwareaopen(res_pz & strict_orange_i, 400)) * 255;
    
    % ==============================================
    % 方法三: k-NN
    % ==============================================
    [~, d1_k] = knnsearch(train_rgb_sub1, test_rgb, 'K', k_neighbor);
    [~, d2_k] = knnsearch(train_rgb_sub2, test_rgb, 'K', k_neighbor);
    res_k = reshape((d1_k(:,k_neighbor) < d2_k(:,k_neighbor)), hi, wi); 
    out_k = uint8(bwareaopen(res_k & strict_orange_i, 400)) * 255;
    
    % --- 绘图 ---
    subplot(4, 4, (i-1)*4 + 1); imshow(img_rgb); 
    if i == 1; title('原始图像'); else; ylabel(img_files{i}, 'FontWeight', 'bold'); end
    
    subplot(4, 4, (i-1)*4 + 2); imshow(out_p); 
    if i == 1; title('1. 参数估计'); end
    
    subplot(4, 4, (i-1)*4 + 3); imshow(out_pz); 
    if i == 1; title('2. Parzen窗'); end
    
    subplot(4, 4, (i-1)*4 + 4); imshow(out_k); 
    if i == 1; title('3. k-NN'); end
end

fprintf('\n所有计算已完成！世界终于清净了！\n');