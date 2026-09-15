%刘超然-2023060904025
%利用conv计算y[n]=x[n]*h[n]
a=[1 1 1 1 1 1];
b=[0 1 2 3 4 5];
c=conv(a,b);
M=length(c)-1;
n=0:1:M;
stem(n,c,'fill');
grid on;
xlabel('Time index n');
title("y[n]");