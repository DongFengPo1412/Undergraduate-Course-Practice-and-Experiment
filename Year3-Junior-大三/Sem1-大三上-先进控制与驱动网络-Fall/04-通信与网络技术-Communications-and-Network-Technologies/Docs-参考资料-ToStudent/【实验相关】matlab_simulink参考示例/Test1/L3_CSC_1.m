clear; 
poly_g = [1 0 0 1 1];  % 生成多项式G(x)=x^4+x+1，CRC-4 
len_r = length(poly_g) - 1;  % CRC码的长度：生成多项式长度减1 
len_data = 256;  % 消息比特数 
msg_init = randi(2,1,len_data)-1;  % 消息比特 
msg_temp = [msg_init zeros(1,len_r)];  % 消息比特左移 
[q, r] = deconv(msg_temp, poly_g);  % 多项式除法求CRC码，q为商，r为余数  
 
crc_code = mod(r(end - len_r + 1: end), 2);  % 取余数的最后len_r位模2运算 
msg_tx = [msg_init crc_code];  % 发送帧：原始数据 + 校验冗余码 
%% 解码验证：将接收到的16+R位编码和生成多项式相除 
[q, r] = deconv(msg_tx, poly_g);  
msg_rx = mod(r(end - len_r + 1: end), 2); 
disp(msg_rx)    %如果正确，得到余数全是0 
%% 检错验证：手动传错 
msg_tx_err = msg_tx; 
msg_tx_err(2) = 1 - msg_tx_err(2);  % 假设第二位出现错误 
[q, r] = deconv(msg_tx_err,poly_g); 
msg_rx = mod(r(end - len_r + 1: end), 2); 
disp(msg_rx)