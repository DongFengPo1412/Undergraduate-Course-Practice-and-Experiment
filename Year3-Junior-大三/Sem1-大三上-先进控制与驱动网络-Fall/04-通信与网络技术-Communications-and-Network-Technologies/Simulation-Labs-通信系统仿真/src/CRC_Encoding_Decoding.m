clear;
EbNo = 0:2:10; % SNR 的范围
BIT=16;
ber = berawgn(EbNo,'qam',16);
pmissed = zeros(1, length(EbNo));
for ii = 1:length(EbNo) % 依次仿真不同 EbN0 下的 BER
 BER = ber(ii); % 赋值给 BSC 信道模块中的 BER
 out = sim('CRC3_sim');     % 返回 SimulationOutput 对象
 MissedFrame = out.MissedFrame; % 从对象中取出信号
 pmissed(ii) = MissedFrame(end)/length(MissedFrame);
end
semilogy(EbNo, pmissed, '-ko');
title('Simulink CRC-8 检错性能')
xlabel('Eb/No');ylabel('漏检概率')
grid on;
