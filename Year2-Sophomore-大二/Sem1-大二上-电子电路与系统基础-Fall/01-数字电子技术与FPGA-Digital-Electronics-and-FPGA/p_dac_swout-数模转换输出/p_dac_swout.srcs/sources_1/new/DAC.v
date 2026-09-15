`timescale 1ns / 1ps


module DAC(
   input clk,
   output DAC_CS,
   output DAC_WR,
   output DACAB,
   //output DACCLK,
   output [7:0] DAC_DATA,
   input [11:0] sw,
   output [11:0] led,
   output [7:0] seg,
   output [5:0] an
    );
    
   assign DAC_CS=sw[11];
   assign DAC_WR=sw[10];
   assign DACAB=sw[9];
   assign led=sw;//用于方便查看各个拨码开关的位置
   assign DAC_DATA=sw[7:0];   
   ip_disp a(
        .clk(clk),
       .rst(0),
       .dispdata({16'b0,sw[7:0]}),
       .seg(seg),
       .an(an)
       );
endmodule