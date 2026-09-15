clear;
t = 0:0.001:5;
s0000 = (sqrt((3)^2+(3)^2)/sqrt(10))*cos(2*pi*t + 45/180*pi);
s0001 = (sqrt((1)^2+(3)^2)/sqrt(10))*cos(2*pi*t + 71.6/180*pi);
s0010 = (sqrt((-3)^2+(3)^2)/sqrt(10))*cos(2*pi*t + 135/180*pi);
s0011 = (sqrt((-1)^2+(3)^2)/sqrt(10))*cos(2*pi*t + 108.4/180*pi);
s0100 = (sqrt((3)^2+(1)^2)/sqrt(10))*cos(2*pi*t + 18.4/180*pi);
s0101 = (sqrt((1)^2+(1)^2)/sqrt(10))*cos(2*pi*t + 45/180*pi);
s0110 = (sqrt((-3)^2+(1)^2)/sqrt(10))*cos(2*pi*t + 161.6/180*pi);
s0111 = (sqrt((-1)^2+(1)^2)/sqrt(10))*cos(2*pi*t + 135/180*pi);
s1000 = (sqrt((3)^2+(-3)^2)/sqrt(10))*cos(2*pi*t + 315/180*pi);
s1001 = (sqrt((1)^2+(-3)^2)/sqrt(10))*cos(2*pi*t + 288.4/180*pi);
s1010 = (sqrt((-3)^2+(-3)^2)/sqrt(10))*cos(2*pi*t + 225/180*pi);
s1011 = (sqrt((-1)^2+(-3)^2)/sqrt(10))*cos(2*pi*t + 251.6/180*pi);
s1100 = (sqrt((3)^2+(-1)^2)/sqrt(10))*cos(2*pi*t + 341.6/180*pi);
s1101 = (sqrt((1)^2+(-1)^2)/sqrt(10))*cos(2*pi*t + 315/180*pi);
s1110 = (sqrt((-3)^2+(-1)^2)/sqrt(10))*cos(2*pi*t + 198.4/180*pi);
s1111 = (sqrt((-1)^2+(-1)^2)/sqrt(10))*cos(2*pi*t + 225/180*pi);

subplot(8,2,1);
plot(s0000);
axis([0 5000 -1.5 1.5]);
title('(+3A, +3A) -- 0000','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,2);
plot(s0001);
axis([0 5000 -1.5 1.5]);
title('(+A, +3A) -- 0001','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,3);
plot(s0010);
axis([0 5000 -1.5 1.5]);
title('(-3A, +3A) -- 0010','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,4);
plot(s0011);
axis([0 5000 -1.5 1.5]);
title('(-A, +3A) -- 0011','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,5);
plot(s0100);
axis([0 5000 -1.5 1.5]);
title('(+3A, +A) -- 0100','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,6);
plot(s0101);
axis([0 5000 -1.5 1.5]);
title('(+A, +A) -- 0101','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,7);
plot(s0110);
axis([0 5000 -1.5 1.5]);
title('(-3A, +A) -- 0110','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,8);
plot(s0111);
axis([0 5000 -1.5 1.5]);
title('(-A, +A) -- 0111','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,9);
plot(s1000);
axis([0 5000 -1.5 1.5]);
title('(+3A, -3A) -- 1000','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,10);
plot(s1001);
axis([0 5000 -1.5 1.5]);
title('(+A, -3A) -- 1001','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,11);
plot(s1010);
axis([0 5000 -1.5 1.5]);
title('(-3A, -3A) -- 1010','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,12);
plot(s1011);
axis([0 5000 -1.5 1.5]);
title('(-A, -3A) -- 1011','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,13);
plot(s1100);
axis([0 5000 -1.5 1.5]);
title('(+3A, -A) -- 1100','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,14);
plot(s1101);
axis([0 5000 -1.5 1.5]);
title('(+A, -A) -- 1101','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,15);
plot(s1110);
axis([0 5000 -1.5 1.5]);
title('(-3A, -A) -- 1110','fontname','Times New Roman', 'Color','b','FontSize',10.5);

subplot(8,2,16);
plot(s1111);
axis([0 5000 -1.5 1.5]);
title('(-A, -A) -- 1111','fontname','Times New Roman', 'Color','b','FontSize',10.5);

