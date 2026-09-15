%% 现代控制理论仿真实验报告 - RLC电路系统 (Main Script)
% 学院：自动化工程学院  姓名：刘超然  学号：2023060904025
% 实验内容：建模、分析、Lyapunov稳定性、极点配置与观测器设计
% 日期：2025.12.28

clc; clear; close all;

%% ================== 第一部分：系统建模与参数定义 ==================
fprintf('======== 第一部分：系统建模 ========\n');
% 1.1 物理参数定义 (欠阻尼参数)
R = 2;      % 电阻 (Ohm)
L = 0.5;    % 电感 (Henry)
C = 0.1;    % 电容 (Farad) -- 注意此处选0.1F以产生明显振荡

% 1.2 状态空间矩阵构建
% 状态变量: x1 = u_C (电压), x2 = i_L (电流)
A = [0, 1/C; 
     -1/L, -R/L]; % 根据基尔霍夫定律推导
B = [0;
     1/L];
C_mat = [1, 0];   % 输出为电容电压 x1
D = 0;

% 1.3 建立SS模型对象
sys_open = ss(A, B, C_mat, D);

% 输出模型信息
disp('系统矩阵 A = '); disp(A);
disp('输入矩阵 B = '); disp(B);
disp('特征值 (Open Loop Eigenvalues):');
eig_open = eig(A);
disp(eig_open);

% 计算阻尼比和自然频率
omega_n = sqrt(1/(L*C));
zeta_open = (R/2) * sqrt(C/L);
fprintf('开环系统参数: 自然频率 wn = %.2f rad/s, 阻尼比 zeta = %.3f\n', omega_n, zeta_open);

%% ================== 第二部分：状态方程求解 (时域分析) ==================
fprintf('\n======== 第二部分：时域响应分析 ========\n');
t = 0:0.01:10; % 仿真时间 0-10s

% 2.1 零输入响应 (Zero Input Response)
% 初始状态：电容预充5V电压，电感无电流
x0 = [5; 0]; 
[y_zi, t_zi, x_zi] = initial(sys_open, x0, t);

% 2.2 零状态阶跃响应 (Zero State Step Response)
% 输入：10V 阶跃电压
u_step = 10 * ones(size(t)); 
[y_zs, t_zs, x_zs] = lsim(sys_open, u_step, t, [0;0]);

% 绘图：开环响应
figure('Name', 'Open Loop Response', 'Color', 'w');
subplot(2,2,1);
plot(t_zi, x_zi(:,1), 'r', 'LineWidth', 1.5); grid on;
title('零输入响应: 电容电压 x_1'); ylabel('Voltage (V)');
subplot(2,2,2);
plot(t_zi, x_zi(:,2), 'b', 'LineWidth', 1.5); grid on;
title('零输入响应: 电感电流 x_2'); ylabel('Current (A)');

subplot(2,2,3);
plot(t_zs, x_zs(:,1), 'r', 'LineWidth', 1.5); grid on;
yline(10, 'k--', 'Steady State');
title('零状态阶跃响应: 电容电压 x_1'); ylabel('Voltage (V)');
subplot(2,2,4);
plot(t_zs, x_zs(:,2), 'b', 'LineWidth', 1.5); grid on;
title('零状态阶跃响应: 电感电流 x_2'); ylabel('Current (A)');
xlabel('Time (s)');

%% ================== 第三部分：能控性与能观测性判定 ==================
fprintf('\n======== 第三部分：能控性与能观测性 ========\n');

% 3.1 能控性矩阵 Qc =
Qc = ctrb(A, B);
rank_Qc = rank(Qc);
disp('能控性矩阵 Qc = '); disp(Qc);
if rank_Qc == length(A)
    fprintf('结论：Rank(Qc)=%d，系统【完全能控】。\n', rank_Qc);
else
    fprintf('结论：Rank(Qc)=%d < n，系统不可控。\n', rank_Qc);
end

% 3.2 能观测性矩阵 Qo = [C; CA]
Qo = obsv(A, C_mat);
rank_Qo = rank(Qo);
disp('能观测性矩阵 Qo = '); disp(Qo);
if rank_Qo == length(A)
    fprintf('结论：Rank(Qo)=%d，系统【完全能观测】。\n', rank_Qo);
else
    fprintf('结论：Rank(Qo)=%d < n，系统不可观测。\n', rank_Qo);
end

%% ================== 第四部分：Lyapunov稳定性分析 ==================
fprintf('\n======== 第四部分：Lyapunov稳定性分析 ========\n');
% 理论：若存在正定P满足 A'P + PA = -Q (Q正定)，则系统稳定。
% 选取 Q = I (单位阵)
Q_lyap = eye(2);

