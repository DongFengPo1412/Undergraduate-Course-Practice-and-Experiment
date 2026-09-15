`timescale 1ns / 1ps
module v1(
    input clk,   //时钟输入 
    output [11:0] led   //LED输出
    );
    reg[11:0] ledtemp = 12'b0000_0000_0001;   //led初始值
    reg[31:0] divclk_cnt = 0;          //32位计数器
    reg divclk = 0;                    //低频时钟
    assign led=ledtemp;                //实现将寄存器变量值赋给LED输出
    parameter halfduty_cntvalue=4;//12500000;
    always@(posedge clk) //把系统时钟分频 50M/25 000 000= 2HZ
    begin
        if(divclk_cnt==halfduty_cntvalue)  //计数满后翻转 
        begin
            divclk =~ divclk;
            divclk_cnt = 0;
        end
        else
        begin
             divclk_cnt = divclk_cnt+1'b1;
        end
    end
    always@(posedge divclk )
    begin
	   if(ledtemp[11] == 1)   
            ledtemp = 12'b0000_0000_0001;    //实现循环移位
       else   
            ledtemp = ledtemp << 1;   //左移1位
    end
endmodule
