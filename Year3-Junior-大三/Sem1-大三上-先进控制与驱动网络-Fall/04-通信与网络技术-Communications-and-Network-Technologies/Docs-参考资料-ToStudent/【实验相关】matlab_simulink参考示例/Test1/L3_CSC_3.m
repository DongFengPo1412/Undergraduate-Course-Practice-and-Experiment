clear; 
EbNo = 0:2:10;  % SNR 的范围 
ber = berawgn(EbNo,'qam',16); 
pmissed = zeros(1, length(EbNo)); 
for ii = 1:length(EbNo)  % 依次仿真不同 EbN0 下的BER 
    BER = ber(ii);  % 赋值给BSC信道模块中的BER 
    sim('L3_Sim_CSC_1.slx');  % .m 脚本调用运行对应的 Simulink模块 
    pmissed(ii) = MissedFrame(end)/length(MissedFrame);  % 本次仿真得到的漏检概率  
end 
semilogy(EbNo, pmissed, '-ko'); 
title('Simulink CRC-8 检错性能') 
xlabel('Eb/No');ylabel('漏检概率') 
grid on;