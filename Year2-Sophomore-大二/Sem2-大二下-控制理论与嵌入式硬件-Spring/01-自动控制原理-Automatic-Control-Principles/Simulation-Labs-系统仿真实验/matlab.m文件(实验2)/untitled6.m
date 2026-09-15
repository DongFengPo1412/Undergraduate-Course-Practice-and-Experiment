clc; clear; close all;

OS = 0.25;
Ts = 0.7;
Kv_req = 12;

zeta = -log(OS) / sqrt(pi^2 + log(OS)^2);
wn = 4 / (zeta * Ts);

K = 1;
num = K;
den = conv([1 0], conv([1 5], [1 20]));
G = tf(num, den);

Kv = dcgain(tf(num, conv([1 5], [1 20])));
K_new = Kv_req / Kv;

num = K_new;
G = tf(num, den);

phi_m = acos(zeta);
phi_max = 50 * pi / 180;
alpha = (1 - sin(phi_max)) / (1 + sin(phi_max));
T = 1 / (wn * sqrt(alpha));
Gc = tf([T 1], [alpha*T 1]);

G_comp = Gc * G;

T1 = feedback(G, 1);
T2 = feedback(G_comp, 1);

figure;
step(T1, T2);
legend('Before Compensation','After Compensation');
title('Step Response Comparison');

t = 0:0.001:5;
ramp = t;
[y1, ~] = lsim(T1, ramp, t);
[y2, ~] = lsim(T2, ramp, t);

figure;
plot(t, ramp, '--k', t, y1, 'b', t, y2, 'r');
legend('Input Ramp','Before Compensation','After Compensation');
title('Ramp Response Comparison');

figure;
margin(G_comp);
title('Bode Plot of Compensated System');

[y_step, t_step] = step(T2, 5);
overshoot = (max(y_step) - 1) * 100;

delta = 0.02;
settling_idx = find(abs(y_step - 1) <= delta, 1);
if ~isempty(settling_idx)
    settling_time = t_step(settling_idx);
else
    settling_time = NaN;
end

fprintf('超调量（%%）：%.2f\n', overshoot);
fprintf('调整时间（s）：%.3f\n', settling_time);
fprintf('开环增益（K_new）：%.3f\n', K_new);
