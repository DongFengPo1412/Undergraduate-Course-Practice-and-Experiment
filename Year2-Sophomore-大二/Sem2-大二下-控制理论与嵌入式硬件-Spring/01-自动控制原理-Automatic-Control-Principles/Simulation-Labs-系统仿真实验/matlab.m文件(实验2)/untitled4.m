clc; clear; close all;

K = 1;
num = K;
den = [5 3 1];
G = tf(num, den);

figure;
nyquist(G);
title('Nyquist Plot of G(s) = K / (5s^2 + 3s + 1)');
