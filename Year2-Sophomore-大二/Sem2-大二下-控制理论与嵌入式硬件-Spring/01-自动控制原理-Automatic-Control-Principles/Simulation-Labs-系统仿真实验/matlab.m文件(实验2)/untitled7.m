clc; clear; close all;

num = 64; 
den = conv([1 0], [1 1.13]);
G = tf(num, den);

[GM, PM, wcg, wcp] = margin(G);

Gc = tf([0.2 0.2*1], [0.03 1]);

G_check = Gc * G;

[GM_new, PM_new, wcg_new, wcp_new] = margin(G_check);

figure;
margin(G_check);
grid on;
title('校正后系统伯德图');

T1 = feedback(G, 1);
T2 = feedback(G_check, 1);

figure;
step(T1, T2);
legend('Before Compensation','After Compensation');
title('Step Response Comparison');

t = 0:0.01:10;
ramp = t;
[y1, ~] = lsim(T1, ramp, t);
[y2, ~] = lsim(T2, ramp, t);

figure;
plot(t, ramp, '--k', t, y1, 'b', t, y2, 'r');
legend('Input Ramp','Before Compensation','After Compensation');
title('Ramp Response Comparison');

fprintf('原始系统相位裕度：%.2f°，增益裕度：%.2f dB\n', PM, 20*log10(GM));
fprintf('校正后相位裕度：%.2f°，增益裕度：%.2f dB\n', PM_new, 20*log10(GM_new));
