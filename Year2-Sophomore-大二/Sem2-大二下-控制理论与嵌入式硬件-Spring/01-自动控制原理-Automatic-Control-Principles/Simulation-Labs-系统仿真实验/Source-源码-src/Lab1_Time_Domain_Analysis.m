%% Part 1: Control System Modeling & Interconnections
% Zero-Pole-Gain (ZPK) modeling
z = [-4, -5];
p = [-1, -2, -3];
k = 2;
G_zpk = zpk(z, p, k);
disp('Zero-Pole-Gain Model G(s):');
disp(G_zpk);

% Transfer Function (TF) definition
num1 = [5, 12];
den1 = conv([1, 0.5], [1, 10]); % (s+0.5)(s+10) = s^2 + 10.5s + 5
G1 = tf(num1, den1);
disp('Transfer Function G1(s):');
disp(G1);

% System feedback connection
num_h = [1, 3];
den_h = [1, 7, 5];
H = tf(num_h, den_h);
SysClosed = feedback(G1, H);
disp('Closed-loop Feedback System:');
disp(SysClosed);

%% Part 2: First-Order and Second-Order System Transient Response
% Define second-order system G(s) = 16 / (s^2 + 6s + 16)
num_sec = 16;
den_sec = [1, 6, 16];
G_sec = tf(num_sec, den_sec);

% Plot step response
figure;
subplot(2,1,1);
step(G_sec);
grid on;
title('Second-Order System Step Response');

% Plot impulse response
subplot(2,1,2);
impulse(G_sec);
grid on;
title('Second-Order System Impulse Response');

%% Part 3: High-Order System Stability and Steady-State Error
% Define system G(s) = 2 / (s^3 + 3s^2 + 2s)
num_high = 2;
den_high = [1, 3, 2, 0]; % s^3 + 3s^2 + 2s
G_high = tf(num_high, den_high);

% Calculate closed-loop system characteristics
SysHighClosed = feedback(G_high, 1);
[num_cl, den_cl] = tfdata(SysHighClosed, 'v');
cl_poles = roots(den_cl);
disp('Closed-loop poles of high-order system:');
disp(cl_poles);

% Plot closed-loop step response
figure;
step(SysHighClosed);
grid on;
title('Closed-Loop High-Order System Step Response');
