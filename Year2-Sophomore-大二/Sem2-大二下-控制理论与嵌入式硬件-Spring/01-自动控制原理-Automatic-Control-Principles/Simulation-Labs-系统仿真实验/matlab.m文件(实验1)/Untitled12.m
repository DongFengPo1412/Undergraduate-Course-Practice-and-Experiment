num=[1 -3];
den1=[0.01 1];
den2=[1 3];
den3=[1 0 2 3 4];
den=conv(conv(den1,den2),den3);

G=tf(num,den);
figure;
impulse(G);
title('开环单位脉冲响应');
xlabel('时间(s)');
ylabel('响应幅值');
grid on;

T=feedback(G,1);
figure;
impulse(T);
title('闭环单位脉冲响应');
xlabel('时间(s)');
ylabel('响应幅值');
grid on;