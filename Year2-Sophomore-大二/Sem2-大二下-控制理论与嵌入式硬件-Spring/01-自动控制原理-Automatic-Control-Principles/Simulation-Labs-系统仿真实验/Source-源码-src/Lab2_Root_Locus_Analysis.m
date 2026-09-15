%% Part 1: Open-Loop Pole-Zero Configuration and Root Locus
clc; clear; close all;
% Define open-loop system: G(s) = 2.7 / (s(s+1)(s+4))
num1 = 2.7;
den1 = [1, 5, 4, 0]; % s^3 + 5s^2 + 4s
G1 = tf(num1, den1);

% Define another system with complex poles: G(s) = (s+5) / (s(s+1)(s+2)(s^2+2s+5))
num2 = [1, 5];
den2 = conv([1, 0], conv([1, 3, 2], [1, 2, 5]));
G2 = tf(num2, den2);

% Plot root locus
figure;
subplot(2,1,1);
rlocus(G1);
sgrid;
title('Root Locus of G1(s) = 2.7 / (s(s+1)(s+4))');

subplot(2,1,2);
rlocus(G2);
sgrid;
title('Root Locus of G2(s) = (s+5) / (s(s+1)(s+2)(s^2+2s+5))');

%% Part 2: Step Response Analysis under Varying Loop Gain K
% System: G(s) = K * (s+5) / (s(s+1)(s+2)(s^2+2s+5))
K_values = [0.5, 1, 2, 5];
figure;
hold on;
for i = 1:length(K_values)
    K = K_values(i);
    ClosedLoopSys = feedback(K * G2, 1);
    step(ClosedLoopSys, 10); % simulate step response for 10 seconds
end
legend('K = 0.5', 'K = 1', 'K = 2', 'K = 5');
grid on;
title('Closed-loop Step Response under Varying Gains');
