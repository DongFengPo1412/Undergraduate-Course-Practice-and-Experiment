n = 0:1000;
   d0 = sin(0.7217*n)+sin(1.0247*n);
   d1 = sin(0.5364*n)+sin(0.9273*n);
   d2 = sin(0.5364*n)+sin(1.0247*n);
   d3 = sin(0.5364*n)+sin(1.1328*n);
   d4 = sin(0.5906*n)+sin(0.9273*n);
   d5 = sin(0.5906*n)+sin(1.0247*n);
   d6 = sin(0.5906*n)+sin(1.1328*n);
   d7 = sin(0.6535*n)+sin(0.9273*n);
   d8 = sin(0.6535*n)+sin(1.0247*n);
   d9 = sin(0.6535*n)+sin(1.1328*n);
   space = zeros(1,1000);
   phone = [d1 space d8 space d3 space d3 space d9 space d8 space d6 space d1 space d1 space d8 space d0 space];
   sound(phone,8192);

% 假设 d0, d1, ..., d9 分别表示数字 0 到 9 的信号数据
% 可以将这些数据存储在一个数组 cell 中便于迭代
data = {d0, d1, d2, d3, d4, d5, d6, d7, d8, d9};

% 初始化行频和列频的数组，用于存储结果
row_freqs = zeros(1, 10);
col_freqs = zeros(1, 10);

% 遍历每个数字的数据，计算行频和列频
for i = 1:10
    % 获取当前数字的信号数据
    d = data{i};

    % 1. 计算傅里叶变换并取幅值
    y = abs(fft(d, 2048));

    % 2. 找到行频最大值的索引 (行频范围为 y(1:250))
    max_row_value = max(y(1:250));
    row_freq_index = find(abs(y(1:250) - max_row_value) < eps);
    row_freqs(i) = row_freq_index;

    % 3. 找到列频最大值的索引 (假设列频范围为 y(251:500))
    max_col_value = max(y(251:500));
    col_freq_index = find(abs(y(251:500) - max_col_value) < eps) + 250;
    col_freqs(i) = col_freq_index;

    % 输出当前数字的行频和列频位置
    fprintf('数字 %d 的行频为: %d，列频为: %d\n', i-1, row_freq_index, col_freq_index);
end

% 输出结果行频和列频表
fprintf('\n数字的行频和列频查找表:\n');
for i = 1:10
    fprintf('数字 %d: 行频 = %d, 列频 = %d\n', i-1, row_freqs(i), col_freqs(i));
end

y0=abs(fft(d0,2048));               
maxrow0=max(y0(1:150));
row0=find(abs(y0(1:150)-maxrow0) < eps); 
maxcol0=max(y0(1:400));
col0=find(abs(y0(1:400)-maxcol0) < eps); 

y1=abs(fft(d1,2048));               
maxrow1=max(y1(1:150));
row1=find(abs(y1(1:150)-maxrow1) < eps);
maxcol1=max(y1(1:400));
col1=find(abs(y1(1:400)-maxcol1) < eps); 

y2=abs(fft(d2,2048));               
maxrow2=max(y2(1:150));
row2=find(abs(y2(1:150)-maxrow2) < eps);  
maxcol2=max(y2(1:400));
col2=find(abs(y2(1:400)-maxcol2) < eps); 

y3=abs(fft(d3,2048));               
maxrow3=max(y3(1:150));
row3=find(abs(y3(1:150)-maxrow3) < eps);  
maxcol3=max(y3(1:400));
col3=find(abs(y3(1:400)-maxcol3) < eps); 

y4=abs(fft(d4,2048));               
maxrow4=max(y4(1:150));
row4=find(abs(y4(1:150)-maxrow4) < eps);  
maxcol4=max(y4(1:400));
col4=find(abs(y4(1:400)-maxcol4) < eps); 

y5=abs(fft(d5,2048));               
maxrow5=max(y5(1:150));
row5=find(abs(y5(1:150)-maxrow5) < eps);  
maxcol5=max(y5(1:400));
col5=find(abs(y5(1:400)-maxcol5) < eps); 

y6=abs(fft(d6,2048));               
maxrow6=max(y6(1:150));
row6=find(abs(y6(1:150)-maxrow6) < eps);  
maxcol6=max(y6(1:400));
col6=find(abs(y6(1:400)-maxcol6) < eps); 

y7=abs(fft(d7,2048));               
maxrow7=max(y7(1:150));
row7=find(abs(y7(1:150)-maxrow7) < eps);  
maxcol7=max(y7(1:400));
col7=find(abs(y7(1:400)-maxcol7) < eps); 

y8=abs(fft(d8,2048));               
maxrow8=max(y8(1:150));
row8=find(abs(y8(1:150)-maxrow8) < eps);  
maxcol8=max(y8(1:400));
col8=find(abs(y8(1:400)-maxcol8) < eps); 

y9=abs(fft(d9,2048));               
maxrow9=max(y9(1:150));
row9=find(abs(y9(1:150)-maxrow9) < eps);  
maxcol9=max(y9(1:400));
col9=find(abs(y9(1:400)-maxcol9) < eps); 