% 输入信号
subplot(4,1,1);
t = 0:0.001:8;
d = [0 0 ;0.5 1;1 1;1.5 0;2 1 ;2.5 1;3 0;3.5 0];
s = pulstran(t-0.25, d, 'rectpuls', 0.5); plot(t, s); % 采样的非周期矩形，矩形宽度0.5s
axis([0 4 -0.5 1.5]);
title('数字输入信号','Color','b','FontSize',10.5,'FontWeight','Bold');
text(0.25,1.2,'0'); text(0.75,1.2,'1'); text(1.25,1.2,'1'); text(1.75,1.2,'0') ;
text(2.25,1.2,'1'); text(2.75,1.2,'1'); text(3.25,1.2,'0'); text(3.75,1.2,'0') ;
%  I路信号
subplot(4,1,2);
t = 0:0.001:8;
a = 1/sqrt(2);
d = [0 -a ;1 +a;2 -a;3 +a];
s = pulstran(t-0.5, d, 'rectpuls'); plot(t,s) ;
axis([0 4 -2 2]);
title('星座映射I','Color','b','FontSize',10.5,'FontWeight','Bold');
text(0.5,1.5,'-0.7'); text(1.5,1.5,'+0.7'); text(2.5,1.5,'-0.7'); text(3.5,1.5,'+0.7');
% Q路信号
subplot(4,1,3);
t = 0:0.001:8;
d = [0 +a;1 -a;2 -a;3 +a];
s = pulstran(t-0.5, d, 'rectpuls'); plot(t,s) ;
axis([0 4 -2 2]);
title('星座映射Q','Color','b','FontSize',10.5,'FontWeight','Bold');
text(0.5,1.5,'+0.7'); text(1.5,1.5,'-0.7'); text(2.5,1.5,'-0.7'); text(3.5,1.5,'+0.7')
% QPSK调制信号
subplot(4,1,4);
t = 0:0.001:8;
d1 = [0 -a ;1 +a;2 -a;3 +a];
s1 = pulstran(t-0.5, d1, 'rectpuls').*cos(2*pi*5*t) ;
d2 = [0 +a;1 -a;2 -a;3 +a; 4 +a;5 -a;6 -a;7 +a];
s2 = pulstran(t-0.5, d2, 'rectpuls').*sin(2*pi*5*t);
plot(t,s1-s2) ;
axis([0 4 -2 2]);
title('调制信号','Color','b','FontSize',10.5,'FontWeight','Bold');
text(0.3,1.5,'3\pi/4'); text(1.3,1.5, '7\pi/4'); text(2.3,1.5,'5\pi/4'); text(3.3,1.5,'\pi/4') ;