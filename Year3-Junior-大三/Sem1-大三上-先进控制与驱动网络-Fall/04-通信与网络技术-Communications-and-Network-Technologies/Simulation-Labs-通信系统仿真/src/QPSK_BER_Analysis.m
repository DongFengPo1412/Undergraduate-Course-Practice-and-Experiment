clear;
close all;
EsN0_all = -10:2:10; % 符号能量与噪声功率谱密度之比的范围，单位 dB
for i = 1:length(EsN0_all) % 依次仿真不同 EsN0 下的误码率情况
 EsN0 = EsN0_all(i); % 将 EsN0 的值赋给 Simulink 中的 AWGN Channel 模块
 sim('T15_Sim_QPSK_1'); % .m 脚本调用运行对应的 Simulink 模块
 ser_sim(i) = ErrorVec(1); % Simulink 中 ErrorVec 模块中的第一个数，即仿真误码率
end
snr = 10.^(EsN0_all/10); % 信噪比转为线性值
ser_theory = erfc(sqrt(snr/2)).*(1 - erfc(sqrt(snr/2))/4); % AWGN 信道下 QPSK 理论误符号率
semilogy(EsN0_all,ser_sim,'-ko',EsN0_all,ser_theory,'-k*');
grid on;
title('QPSK 调制信号在 AWGN 信道下的性能');
xlabel('Es/N0'); ylabel('误符号率');
legend('仿真误符号率','理论误符号率');