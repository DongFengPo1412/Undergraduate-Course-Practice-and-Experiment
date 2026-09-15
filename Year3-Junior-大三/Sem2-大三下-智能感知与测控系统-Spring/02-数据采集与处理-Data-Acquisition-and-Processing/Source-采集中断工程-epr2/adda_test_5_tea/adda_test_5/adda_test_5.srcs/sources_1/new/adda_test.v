`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/09 15:57:35
// Design Name: 
// Module Name: adda_test
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


module adda_test(
		input crystal_clk,    //crystal clock
		input key4,						//SFRE:change DAC frequence
		input key3,       		//rd_en，
		input key2,						//wr_en
		input key1,						//rst
		
		input [7:0] addata_in,    //ADC data
		
		output reg[7:0] dadata,  //DAC data
		output  daclk,				//DAC clock
		output adclk,					//ADC clock
		output LED0,				//PLL LOCKED，LED为低电平有效
		output reg LED1,					//fifo full，LED为低电平有效
		output reg LED2,					//WEN，LED为低电平有效
		output reg LED3,					//REN，LED为低电平有效
		output reg status_test
    );

////寄存器定义
reg [8:0] rom_addr;
reg [23:0] accumulator;
reg [7:0] ad_data;
reg [2:0] cnt;
reg [19:0] count;
reg key_scan4; //按键扫描值KEY4
reg key_scan3; //按键扫描值KEY3
reg key_scan2; //按键扫描值KEY2
reg key_scan1; //按键扫描值KEY1
reg key_scan_dly4;
reg key_scan_dly3;
reg key_scan_dly2;
reg key_scan_dly1;
reg flag_key4;
reg flag_key3;
reg flag_key2;
reg flag_key1;
reg fifo_rst;
reg wr_en;
reg rd_en;

reg [23:0]step;
(*KEEP = "TRUE" *)

wire [7:0] fifo_out;
wire [7:0] rom_data;
//(*KEEP = "TRUE" *)
wire clk_25;
wire clk_50;
wire clk_40;
wire clk_30;
wire clk_20;
wire clk_10;
wire fifo_empty;
wire fifo_full;
wire LOCKED;


//////时钟产生模块//////////////////////////
//////由外部晶振50MHz产生出两路内部工作时钟，50MHz和25MHz，分别用于DAC和ADC的工作时钟
///需要添加PLL模块，接口定义如下
PLL PLL_inst
   (// Clock in ports
    .clk_in1(crystal_clk),      // IN
    // Clock out ports
    .clk_out1(daclk),     // OUT 50MHz
    .clk_out2(clk_25),     // OUT 25MHz
    // Status and control signals
    .reset(0),// IN
    .locked(LOCKED));      // OUTA

///输出PLL的锁定标志至LED0
assign LED0 = ~LOCKED;
//assign daclk=clk_50;
assign adclk=clk_25;

////////////按键消抖检测模块////////////////////////
//===========================================================================
// 采样按键值，20ms扫描一次,采样频率小于按键毛刺频率，相当于滤除掉了高频毛刺信号。
//===========================================================================
always @(posedge adclk)     //检测时钟的上升沿
begin
	 if(count ==20'd499_999)   //20ms扫描一次按键,20ms计数(25M/50-1=499_999)
			begin
				count <= 20'b0;      //计数器计到20ms，计数器清零
				key_scan4 <= key4;   //频率修改按键
				key_scan3 <= key3;   //读使能按键
				key_scan2 <= key2;   //写使能按键
				key_scan1 <= key1;   //FIFO复位按键
			end
	 else
			count <= count + 20'b1; //计数器加1
end

always @(posedge adclk)
    begin
		key_scan_dly4 <= key_scan4;  
		key_scan_dly3 <= key_scan3;	
		key_scan_dly2 <= key_scan2;
		key_scan_dly1 <= key_scan1;
		//当检测到按键有下降沿变化时，代表该按键被按下，按键有效
		flag_key4 <= key_scan_dly4 & (~key_scan4);  
		flag_key3 <= key_scan_dly3 & (~key_scan3);
		flag_key2 <= key_scan_dly2 & (~key_scan2);
		flag_key1 <= key_scan_dly1 & (~key_scan1);
	 end

////信号产生模块/////////////////////////
////设置5种读取ROM的步进，调节输出信号频率，输出频率Fo=(50M/512)*step Hz
always @(posedge adclk)  
begin
	if(flag_key4)
	begin
//		if(cnt==4)
//			cnt<=0;
//		else
			cnt<=cnt+3'b1;	
	end
end

always@(posedge adclk)
begin
	case(cnt)
			3'd0:  step <= 336; 		//1 kHz
			3'd1:  step <= 3355;	   //10 kHz
			3'd2:  step <= 33554;   //100 kHz
			3'd3:  step <= 67109;   //200 kHz
			3'd4:  step <= 167772;  //500 kHz
			3'd5:  step <= 335544;  //1000 kHz
			3'd6:  step <= 1677722; //5000 kHz
			3'd7:  step <= 3355443; //10000 kHz
		default:  step <= 336;
	endcase
end

//DA output sin waveform
always @(posedge daclk)
begin
     accumulator[23:0] <= accumulator[23:0] + step ; 
end 

always @(posedge daclk)
begin
     rom_addr[8:0] <= accumulator[23:15] ; 
end 

ROM_WAVE ROM_inst (
  .clka(daclk), // input clka
  .addra(rom_addr), // input [8 : 0] addra
  
  .douta(rom_data) // output rom_data [7 : 0] douta 
);
always @(posedge daclk)
begin
     dadata <= rom_data ; 
end 
//assign dadata=rom_data;

////////// 信号产生模块结束 /////////////

/////信号采样存储模块/////////////////////
///ADC数据接收与存储模块////////////////////////
//
always @(posedge adclk)
begin
      ad_data <= addata_in;  
		
end

/////FIFO复位和读写使能的产生
always @(posedge adclk)  
begin
	if(flag_key1)
	  fifo_rst <=~fifo_rst;////产生FIFO的复位信号
end

always @(posedge adclk)  
begin
	if(flag_key2)
	  wr_en <=~wr_en;////产生FIFO的写使能
end

always @(posedge adclk)  
begin
	if(flag_key3)
	  rd_en <=~rd_en;////产生FIFO的读使能
end



//adfifo
adc_fifo ad_fifo_inst (
  .clk(daclk), // input clk
  .srst(fifo_rst), // input rst
  .din(ad_data), // input [7 : 0] din
  .wr_en(wr_en), // input wr_en
  .rd_en(rd_en), // input rd_en
  
  .dout(fifo_out), // output [7 : 0] dout
  .full(fifo_full), // output full
  .empty(fifo_empty) // output empty
);


always @(posedge adclk)  
begin
	LED1 <= ~fifo_full;  	//输出FIFO的满标志至LED2
	LED2 <= ~wr_en;			//输出FIFO的写使能至LED3
	LED3 <= ~rd_en;			//输出FIFO的读使能至LED4
end


/// 仅仅测试用

always @(posedge adclk)  
begin
	if(fifo_out>127)
		status_test <= fifo_empty;  	//防止部分网络被优化删除
	else
		status_test <= ~fifo_empty; 

end

ILA ILA_INST (
	.clk(adclk), // input wire clk

	.probe0(LED0), // input wire [0:0]  probe0  
	.probe1(LED1), // input wire [0:0]  probe1 
	.probe2(LED2), // input wire [0:0]  probe2 
	.probe3(LED3), // input wire [0:0]  probe3 
	.probe4(fifo_rst), // input wire [0:0]  probe4 
	.probe5(fifo_full), // input wire [0:0]  probe5 
	.probe6(rd_en), // input wire [0:0]  probe6 
	.probe7(wr_en), // input wire [0:0]  probe7 
	.probe8(fifo_empty), // input wire [0:0]  probe8 
	.probe9(ad_data), // input wire [7:0]  probe9 
	.probe10(dadata), // input wire [7:0]  probe10 
	.probe11(fifo_out) // input wire [7:0]  probe11
);

endmodule
