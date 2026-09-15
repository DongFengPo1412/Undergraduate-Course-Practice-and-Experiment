clc; clear; close all;

num = [1 5];
den = conv([1 0], conv([1 3 2], [1 2 5]));
G = tf(num, den);

figure;
margin(G);
title('Bode Plot of G(s) = (s + 5) / [s(s^2 + 3s + 2)(s^2 + 2s + 5)]');

[Gm, Pm, Wcg, Wcp] = margin(G);

fprintf('Gain Margin: %.2f dB\n', 20*log10(Gm));
fprintf('Phase Margin: %.2f degrees\n', Pm);

if Pm > 0
    disp('Closed-loop system is stable.');
else
    disp('Closed-loop system is unstable.');
end
