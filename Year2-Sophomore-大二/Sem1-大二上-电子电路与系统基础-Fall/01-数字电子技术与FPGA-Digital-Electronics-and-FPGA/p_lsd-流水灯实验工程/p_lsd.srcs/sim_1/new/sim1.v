`timescale 1ns / 1ps
module sim1;
reg c=0;
wire [11:0] led;
v1 simuut1(
    .clk(c),   // ±÷” ‰»Î 
    .led(led)   //LED ‰≥ˆ
    );
always #10 c=~c;
endmodule
