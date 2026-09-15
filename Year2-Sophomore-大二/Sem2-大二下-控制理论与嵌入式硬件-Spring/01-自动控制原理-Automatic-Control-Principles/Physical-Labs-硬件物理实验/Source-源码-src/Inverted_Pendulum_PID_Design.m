% Inverted_Pendulum_PID_Design.m
% Root Locus based PID controller design for Inverted Pendulum
clear all, close all;

%% Part 1: Uncompensated Open-Loop System
num = [2.9586];
den = [1 0 -28.9941];
G0 = tf(num, den); % Open-loop transfer function

figure;
subplot(2,1,1);
rlocus(G0);
grid on;
title('Root Locus of Uncompensated Inverted Pendulum');

%% Part 2: PID Controller Design via Root Locus
% Choose double zeros for the PID controller: s = -6 +/- 6j
dzeros = [-6+1i*6, -6-1i*6];
numGc1 = poly(dzeros);
Gc_temp = tf(numGc1, [1, 0]); % PID = K * (s^2 + 12s + 72)/s

subplot(2,1,2);
rlocus(Gc_temp * G0);
sgrid;
title('Root Locus of PID-Compensated System');

% Prompt user to find gain K interactively or use calculated stability gain
disp('Select a point on the root locus to determine closed-loop gain (kfind)...');
% [kfind, poles] = rlocfind(Gc_temp * G0); % uncomment for interactive use in MATLAB

% We use a preset gain of 15.0 for demonstration/simulation
kfind = 15.0; 

Kd = kfind;
Kp = numGc1(2) * Kd; % Kp = 12 * Kd
Ki = numGc1(3) * Kd; % Ki = 72 * Kd

s = tf('s');
Gc1 = Kp + Ki/s + Kd*s;
fprintf('Designed PID Parameters:\n Kp = %.2f\n Ki = %.2f\n Kd = %.2f\n', Kp, Ki, Kd);

%% Part 3: Closed-Loop System Evaluation
SysClose = feedback(Gc1 * G0, 1, -1);
[numS, denS] = tfdata(SysClose, 'v');
poleSClose = roots(denS);
disp('Closed-loop poles:');
disp(poleSClose);

figure;
impulse(SysClose, 2); % Impulse response for 2 seconds
grid on;
title('Impulse Response of PID-Compensated Inverted Pendulum');
