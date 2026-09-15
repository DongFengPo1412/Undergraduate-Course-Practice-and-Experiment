%% BPSK
clear;
close all;
EbN0_all = -10:2:10; % SNR 的范围
for i = 1:length(EbN0_all)
    EbN0 = EbN0_all(i);
    sim('test_BPSK');
    ber_sim(i) = ErrorVec(1);
end
ber_theory = 1/2*erfc(sqrt(10.^(EbN0_all/10))); % AWGN信道下BPSK理论误码率
semilogy(EbN0_all, ber_sim, '-ko', EbN0_all, ber_theory, '-k*');
grid on;
title('BPSK 调制信号在AWGN 信道下的性能');
xlabel('Eb/N0'); ylabel('误比特率');
legend('仿真误比特率', '理论误比特率');