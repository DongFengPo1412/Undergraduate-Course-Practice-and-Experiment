clc; clear; close all;

K_values = [0.5 1 2 5];

for i = 1:length(K_values)
    K = K_values(i);
    num = K * [1 3];
    den = conv([1 0], [1 -1]);
    GH = tf(num, den);

    figure;
    nyquist(GH);
    axis([-10 1 -2 2]);
    title(['Nyquist Plot for K = ', num2str(K)]);
end
