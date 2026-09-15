`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/27 13:32:09
// Design Name: 
// Module Name: fangzhen1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module code_converter_tb;
    // 仿真信号
    reg [5:0] original_code; // 6位原码输入
    reg T;               // 控制信号
    wire [11:0] BCD_code;     // BCD码输出
    wire [5:0] comp_code;     // 补码输出

    // 实例化待测模块
    code_converter uut (
        .original_code(original_code),
        .T(T),
        .BCD_code(BCD_code),
        .comp_code(comp_code)
    );

    // 测试过程
    initial begin
        // 仿真结果显示
        $monitor("Time = %0t | T = %b | original_code = %b | BCD_code = %b | comp_code = %b", $time, T, original_code, BCD_code, comp_code);
        
        // 测试 T = 0 的情况（转换为BCD码）
        T = 0;
        
        // 测试正数原码
        original_code = 6'b000101; // +5
        #10;
        
        original_code = 6'b001111; // +15
        #10;
        
        original_code = 6'b011111; // +31
        #10;
        
        // 测试负数原码
        original_code = 6'b100101; // -5
        #10;
        
        original_code = 6'b110001; // -15
        #10;
        
        original_code = 6'b111111; // -1
        #10;

        // 测试 T = 1 的情况（转换为补码）
        T = 1;

        // 测试正数原码
        original_code = 6'b000101; // +5
        #10;

        original_code = 6'b001111; // +15
        #10;
        
       original_code = 6'b011111; // +31
        #10;

        // 测试负数原码
        original_code = 6'b100101; // -5
        #10;
        
        original_code = 6'b110001; // -15
        #10;
        
        original_code = 6'b111111; // -1
        #10;

        $stop; // 结束仿真
    end
endmodule