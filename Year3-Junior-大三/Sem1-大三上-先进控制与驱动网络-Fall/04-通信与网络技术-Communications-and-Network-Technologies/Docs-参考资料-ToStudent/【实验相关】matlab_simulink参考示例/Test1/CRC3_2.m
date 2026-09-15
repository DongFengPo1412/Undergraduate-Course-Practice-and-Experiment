clear;
BIT= 64;   % ← 每帧消息比特数从 16 改为 64
EbNo = 0:2:10; % SNR 范围
ber = berawgn(EbNo,'qam',16);
pmissed = zeros(1, length(EbNo));
for ii = 1:length(EbNo)
    BER = ber(ii);   % 给 BSC 信道用
    out = sim('L3_Sim_CSC_1.slx');  % 返回 SimulationOutput
    MissedFrame = out.MissedFrame;
    pmissed(ii) = MissedFrame(end)/length(MissedFrame);
end
semilogy(EbNo, pmissed, '-ko');
title('Simulink CRC-8 检错性能')
xlabel('Eb/No'); ylabel('漏检概率')
grid on;
