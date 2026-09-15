n = 0:1000; % 调整采样点范围
fs = 8000; % 采样频率
duration = 0.3; % 每个音符持续时间（秒）
frequencies = [0.7217, 1.0247; 0.5346, 0.9273; 0.5346, 1.0247; 0.5346, 1.1328; 
               0.5906, 0.9273; 0.5906, 1.0247; 0.5906, 1.1328; 0.6535, 0.9273;
               0.6535, 1.0247; 0.6535, 1.1328];

% 生成所有信号
num_signals = size(frequencies, 1); % 信号数量
signals = cell(1, num_signals);
for i = 1:num_signals
    signals{i} = sin(frequencies(i, 1) * n) + sin(frequencies(i, 2) * n);
end

eps = 10; % 设置匹配阈值
a = cell(num_signals, 3); % 初始化存储数组

% 计算每个信号的傅里叶特征
for i = 1:num_signals
    signal = signals{i};
    y = abs(fft(signal, 2048));
    
    % 找到主频点
    maxrow = max(y(1:250));
    row = find(abs(y(1:250) - maxrow) < eps);
    maxcol = max(y(250:400));
    col = find(abs(y(250:400) - maxcol) < eps);
    
    % 存储特征
    a{i, 1} = row;
    a{i, 2} = col;
    a{i, 3} = num2str(i - 1); % 数字字符
end

% 电话号码
phone = [1, 8, 3, 3, 9, 8, 6, 1, 1, 8, 0];
num_digits = length(phone);

% 解码每个数字
decoded_numbers = '';
decoded_signals = cell(1, num_digits); % 使用 cell 数组存储信号

for k = 1:num_digits
    signal = signals{phone(k) + 1}; % 获取对应信号
    y = abs(fft(signal, 2048));
    
    % 找到主频点
    maxrow = max(y(1:250));
    row = find(abs(y(1:250) - maxrow) < eps);
    maxcol = max(y(250:400));
    col = find(abs(y(250:400) - maxcol) < eps);
    
    % 比对特征
    for j = 1:num_signals
        if isequal(a{j, 1}, row) && isequal(a{j, 2}, col)
            decoded_numbers = strcat(decoded_numbers, a{j, 3});
            decoded_signals{k} = signals{j}; % 存储对应信号到 cell 数组
            break;
        end
    end
end

% 输出解码结果
fprintf('解码的电话号码是: %s\n', decoded_numbers);

% 播放解码后的电话号码声音
combined_signal = []; % 合并信号
pause_duration = zeros(1, round(0.1 * fs)); % 间隔静音
for k = 1:num_digits
    combined_signal = [combined_signal, decoded_signals{k}, pause_duration]; % 确保使用 cell 元素
end

sound(combined_signal, fs); % 播放声音