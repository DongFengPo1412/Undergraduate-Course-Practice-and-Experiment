`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/15
// Design Name: 
// Module Name: shudian
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

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/15
// Design Name: 
// Module Name: shudian
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

module Converter(
    input [5:0] original,              // 6位原码输入
    input t,                           // 控制变量
    output reg [11:0] bcd,             // BCD输出，12位
    output reg [6:0] twos_complement    // 二进制补码输出，7位
);

// 将原码转换为十进制
function [5:0] to_decimal;
    input [5:0] num;
begin
    if (num[5]) // 如果符号位为1，表示负数
        to_decimal = ({1'b0, num[4:0]}); // 直接返回负值
    else
        to_decimal = num[4:0]; // 正数直接返回
end
endfunction

// BCD转换函数
function [11:0] to_BCD;
    input [5:0] num;
    reg [3:0] tens; // 存储十位数
    reg [3:0] ones; // 存储个位数
    reg [5:0] decimal_value; // 存储十进制值
begin
    decimal_value = to_decimal(num); // 将原码转换为十进制
    tens = decimal_value / 10; // 计算十位数
    ones = decimal_value % 10; // 计算个位数
    
    // 根据符号位决定符号部分
    if (num[5]) // 如果最高位为1，表示负数
        to_BCD = {4'b0001, tens, ones}; // 负数符号，后接十位和个位
    else
        to_BCD = {4'b0000, tens, ones}; // 正数符号，后接十位和个位
end
endfunction

// 二进制补码计算函数
function [6:0] to_twos_complement;
    input [5:0] num;
begin
    if (num[5]) // 若最高位为1，表示负数
        to_twos_complement = {1'b1, ~num[4:0] + 1}; // 取反加一并添加符号位
    else
        to_twos_complement = {1'b0, num[4:0]}; // 正数直接返回并添加符号位
end
endfunction

// 主体逻辑
always @(*) begin
    if (t == 0) begin
        bcd = to_BCD(original); // 转换为BCD
        twos_complement = 7'b0; // 清空补码输出
    end else begin
        twos_complement = to_twos_complement(original); // 转换为二进制补码
        bcd = 12'b0; // 清空BCD输出
    end
end

endmodule
