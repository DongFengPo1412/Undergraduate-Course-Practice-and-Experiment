clear;
close all;
EbN0_all = -10:2:10;  % 比特能量与噪声功率谱密度之比的范围，单位dB
for i = 1:length(EbN0_all)  % 依次仿真不同SNR下的误码率情况
    EbN0 = EbN0_all(i);  % 将SNR的值赋给Simulink中的AWGN Channel模块
    sim('T14_Sim_BPSK_5');  % .m脚本调用运行对应的Simulink模块
    ber_sim(i) = ErrorVec(1);  % Simulink中ErrorVec模块中的第一个数，即仿真误码率
end
ber_theory = 1/2*erfc(sqrt(10.^(EbN0_all/10)));  %  AWGN信道下BPSK理论误码率
semilogy(EbN0_all,ber_sim,'-ko',EbN0_all,ber_theory,'-k*');  % Y轴使用对数刻度
grid on;
title('BPSK调制信号在AWGN信道下的性能');
xlabel('Eb/N0');ylabel('误比特率');
legend('仿真误比特率','理论误比特率');