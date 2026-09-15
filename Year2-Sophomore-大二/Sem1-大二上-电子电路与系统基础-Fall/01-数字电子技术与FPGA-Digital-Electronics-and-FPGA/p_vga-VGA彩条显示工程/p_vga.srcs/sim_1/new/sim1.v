`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/14 13:09:48
// Design Name: 
// Module Name: sim1
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

module sim1;
	reg clk=0;
	reg[7:0] sw=0;
	wire[7:0] led; 
	wire Hsync;
	wire Vsync;
	wire [3:0] vgaRed;
	wire [3:0] vgaGreen;
	wire [3:0] vgaBlue;
 v1 uut(
	    clk,
	    sw,
	    led,
	    Hsync,
	    Vsync,
	    vgaRed,
	    vgaGreen,
	    vgaBlue
	    );
   always # 10 clk=~clk;   
endmodule