% 注意：MATLAB的 lyap(A,Q) 求解的是 AX + XA' + Q = 0
% 我们需要的方程是 A'P + PA + Q = 0
% 因此在调用 lyap 时，需要输入 A' 作为第一个参数
P_lyap = lyap(A', Q_lyap); 

disp('选定 Q = I，求解 Lyapunov 方程 A''P + PA = -Q 得到的 P 阵：');
disp(P_lyap);

% 验证 P 的正定性 (Sylvester 判据或特征值判据)
eig_P = eig(P_lyap);
disp('P 矩阵的特征值：'); disp(eig_P');

if all(eig_P > 0)
    disp('判定：P 的所有特征值均为正实数，故 P 正定。');
    disp('结论：根据 Lyapunov 第二法，系统在原点是【渐近稳定】的。');
else
    disp('判定：P 非正定。');
end

% 4.2 物理能量函数验证
% 能量 E = 0.5*L*x2^2 + 0.5*C*x1^2
% 计算零输入响应下的能量轨迹
Energy = 0.5 * L * x_zi(:,2).^2 + 0.5 * C * x_zi(:,1).^2;
figure('Name', 'Lyapunov Energy Function', 'Color', 'w');
plot(t_zi, Energy, 'k-', 'LineWidth', 2);
title('物理能量函数 V(x) 随时间的变化 (零输入)');
xlabel('Time (s)'); ylabel('Energy (Joules)');
grid on;
legend('E = 0.5Li^2 + 0.5Cu^2');

%% ================== 第五部分：状态反馈与观测器设计 ==================
fprintf('\n======== 第五部分：综合设计 (Pole Placement) ========\n');

% 5.1 状态反馈控制器设计
% 目标：消除振荡，将系统配置为过阻尼或临界阻尼，并加快响应。
% 设定目标闭环极点：
% 原极点实部约为 -2。我们希望更快收敛，且无超调。
% 设定目标阻尼比 zeta=1 (临界阻尼), wn=10 rad/s (比原系统快约2倍)
p_desired = roots([1, 2*1*10, 10^2]); % s^2 + 2*zeta*wn*s + wn^2 = 0
disp('期望闭环极点 (Target Poles):'); disp(p_desired');

% 计算反馈增益 K
K = acker(A, B, p_desired);
fprintf('计算得到的状态反馈增益 K = [%.4f, %.4f]\n', K(1), K(2));

% 5.2 全维状态观测器设计
% 原理：观测器极点应比控制器极点快 2-5 倍。
% 设定观测器极点为 -30, -31 (实数，快速收敛)
p_observer = [-30, -31];
% 计算观测器增益 L (注意转置：place(A', C', p)' )
L_obs = place(A', C_mat', p_observer)';
fprintf('计算得到的观测器增益 L = [%.4f; %.4f]\n', L_obs(1), L_obs(2));

% 5.3 带观测器的闭环系统仿真
% 系统状态方程: dx/dt = Ax + B(-K*x_hat) + B*ref
% 观测器方程:   dx_hat/dt = (A-LC)*x_hat + B*u + L*y
% 令参考输入 ref = 10V (为了让 x1 稳定在 10V)
% 注意：u = -K*x 是调节器问题(x->0)。要实现跟踪，需引入前馈增益 N_bar。
% 由于本实验主要考察镇定，我们采用简单的 u = -K(x_hat - x_ref) 结构，
% 或者直接计算静态增益 N_bar 使稳态值为 1。
% 闭环传递函数直流增益 DC_gain = C * inv(B*K - A) * B
% N_bar = 1 / DC_gain;
s = tf('s');
sys_cl_temp = ss(A-B*K, B, C_mat, D);
N_bar = 1 / dcgain(sys_cl_temp);
fprintf('前馈预滤波器增益 N_bar = %.4f\n', N_bar);

% 定义扩维系统 (Augmented System) 用于仿真
% 状态向量 X_aug = [x_sys (2x1); x_obs (2x1)]
% 输入 u_control = -K * x_obs + N_bar * r
% 真实系统: dot_x = A*x + B*(-K*x_obs + N_bar*r) = A*x - B*K*x_obs + B*N_bar*r
% 观测器:   dot_x_hat = (A - L*C)*x_hat + B*u_control + L*C*x
%                     = (A - L*C)*x_hat + B*(-K*x_hat + N_bar*r) + L*C*x
%                     = L*C*x + (A - L*C - B*K)*x_hat + B*N_bar*r

A_aug = [A,                  -B*K; 
         L_obs*C_mat,        A - B*K - L_obs*C_mat]; 

B_aug = [B * N_bar; 
         B * N_bar];                                 
C_aug = [C_mat, zeros(size(C_mat))]; % 输出真实电压
D_aug = 0;

sys_closed_loop = ss(A_aug, B_aug, C_aug, D_aug);

% 初始条件：系统从零开始，观测器也从零开始
x0_aug = [0; 0; 0; 0];
r_input = 10 * ones(size(t)); % 10V 参考输入

% 仿真
[y_cl, t_cl, x_cl] = lsim(sys_closed_loop, r_input, t, x0_aug);

% 5.4 结果绘图
figure('Name', 'Closed Loop Design', 'Color', 'w');

% 图1: 闭环输出响应 vs 开环
subplot(3,1,1);
plot(t_cl, y_cl, 'r', 'LineWidth', 2); hold on;
plot(t_zs, x_zs(:,1), 'k--', 'LineWidth', 1);
yline(10, 'g-.');
legend('闭环系统 (有反馈+观测器)', '开环系统 (无反馈)', '目标值 10V');
title('闭环控制效果对比：响应速度提升且无超调');
ylabel('Voltage (V)'); grid on;

% 图2: 状态估计效果 (观测器性能)
% x_cl(:,1) 是真实x1, x_cl(:,3) 是估计x1
subplot(3,1,2);
plot(t_cl, x_cl(:,1), 'b', 'LineWidth', 2); hold on;
plot(t_cl, x_cl(:,3), 'r--', 'LineWidth', 1.5);
title('观测器跟踪效果: 真实电容电压 vs 估计值');
legend('x_1 (Real)', 'x_1 (Est)');
ylabel('Voltage (V)'); grid on;

% 图3: 估计误差收敛
e_error = x_cl(:,1:2) - x_cl(:,3:4); % 真实 - 估计
subplot(3,1,3);
plot(t_cl, e_error(:,1), 'm', 'LineWidth', 1.5); hold on;
plot(t_cl, e_error(:,2), 'c', 'LineWidth', 1.5);
title('观测器估计误差收敛曲线 (Estimation Error)');
legend('e_1 (Voltage Error)', 'e_2 (Current Error)');
xlabel('Time (s)'); grid on;