% 定义传递函数 G(s) = 16 / (s^2 + 6s + 16)
num = 16;
den = [1 6 16];
G = tf(num, den);

% 获取单位阶跃响应
[y, t] = step(G);

% 计算系统的稳态值（最终值）
C = dcgain(G);

% 最大值及峰值时间
[Y_peak, idx_peak] = max(y);
T_peak = t(idx_peak);

% 超调量（百分比）
OS = 100 * (Y_peak - C) / C;

% 上升时间（10%~90%稳态值）
idx_start = find(y >= 0.1 * C, 1);
idx_end = find(y >= 0.9 * C, 1);
T_rise = t(idx_end) - t(idx_start);

% 显示结果
disp(['最大值：', num2str(Y_peak)]);
disp(['峰值时间：', num2str(T_peak), ' 秒']);
disp(['超调量：', num2str(OS), ' %']);
disp(['上升时间：', num2str(T_rise), ' 秒']);

% 绘图
figure;
step(G);
title('单位阶跃响应');
xlabel('时间 (s)');
ylabel('响应幅值');
grid on;
