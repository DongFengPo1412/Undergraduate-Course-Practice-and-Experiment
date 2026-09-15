%% 7. 状态观测器设计
% 设计全维观测器 dot(x_hat) = A*x_hat + B*u + L*(y - C*x_hat)
% 极点配置: 观测器极点应快于控制器极点
obs_poles = [-20, -25, -30]; 
L = place(A', C', obs_poles)'; 

% 7.1 验证观测器效果
% 构造增广系统: 输入 [u], 输出 [x; x_hat]
% 但这里我们直接编写微分方程仿真脚本来演示原理
% 系统初始状态 x0=[1;-1;5], 观测器初始状态 x0_hat=[0;0;0] (有初始误差)

% 定义仿真函数
A_cl_obs = A - L*C; % 误差动态矩阵
% 仿真... (为简化报告，直接用 lsim 模拟误差动态)
% 误差 e = x - x_hat, dot(e) = (A-LC)e
sys_error = ss(A_cl_obs, zeros(3,1), eye(3), 0);
e0 = x0 - [0;0;0]; % 初始误差
[e_traj, t_e] = initial(sys_error, e0, t);

subplot(2,2,4);
plot(t_e, e_traj(:,3), 'r', 'LineWidth', 1.5); grid on;
title('观测器估计误差 (v_c error)');
xlabel('Time (s)'); ylabel('Error (V)');
legend('e_3 = v_c - \hat{v}_c');