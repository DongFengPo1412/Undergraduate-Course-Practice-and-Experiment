% 数据录入 (基于刘超然实验数据 - 表3 & 表4)
TLN = 98.12; % 额定转矩
ratio = [0.1, 0.25, 0.5, 0.75, 1];
TL = ratio * TLN;

% 表3 (额定电压)
n_rated = [1496, 1491, 1482, 1473, 1464];

% 表4 (0.5倍额定电压)
n_half = [1484, 1462, 1420, 1364, 1256];

% 绘制机械特性曲线
figure;
plot(TL, n_rated, 'b-o', 'LineWidth', 1.5); hold on;
plot(TL, n_half, 'r-s', 'LineWidth', 1.5);
xlabel('负载转矩 T_L (N.m)');
ylabel('转速 n (r/min)');
title('鼠笼异步电机降压调速机械特性');
legend('额定电压 (U_N)', '0.5倍额定电压 (0.5U_N)');
grid on;