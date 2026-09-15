clear;
t = 0:0.001:5;
s1 = cos(2*pi*t + 1*pi/4);
s2 = cos(2*pi*t + 3*pi/4);
s3 = cos(2*pi*t + 5*pi/4);
s4 = cos(2*pi*t + 7*pi/4);

subplot(4,1,1);
plot(s1);
title('cos(\omega_ct+1*\pi/4) -- 00','fontname','Times New Roman', 'Color','b','FontSize',12);
axis([0 5000 -1 1]);

subplot(4,1,2);
plot(s2);
axis([0 5000 -1 1]);
title('cos(\omega_ct+3*\pi/4) -- 01','fontname','Times New Roman', 'Color','b','FontSize',12);

subplot(4,1,3);
plot(s3);
axis([0 5000 -1 1]);
title('cos(\omega_ct+5*\pi/4) -- 11','fontname','Times New Roman', 'Color','b','FontSize',12);

subplot(4,1,4);
plot(s4);
axis([0 5000 -1 1]);
title('cos(\omega_ct+7*\pi/4) -- 10','fontname','Times New Roman', 'Color','b','FontSize',12);
