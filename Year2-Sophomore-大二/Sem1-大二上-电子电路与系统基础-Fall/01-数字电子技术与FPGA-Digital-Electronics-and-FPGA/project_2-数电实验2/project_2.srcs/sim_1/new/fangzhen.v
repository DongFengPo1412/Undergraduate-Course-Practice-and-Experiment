`timescale 1ns / 1ps

module Converter_tb;

    // 输入信号
    reg [5:0] original;       // 6位原码输入
    reg t;                    // 控制变量

    // 输出信号
    wire [11:0] bcd;         // BCD输出，12位
    wire [6:0] twos_complement; // 二进制补码输出，7位

    // 实例化Converter模块
    Converter uut (
        .original(original),
        .t(t),
        .bcd(bcd),
        .twos_complement(twos_complement)
    );

    // 测试过程
    initial begin
        // 初始化输入
        original = 6'b000000; // 0
        t = 0;                // 测试BCD转换
        #10;                  // 等待10ns

        // 测试正数
        original = 6'b000011; // 3
        t = 0;                // 测试BCD转换
        #10;

        original = 6'b000101; // 5
        t = 0;                // 测试BCD转换
        #10;

        original = 6'b001001; // 9
        t = 0;                // 测试BCD转换
        #10;

        // 测试负数
        original = 6'b110100; // -12
        t = 0;                // 测试BCD转换
        #10;

        original = 6'b111111; // -1
        t = 0;                // 测试BCD转换
        #10;

        // 测试控制变量t = 1
        original = 6'b000011; // 3
        t = 1;                // 测试补码转换
        #10;

        original = 6'b001010; // 10
        t = 1;                // 测试补码转换
        #10;

        original = 6'b101100; // -12
        t = 1;                // 测试补码转换
        #10;

        original = 6'b111111; // -1
        t = 1;                // 测试补码转换
        #10;

        // 结束仿真
        $finish;
    end

    // 监控信号变化
    initial begin
        $monitor("Time: %0t | original: %b | t: %b | BCD: %b | Two's Complement: %b", 
                 $time, original, t, bcd, twos_complement);
    end

endmodule