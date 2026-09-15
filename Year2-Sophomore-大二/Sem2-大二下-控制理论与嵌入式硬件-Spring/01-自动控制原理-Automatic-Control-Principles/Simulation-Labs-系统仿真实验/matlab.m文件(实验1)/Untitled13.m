num=1;
den=conv([1 4],conv([1 0],[1 4 20]));
G=tf(num,den);

figure;
rlocus(G);
title('系统根轨迹');
xlabel('实轴');
ylabel('虚轴');
grid on;

zeta=[0.1 0.707 1];
wn=[1 5 10];
sgrid(zeta,wn);