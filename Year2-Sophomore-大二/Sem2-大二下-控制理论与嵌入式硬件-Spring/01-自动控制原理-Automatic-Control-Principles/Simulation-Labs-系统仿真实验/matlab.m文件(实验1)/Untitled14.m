% 定义传递函数变量 s
s = tf('s');

% 构造一个等效开环系统
G = 1 / (s^2 + 3*s + 1);

% 绘制根轨迹，K 为反馈增益
rlocus(G);

% 添加图像标签
title('根轨迹图：s^2 + (K+3)s + K = 0');
xlabel('实轴');
ylabel('虚轴');
grid on;
