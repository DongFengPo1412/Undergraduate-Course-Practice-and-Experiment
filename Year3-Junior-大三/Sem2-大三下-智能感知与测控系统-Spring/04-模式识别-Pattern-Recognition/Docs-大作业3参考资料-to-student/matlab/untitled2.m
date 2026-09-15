%% 1. 环境准备与路径添加
% 请确保该路径指向你解压后的 libsvm-matlab 文件夹
addpath('D:\xwechat_files\wxid_rn2ietnht8qj22_aa1a\msg\file\2026-05\matlab'); 

%% 2. 加载实验数据[cite: 1]
% 数据说明：train_data (N x 361), train_label (N x 1), test_data (420 x 361)
load('train_data.mat'); 
load('train_label.mat'); 
load('test_data.mat'); 

% 数据类型转换
train_label = double(train_label(:)); 
train_data = double(train_data); 
test_data = double(test_data); 

fprintf('--- 数据概览 ---\n');
fprintf('训练集大小: %d x %d\n', size(train_data,1), size(train_data,2));
fprintf('测试集大小: %d x %d\n', size(test_data,1), size(test_data,2));
fprintf('正样本(人脸): %d, 负样本(非人脸): %d\n', sum(train_label==1), sum(train_label==-1));

%% 3. 数据预处理：缩放到 [-1, 1]
% SVM 对量纲敏感，必须进行 Scaling 以避免数值较大的特征主导模型
x_min = min(train_data, [], 1); 
x_max = max(train_data, [], 1); 
x_range = x_max - x_min; 

% 防止除以 0（针对全黑或全白像素点）
x_range(x_range == 0) = 1; 

% 对训练集和测试集应用相同的缩放系数
train_scaled = 2 * (train_data - x_min) ./ x_range - 1; 
test_scaled = 2 * (test_data - x_min) ./ x_range - 1; 

%% 4. 参数选择：网格搜索 (Grid Search) 与交叉验证
% 遵循 SVMguide.pdf 建议的指数增长序列进行参数寻优[cite: 2]
% C = 2^-5, 2^-3, ..., 2^15
% gamma = 2^-15, 2^-13, ..., 2^3
best_acc = 0; 
best_c = 1; 
best_g = 1; 
log2c_list = -5:2:15; 
log2g_list = -15:2:3; 

fprintf('\n开始 5 折交叉验证寻找最优参数...\n'); 
for log2c = log2c_list
    for log2g = log2g_list
        c = 2^log2c; 
        g = 2^log2g; 
        % -s 0: C-SVC; -t 2: RBF核; -v 5: 5折交叉验证; -q: 静默模式
        cmd = sprintf('-s 0 -t 2 -c %f -g %f -v 5 -q', c, g); 
        cv_acc = svmtrain(train_label, train_scaled, cmd); 
        
        if cv_acc > best_acc
            best_acc = cv_acc; 
            best_c = c; 
            best_g = g; 
        end
    end
end
fprintf('\n最优参数结果: C = %f, gamma = %f, CV 准确率 = %.2f%%\n', best_c, best_g, best_acc);

%% 5. 训练最终模型并进行预测
% 使用寻优得到的最佳参数在全体训练集上进行训练[cite: 2]
final_cmd = sprintf('-s 0 -t 2 -c %f -g %f -q', best_c, best_g); 
model = svmtrain(train_label, train_scaled, final_cmd); 

% 对测试集进行预测
dummy_label = zeros(size(test_scaled, 1), 1); 
[pred_label, ~, ~] = svmpredict(dummy_label, test_scaled, model, '-q'); 

fprintf('\n测试集预测完成！人脸(+1): %d, 非人脸(-1): %d\n', ...
        sum(pred_label==1), sum(pred_label==-1));

%% 6. 保存提交结果
% 格式要求：imageID (int) + " " (空格) + label (-1\1, int) + "\n"
result_file = 'task3_result.txt'; 
fid = fopen(result_file, 'w'); 
for i = 1:length(pred_label)
    fprintf(fid, '%d %d\n', i, pred_label(i)); 
end
fclose(fid); 

fprintf('结果文件已成功保存为: %s\n', result_file);