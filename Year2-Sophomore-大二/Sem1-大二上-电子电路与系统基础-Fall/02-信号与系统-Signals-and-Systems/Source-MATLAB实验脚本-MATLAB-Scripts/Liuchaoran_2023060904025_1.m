%刘超然-2023060904025
%产生一个幅度为3,频率为5Hz,相位为pi/6的正弦信号
A=3;
f=5;
fai=pi/6;
w0=2*pi*f;
t=0:0.01:1;
x=A*sin(w0*t+fai);
subplot(2,1,1);
plot(t,x);
title("continuous-time signal");

%产生一个幅度为3,频率为pi/4,相位为pi/4的正弦序列  
A=3;
fai=pi/4;
omega=2*pi/8;
n=-10:10;
x=A*sin(omega*n+fai);
subplot(2,1,2);
stem(n,x,'fill');
grid on;
title("discrete-time signal");