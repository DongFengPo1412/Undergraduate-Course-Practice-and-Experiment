%刘超然-2023060904025
%用filter计算出输入信号x[n]=nu[n],1≤n≤4区间内的响应y[n]
x=[1 2 3 4];
a=[1 0 0];
b=[0.5 1 2];
y=filter(b, a ,x);
stem(x,y,'fill');
grid on;
title("y[n]");
