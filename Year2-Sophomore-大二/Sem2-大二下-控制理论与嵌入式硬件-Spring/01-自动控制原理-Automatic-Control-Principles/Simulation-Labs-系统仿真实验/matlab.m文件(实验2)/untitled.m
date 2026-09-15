clc; clear; close all;

num1 = 2.7;
den1 = [1 5 4 0];
G1 = tf(num1, den1);

num2 = 2.7;
den2 = [1 5 -4 0];
G2 = tf(num2, den2);

figure;
margin(G1);
title('System 1: G(s) = 2.7 / (s^3 + 5s^2 + 4s)');
[Gm1, Pm1, Wcg1, Wcp1] = margin(G1);

figure;
margin(G2);
title('System 2: G(s) = 2.7 / (s^3 + 5s^2 - 4s)');
[Gm2, Pm2, Wcg2, Wcp2] = margin(G2);

fprintf('System 1 Phase Margin: %.2f degrees\n', Pm1);
fprintf('System 2 Phase Margin: %.2f degrees\n', Pm2);

if Pm1 > 0
    disp('System 1 is stable in closed-loop.');
else
    disp('System 1 is unstable in closed-loop.');
end

if Pm2 > 0
    disp('System 2 is stable in closed-loop.');
else
    disp('System 2 is unstable in closed-loop.');
end
