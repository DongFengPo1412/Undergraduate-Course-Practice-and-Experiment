clc; clear; close all;

% 定义系统的开环传递函数 G(s) = 2 / (s^3 + 3s^2 + 2s)
num = [2];
den = [1 3 2 0];  % s^3 + 3s^2 + 2s

sys = tf(num, den);

% 绘制根轨迹
rlocus(sys);
title('系统 G(s) = 2k / (s^3 + 3s^2 + 2s) 的根轨迹');
xlabel('实轴');
ylabel('虚轴');
grid on;

% 显示坐标
sgrid;

[k_stable, poles] = rlocfind(sys);
disp(['系统临界稳定时的最大 k 值为：', num2str(k_stable)]);
