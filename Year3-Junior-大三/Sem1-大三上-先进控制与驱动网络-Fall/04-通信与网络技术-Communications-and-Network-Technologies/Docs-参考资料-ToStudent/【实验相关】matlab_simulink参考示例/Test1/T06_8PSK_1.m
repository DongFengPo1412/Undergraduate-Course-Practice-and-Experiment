clear;
t = 0:0.001:5;
s1 = cos(2*pi*t + 1*pi/8);
s2 = cos(2*pi*t + 3*pi/8);
s3 = cos(2*pi*t + 5*pi/8);
s4 = cos(2*pi*t + 7*pi/8);
s5 = cos(2*pi*t + 9*pi/8);
s6 = cos(2*pi*t + 11*pi/8);
s7 = cos(2*pi*t + 13*pi/8);
s8 = cos(2*pi*t + 15*pi/8);

subplot(8,1,1);
plot(s1);
title('cos(\omega_ct+1*\pi/8) -- 000','fontname','Times New Roman', 'Color','b','FontSize',12);
axis([0 5000 -1 1]);

subplot(8,1,2);
plot(s2);
axis([0 5000 -1 1]);
title('cos(\omega_ct+3*\pi/8) -- 001','fontname','Times New Roman', 'Color','b','FontSize',12);

subplot(8,1,3);
plot(s3);
axis([0 5000 -1 1]);
title('cos(\omega_ct+5*\pi/8) -- 011','fontname','Times New Roman', 'Color','b','FontSize',12);

subplot(8,1,4);
plot(s4);
axis([0 5000 -1 1]);
title('cos(\omega_ct+7*\pi/8) -- 010','fontname','Times New Roman', 'Color','b','FontSize',12);

subplot(8,1,5);
plot(s5);
axis([0 5000 -1 1]);
title('cos(\omega_ct+9*\pi/8) -- 100','fontname','Times New Roman', 'Color','b','FontSize',12);

subplot(8,1,6);
plot(s6);
axis([0 5000 -1 1]);
title('cos(\omega_ct+11*\pi/8) -- 101','fontname','Times New Roman', 'Color','b','FontSize',12);

subplot(8,1,7);
plot(s7);
axis([0 5000 -1 1]);
title('cos(\omega_ct+13*\pi/8) -- 111','fontname','Times New Roman', 'Color','b','FontSize',12);

subplot(8,1,8);
plot(s8);
axis([0 5000 -1 1]);
title('cos(\omega_ct+15*\pi/8) -- 110','fontname','Times New Roman', 'Color','b','FontSize',12);
