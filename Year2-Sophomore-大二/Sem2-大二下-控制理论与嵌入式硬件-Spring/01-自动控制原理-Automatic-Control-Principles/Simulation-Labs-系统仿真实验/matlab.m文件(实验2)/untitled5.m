clc; clear; close all;

K_values = [10 50];

for i = 1:length(K_values)
    K = K_values(i);
    num = K;
    den = conv([1 1], conv([0.5 1], [0.2 1]));
    G = tf(num, den);

    figure;
    nyquist(G);
    title(['Nyquist Plot of G(s) for K = ', num2str(K)]);
end
