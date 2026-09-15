%% SVM 样本分类与可视化 (基于 LIBSVM)
clear; clc; close all;

% 设定样本数量 (每类40，总计80，满足>=60的要求)
N = 40; 

%% ================== 1. 线性可分情况 ==================
% 构造数据集
X1_lin = randn(N, 2) + [2.5, 2.5];  % 正类高斯分布
X2_lin = randn(N, 2) + [-2.5, -2.5]; % 负类高斯分布
X_lin = [X1_lin; X2_lin];
Y_lin = [ones(N, 1); -ones(N, 1)];

% 训练线性 SVM 模型
% 选项说明: -t 0 表示线性核; -c 1 为惩罚系数
model_lin = svmtrain(Y_lin, X_lin, '-t 0 -c 1'); 

%% ================== 2. 线性不可分情况 ==================
% 构造数据集 (环形分布)
r1 = randn(N, 1) * 0.5 + 4;         % 外环半径
theta1 = rand(N, 1) * 2 * pi;       % 外环角度
X1_nonlin = [r1.*cos(theta1), r1.*sin(theta1)]; % 外环正类

X2_nonlin = randn(N, 2) * 1.0;      % 内核负类
X_nonlin = [X1_nonlin; X2_nonlin];
Y_nonlin = [ones(N, 1); -ones(N, 1)];

% 训练非线性 SVM 模型 (RBF核)
% 选项说明: -t 2 表示 RBF 核函数; -c 10 提高惩罚避免欠拟合; -g 0.5 为 RBF 参数
model_nonlin = svmtrain(Y_nonlin, X_nonlin, '-t 2 -c 10 -g 0.5');

%% ================== 3. 可视化调用 ==================
figure('Name', 'LIBSVM 决策面与支持向量可视化', 'Position', [100, 100, 1000, 450]);

subplot(1, 2, 1);
plot_svm_decision(X_lin, Y_lin, model_lin, '线性可分 SVM (Linear Kernel)');

subplot(1, 2, 2);
plot_svm_decision(X_nonlin, Y_nonlin, model_nonlin, '线性不可分 SVM (RBF Kernel)');

%% ================== 底层可视化函数 ==================
function plot_svm_decision(X, Y, model, title_str)
    % 1. 绘制散点图
    hold on;
    gscatter(X(:,1), X(:,2), Y, 'rb', 'o^');
    
    % 2. 提取并标记支持向量 (Support Vectors)
    % model.SVs 存储了所有的支持向量
    SVs = model.SVs; 
    plot(SVs(:,1), SVs(:,2), 'ko', 'MarkerSize', 10, 'LineWidth', 1.5, 'DisplayName', 'Support Vectors');
    
    % 3. 生成网格以计算整个二维空间的决策值
    d = 0.05;
    [x1Grid, x2Grid] = meshgrid(min(X(:,1))-1 : d : max(X(:,1))+1, ...
                                min(X(:,2))-1 : d : max(X(:,2))+1);
    xGrid = [x1Grid(:), x2Grid(:)];
    
    % 4. 使用 svmpredict 获取网格点的决策值
    % 测试标签未知时可用零向量代替[cite: 10]
    % 输出的第三个参数为 decision_values[cite: 10]
    [~, ~, dec_values] = svmpredict(zeros(size(xGrid,1), 1), xGrid, model, '-q');
    
    % 符号校正：LIBSVM 的内部判定基准为 model.Label(1)[cite: 10]。
    % 确保 dec_values > 0 对应于我们在绘图中的正类(1)。
    if model.Label(1) == -1
        dec_values = -dec_values;
    end
    
    zGrid = reshape(dec_values, size(x1Grid));
    
    % 5. 绘制分类面与 Margin
    % 0等高线为决策边界，1和-1等高线为边界间隔 (Margin)
    [~, h1] = contour(x1Grid, x2Grid, zGrid, [0 0], 'k', 'LineWidth', 2, 'DisplayName', 'Decision Boundary');
    [~, h2] = contour(x1Grid, x2Grid, zGrid, [1 1], 'k--', 'LineWidth', 1, 'DisplayName', 'Margin (+1)');
    [~, h3] = contour(x1Grid, x2Grid, zGrid, [-1 -1], 'k--', 'LineWidth', 1, 'DisplayName', 'Margin (-1)');
    
    title(title_str);
    legend('Class 1', 'Class -1', 'Support Vectors', 'Decision Boundary', 'Margin', 'Location', 'best');
    axis tight;
    hold off;
end