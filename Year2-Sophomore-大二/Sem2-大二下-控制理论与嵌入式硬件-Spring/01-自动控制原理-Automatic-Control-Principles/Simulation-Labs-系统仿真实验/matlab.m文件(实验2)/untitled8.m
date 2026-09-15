clc; clear; close all

Kv_req = 10;

K = 1;
num = K;
den = conv([1 0], conv([1 10], [1 20]));
G = tf(num, den);

Kv_current = K / (10 * 20);
K_new = Kv_req / Kv_current;

num = K_new;
G = tf(num, den);

[GM, PM, Wcg, Wcp] = margin(G);

PM_req = 50;
phi_m = deg2rad(PM_req) - deg2rad(PM);
phi_max = phi_m + deg2rad(5);

alpha = (1 - sin(phi_max)) / (1 + sin(phi_max));
T = 1 / (Wcg * sqrt(alpha));
Gc = tf([T 1], [alpha*T 1]);

G_comp = Gc * G;

T1 = feedback(G, 1);
T2 = feedback(G_comp, 1);

figure
step(T1, T2)
legend('Original','Compensated')
title('Step Response Comparison')

t = 0:0.001:5;
ramp = t;
[y1, ~] = lsim(T1, ramp, t);
[y2, ~] = lsim(T2, ramp, t);

figure
plot(t, ramp, '--k', t, y1, 'b', t, y2, 'r')
legend('Input Ramp','Original Output','Compensated Output')
title('Ramp Response Comparison')

figure
margin(G_comp)
title('校正后系统伯德图')
grid on

Kv_final = dcgain(G_comp);
fprintf('校正后系统的稳态速度误差系数 Kv = %.2f s^{-1}\n', Kv_final);
