%% 模式识别大作业 1：二维正态分布贝叶斯决策面可视化
% 本脚本全新重建并实现：在等先验概率条件下，两类二维正态分布样本在三种不同协方差配置下的：
% 1. 样本生成与可视化散点绘制
% 2. 等密度点轨迹（等高线）绘制
% 3. 理论贝叶斯分类边界（决策面）的求解与绘制
%
% 包含三个实验任务：
% - 任务 1a: 协方差相等且为球形分布 (Sigma1 = Sigma2 = sigma^2 * I) -> 决策面为线性（且垂直平分均值连线）
% - 任务 1b: 协方差相等但非球形分布 (Sigma1 = Sigma2 != sigma^2 * I) -> 决策面为线性（倾斜）
% - 任务 2: 协方差不等 (Sigma1 != Sigma2) -> 决策面为二次非线性边界（双曲线/椭圆等）

clear; clc; close all;

% 设置随机种子以保证实验可重复性
rng(42);

% 样本数
N = 300;

% 网格精度（用于绘制等密度图和决策面）
grid_resolution = 200;
x_range = linspace(-4, 9, grid_resolution);
y_range = linspace(-4, 9, grid_resolution);
[X_grid, Y_grid] = meshgrid(x_range, y_range);
grid_pts = [X_grid(:), Y_grid(:)];

%% ========================================================================
%% 任务 1a: 协方差相等且为球形分布 (Sigma1 = Sigma2 = sigma^2 * I) -> 线性决策面
%% ========================================================================
mu1_a = [1; 1];
mu2_a = [4; 4];
Sigma1_a = [1.5, 0; 0, 1.5];
Sigma2_a = Sigma1_a;

