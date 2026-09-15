%% Part 1: Bode and Nyquist Plots of Uncompensated System
clc; clear; close all;
% System transfer function
num = 64;
den = conv([1, 0], [1, 1.13]); % G(s) = 64 / (s*(s+1.13))
G = tf(num, den);

% Nyquist plot
figure;
subplot(2,1,1);
nyquist(G);
grid on;
title('Nyquist Plot of Uncompensated System');

% Bode plot and Phase Margin
subplot(2,1,2);
margin(G);
grid on;

%% Part 2: Lead Compensator Design (串联超前校正)
% Specs: Overshoot <= 25%, Settling Time Ts <= 0.7s, Velocity error Kv >= 12
OS = 0.25;
Ts = 0.7;
Kv_req = 12;

% Calculate damping ratio zeta and natural frequency omega_n
zeta = -log(OS) / sqrt(pi^2 + log(OS)^2);
omega_n = 4 / (zeta * Ts);

% Calculate desired dominant poles s_d
sigma = zeta * omega_n;
wd = omega_n * sqrt(1 - zeta^2);
s_d = -sigma + 1i*wd;

% Uncompensated system poles and evaluation at s_d
G_val = evalfr(G, s_d);
angle_G = angle(G_val); % in radians
angle_G_deg = angle_G * 180 / pi;

% Calculate angle contribution needed from lead compensator (phi)
% Angle condition: angle(Gc * G) = -180 + k*360
phi = -180 - angle_G_deg;
if phi < 0
    phi = phi + 360;
end
fprintf('Compensator angle contribution phi: %.2f degrees\n', phi);

% Using bisector method or selecting zero to cancel open-loop pole
% Let's cancel the pole at -1.13: z_c = 1.13
% Gc(s) = K_c * (s + z_c) / (s + p_c)
z_c = 1.13;
% Since angle(s_d + z_c) - angle(s_d + p_c) = phi
angle_zc_deg = angle(s_d + z_c) * 180 / pi;
angle_pc_deg = angle_zc_deg - phi;
p_c = - (real(s_d) - imag(s_d) / tan(angle_pc_deg * pi / 180));
fprintf('Compensator zero: %.2f, pole: %.2f\n', z_c, p_c);

% Calculate gain K_c using magnitude condition: |Gc(s_d) * G(s_d)| = 1
Gc_temp = tf([1, z_c], [1, p_c]);
val_temp = abs(evalfr(Gc_temp * G, s_d));
K_c = 1 / val_temp;
Gc = K_c * Gc_temp;

fprintf('Designed Lead Compensator Gc(s):\n');
disp(Gc);

% Verify compensated closed loop system step response
figure;
CompensatedSys = feedback(Gc * G, 1);
step(CompensatedSys);
grid on;
title('Step Response of Compensated Closed-loop System');
