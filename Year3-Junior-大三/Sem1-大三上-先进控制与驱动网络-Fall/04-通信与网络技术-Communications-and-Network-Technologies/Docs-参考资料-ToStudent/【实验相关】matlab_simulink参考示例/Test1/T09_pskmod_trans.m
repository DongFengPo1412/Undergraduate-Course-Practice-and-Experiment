clear;
M = 8;  % 调制阶数为xx
data = randi([0 M-1],1000,1);  % 产生随机数
txSig = pskmod(data,M,pi/M);  % 调制数据符号
rxSig = awgn(txSig,20);  % 经过AWGN信道，SNR为 xx dB
scatterplot(rxSig);  % 绘制星座图
axis([-1.5 1.5 -1.5 1.5]);
grid on;