% 1. 生成随机样本
X1_a = mvnrnd(mu1_a', Sigma1_a, N);
X2_a = mvnrnd(mu2_a', Sigma2_a, N);

% 2. 计算网格点上的概率密度 (PDF)
pdf1_a = reshape(mvnpdf(grid_pts, mu1_a', Sigma1_a), grid_resolution, grid_resolution);
pdf2_a = reshape(mvnpdf(grid_pts, mu2_a', Sigma2_a), grid_resolution, grid_resolution);

% 3. 绘制图像
figure('Name', 'Task 1a: Equal Spherical Covariances', 'NumberTitle', 'off', 'Position', [100, 100, 800, 600]);
hold on; grid on; box on;

% 绘制样本散点
h_s1 = scatter(X1_a(:, 1), X1_a(:, 2), 40, 'r', 'filled', 'MarkerFaceAlpha', 0.6);
h_s2 = scatter(X2_a(:, 1), X2_a(:, 2), 40, 'b', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none', 'LineWidth', 1);

% 绘制均值点
plot(mu1_a(1), mu1_a(2), 'ro', 'MarkerSize', 10, 'LineWidth', 3, 'MarkerFaceColor', 'y');
plot(mu2_a(1), mu2_a(2), 'bx', 'MarkerSize', 12, 'LineWidth', 3);

% 绘制均值连线（展示决策面的垂直平分性质）
plot([mu1_a(1), mu2_a(1)], [mu1_a(2), mu2_a(2)], 'k--', 'LineWidth', 1.2);

% 绘制等密度轨迹（等高线）
[~, h_c1] = contour(X_grid, Y_grid, pdf1_a, 4, 'r', 'LineWidth', 0.8, 'LineStyle', ':');
[~, h_c2] = contour(X_grid, Y_grid, pdf2_a, 4, 'b', 'LineWidth', 0.8, 'LineStyle', ':');

% 绘制决策面：pdf1_a - pdf2_a = 0
[~, h_db] = contour(X_grid, Y_grid, pdf1_a - pdf2_a, [0, 0], 'g', 'LineWidth', 2.5);

% 图形美化
xlim([-4, 9]); ylim([-4, 9]);
xlabel('Feature X_1', 'FontSize', 11);
ylabel('Feature X_2', 'FontSize', 11);
title('Task 1a: Linear Decision Boundary (\Sigma_1 = \Sigma_2 = \sigma^2I)', 'FontSize', 12, 'FontWeight', 'bold');
legend([h_s1, h_s2, h_c1, h_db], ...
       {'Class 1 Samples', 'Class 2 Samples', 'Constant Density Contours', 'Bayesian Decision Boundary'}, ...
       'Location', 'best', 'FontSize', 10);

%% ========================================================================
%% 任务 1b: 协方差相等但非球形 (Sigma1 = Sigma2 != sigma^2 * I) -> 线性决策面
%% ========================================================================
mu1_b = [1; 1];
mu2_b = [4; 4];
Sigma1_b = [2.0, 0.8; 0.8, 1.5]; % 存在协方差，倾斜分布
Sigma2_b = Sigma1_b;

% 1. 生成随机样本
X1_b = mvnrnd(mu1_b', Sigma1_b, N);
X2_b = mvnrnd(mu2_b', Sigma2_b, N);

% 2. 计算网格点上的概率密度 (PDF)
pdf1_b = reshape(mvnpdf(grid_pts, mu1_b', Sigma1_b), grid_resolution, grid_resolution);
pdf2_b = reshape(mvnpdf(grid_pts, mu2_b', Sigma2_b), grid_resolution, grid_resolution);

% 3. 绘制图像
figure('Name', 'Task 1b: Equal Non-Spherical Covariances', 'NumberTitle', 'off', 'Position', [200, 150, 800, 600]);
hold on; grid on; box on;

% 绘制样本散点
h_s1 = scatter(X1_b(:, 1), X1_b(:, 2), 40, 'r', 'filled', 'MarkerFaceAlpha', 0.6);
h_s2 = scatter(X2_b(:, 1), X2_b(:, 2), 40, 'b', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none', 'LineWidth', 1);

% 绘制均值点
plot(mu1_b(1), mu1_b(2), 'ro', 'MarkerSize', 10, 'LineWidth', 3, 'MarkerFaceColor', 'y');
plot(mu2_b(1), mu2_b(2), 'bx', 'MarkerSize', 12, 'LineWidth', 3);

% 绘制均值连线（用于对比非垂直性质）
plot([mu1_b(1), mu2_b(1)], [mu1_b(2), mu2_b(2)], 'k--', 'LineWidth', 1.2);

% 绘制等密度轨迹
[~, h_c1] = contour(X_grid, Y_grid, pdf1_b, 4, 'r', 'LineWidth', 0.8, 'LineStyle', ':');
[~, h_c2] = contour(X_grid, Y_grid, pdf2_b, 4, 'b', 'LineWidth', 0.8, 'LineStyle', ':');

% 绘制决策面：pdf1_b - pdf2_b = 0
[~, h_db] = contour(X_grid, Y_grid, pdf1_b - pdf2_b, [0, 0], 'g', 'LineWidth', 2.5);

% 图形美化
xlim([-4, 9]); ylim([-4, 9]);
xlabel('Feature X_1', 'FontSize', 11);
ylabel('Feature X_2', 'FontSize', 11);
title('Task 1b: Linear Decision Boundary (\Sigma_1 = \Sigma_2 \neq \sigma^2I)', 'FontSize', 12, 'FontWeight', 'bold');
legend([h_s1, h_s2, h_c1, h_db], ...
       {'Class 1 Samples', 'Class 2 Samples', 'Constant Density Contours', 'Bayesian Decision Boundary'}, ...
       'Location', 'best', 'FontSize', 10);

%% ========================================================================
%% 任务 2: 协方差矩阵不等 (Sigma1 != Sigma2) -> 二次非线性决策面
%% ========================================================================
mu1_c = [1; 1];
mu2_c = [3.5; 3.5];
Sigma1_c = [1.0, 0; 0, 1.0];        % 较小的圆形协方差
Sigma2_c = [3.0, 1.2; 1.2, 2.0];    % 较大的倾斜协方差

% 1. 生成随机样本
X1_c = mvnrnd(mu1_c', Sigma1_c, N);
X2_c = mvnrnd(mu2_c', Sigma2_c, N);

% 2. 计算网格点上的概率密度 (PDF)
pdf1_c = reshape(mvnpdf(grid_pts, mu1_c', Sigma1_c), grid_resolution, grid_resolution);
pdf2_c = reshape(mvnpdf(grid_pts, mu2_c', Sigma2_c), grid_resolution, grid_resolution);

% 3. 绘制图像
figure('Name', 'Task 2: Unequal Covariances', 'NumberTitle', 'off', 'Position', [300, 200, 800, 600]);
hold on; grid on; box on;

% 绘制样本散点
h_s1 = scatter(X1_c(:, 1), X1_c(:, 2), 40, 'r', 'filled', 'MarkerFaceAlpha', 0.6);
h_s2 = scatter(X2_c(:, 1), X2_c(:, 2), 40, 'b', 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none', 'LineWidth', 1);

% 绘制均值点
plot(mu1_c(1), mu1_c(2), 'ro', 'MarkerSize', 10, 'LineWidth', 3, 'MarkerFaceColor', 'y');
plot(mu2_c(1), mu2_c(2), 'bx', 'MarkerSize', 12, 'LineWidth', 3);

% 绘制等密度轨迹
[~, h_c1] = contour(X_grid, Y_grid, pdf1_c, 4, 'r', 'LineWidth', 0.8, 'LineStyle', ':');
[~, h_c2] = contour(X_grid, Y_grid, pdf2_c, 4, 'b', 'LineWidth', 0.8, 'LineStyle', ':');

% 绘制决策面：pdf1_c - pdf2_c = 0
[~, h_db] = contour(X_grid, Y_grid, pdf1_c - pdf2_c, [0, 0], 'g', 'LineWidth', 2.5);

% 图形美化
xlim([-4, 9]); ylim([-4, 9]);
xlabel('Feature X_1', 'FontSize', 11);
ylabel('Feature X_2', 'FontSize', 11);
title('Task 2: Nonlinear Quadratic Decision Boundary (\Sigma_1 \neq \Sigma_2)', 'FontSize', 12, 'FontWeight', 'bold');
legend([h_s1, h_s2, h_c1, h_db], ...
       {'Class 1 Samples', 'Class 2 Samples', 'Constant Density Contours', 'Bayesian Decision Boundary'}, ...
       'Location', 'best', 'FontSize', 10);

fprintf('Bayesian Decision Boundary Visualization Simulation completed successfully!\n');
