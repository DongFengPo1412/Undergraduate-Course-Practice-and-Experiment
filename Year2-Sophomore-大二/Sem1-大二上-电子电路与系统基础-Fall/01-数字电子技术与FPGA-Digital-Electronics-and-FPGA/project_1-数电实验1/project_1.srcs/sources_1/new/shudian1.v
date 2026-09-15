`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/27 13:28:34
// Design Name: 
// Module Name: shudian1
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

module code_converter(
    input [5:0] original_code,  // 6-bit sign-magnitude original code
    input T,                    // Control variable
    output reg [11:0] BCD_code, // 12-bit BCD code
    output reg [5:0] comp_code  // 6-bit two's complement code
);

    // Temporary variables
    reg [4:0] magnitude;        // Stores the magnitude (absolute value)
    reg sign;                   // Sign bit (1 for negative, 0 for positive)
    
    // Always block to compute outputs based on T
    always @(*) begin
        sign = original_code[5];         // Extract the sign bit
        magnitude = original_code[4:0];  // Extract the magnitude (5 bits)
        
        if (T == 0) begin
            // Convert to BCD format
            BCD_code[11:8] = sign ? 4'b1001 : 4'b0000;  // 1001 for negative, 0000 for positive
            BCD_code[7:4] = (magnitude / 10) % 10;      // Tens place
            BCD_code[3:0] = magnitude % 10;             // Units place
            
            // Zero out the two's complement output
            comp_code = 6'b000000;
        end else begin
            // Convert to two's complement format
            comp_code = sign ? (~magnitude + 1) : magnitude;
            
            // Zero out the BCD output
            BCD_code = 12'b000000000000;
        end
    end
    
endmodule