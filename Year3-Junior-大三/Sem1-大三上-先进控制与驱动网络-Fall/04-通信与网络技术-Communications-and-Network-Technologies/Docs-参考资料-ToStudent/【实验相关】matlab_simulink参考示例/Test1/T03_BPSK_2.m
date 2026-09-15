clear;
% 输入信号
subplot(3,1,1);
t = 0:0.001:4;
d = [0 0 ;1 1 ;2 1 ;3 0];  % 第1列对应偏移量，第2列对应增益量
s = pulstran(t-0.5, d, 'rectpuls'); plot(t, s);  % 采样的非周期矩形，矩形宽度1s
axis([0 4 -0.5 1.5]);
title('数字输入信号','Color','b','FontSize',10.5,'FontWeight','Bold');
text(0.5,1.2,'0') ; text(1.5,1.2,'1') ; text(2.5,1.2,'1') ; text(3.5,1.2,'0') ;
%  BPSK基带调制信号
subplot(3,1,2);
t = 0:0.001:8;
d = [0 +1 ;1 -1;2 -1;3 +1];
s = pulstran(t-0.5,d,'rectpuls'); plot(t, s) ;
axis([0 4 -1.5 1.5]);
title('星座映射','Color','b','FontSize',10.5,'FontWeight','Bold');
text(0.5,1.2,'+1') ; text(1.5,1.2,'-1') ; text(2.5,1.2,'-1') ; text(3.5,1.2,'+1') ;
% BPSK频带调制信号
subplot(3,1,3);
t = 0:0.001:8;
d = [0 +1 ;1 -1;2 -1;3 +1];
s = pulstran(t-0.5,d,'rectpuls').*cos(2*pi*5*t); plot(t, s) ;
axis([0 4 -1.5 1.5]);
title('调制信号','Color','b','FontSize',10.5,'FontWeight','Bold');
text(0.5,1.2,'0') ; text(1.5,1.2, '\pi') ; text(2.5,1.2,'\pi') ; text(3.5,1.2,'0') ;