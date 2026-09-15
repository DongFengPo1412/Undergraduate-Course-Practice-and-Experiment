`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 行列按键，只是用一行 消抖后得到20MS整数倍的按键波形，高有效
//LED显示对应按键，数码管显示LED值
//需要注意约束文件中将行作为输出，列作为输入，列必须下拉（没按时读到0）
//卢有亮 2018.06.18
//////////////////////////////////////////////////////////////////////////////////
module v1(
    input clk,
    input [11:0] sw,
    input [3:0] col,
    output [3:0] row,
    output [11:0] led,
    output [7:0] seg,
    output [5:0] an
    );
 wire clk_ms,clk_20ms;
 wire [15:0] btnout;
 //reg [3:0] row=1; 
 reg [11:0] led; 
 reg [23:0] showdat=0;
ip_disp a(
     .clk(clk),
    .rst(0),
    .dispdata(showdat),
    .seg(seg),
    .an(an)
    );
 divclk my_divclk(.clk(clk),.clk_ms(clk_ms),.btnclk(clk_20ms));    //调用分频没模块
 reg[4:0] i=0;
 always @ (posedge clk_ms)
 begin
   led<=btnout[11:0];
   for(i=0;i<=15;i=i+1)
     if (btnout[i]==1) 
              showdat<=i;   
 end
// reg[15:0] r1,r2;
// always @ (posedge clk_ms)
// begin
// 	r1<=btnout;
// 	r2<=r1;
// 	if (r1&~r2)
// 	 your process of key; 	
// end
 
v_ajxd uut_ajxd(//调用按键消抖动IP
    .clk(clk_ms),
    .btn_clk(clk_20ms),
    .col(col),
    .row(row),
    .btn_out(btnout)
 );
 endmodule