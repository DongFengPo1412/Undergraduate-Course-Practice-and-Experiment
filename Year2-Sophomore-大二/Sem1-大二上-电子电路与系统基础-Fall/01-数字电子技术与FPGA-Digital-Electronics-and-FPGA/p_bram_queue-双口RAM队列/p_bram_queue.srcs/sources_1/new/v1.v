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
 reg [15:0] btn0=0;
 reg [15:0] btn1=0;
 //reg [3:0] row=1; 
 reg [11:0] led; 
 reg [23:0] showdat=0;
 //reg [3:0] reckeyvalue;
ip_disp a(
     .clk(clk),
    .rst(0),
    .dispdata(showdat),
    .seg(seg),
    .an(an)
    );
 divclk my_divclk(.clk(clk),.clk_ms(clk_ms),.btnclk(clk_20ms));    //调用分频没模块
 reg[4:0] i=0;
 wire [15:0] btnms;
 assign btnms=btn0&~btn1;
 always @ (posedge clk_ms)
 begin
    btn0<=btnout;
    btn1<=btn0;
 end
 reg[15:0] temp=0; 
 always @ (posedge clk_ms)
 begin
   led<=btnms[11:0];
   if (|btnms==0)
   begin
       temp=0;
       ena=0;
   end else
   begin
        for(i=0;i<=15;i=i+1)
        if (btnms[i]==1) 
              temp=i;  //获得按键值，值高优先 
        ena = 1;
        dina = temp;
        if (addra==5) addra=0;
        else addra = addra+1;    
   end
              
 end

 
 //要调用BRAM
  
 reg wea=1;//写信号 端口A写使能
 reg web=0;//写信号 端口B初始为写禁止
 reg ena=1;//使能 使能一直有效
 reg enb=1;//使能 使能一直有效
  
 reg [7:0] dina=0;//数据输入
 reg [7:0] dinb=0;//数据输入
  
 reg [2:0] addra=0;//地址输入
 reg [2:0] addrb=5;//地址输入
 wire [7:0] douta;//数据输出
 wire [7:0] doutb;//数据输出
  
   blk_mem_gen_0 UUT1
      (
        .clka(clk_ms),
        .ena(ena),
        .wea(wea),
        .addra(addra),
        .dina(dina),
        .douta(douta),
        .clkb(clk_ms),
        .enb(enb),
        .web(web),
        .addrb(addrb),
        .dinb(dinb),
        .doutb(doutb)
      ); 
    reg [7:0] doutb0=0;
    reg [7:0] doutb1=0;
    reg [7:0] doutb2=0;
     
    always @ (posedge clk_ms)//读取端口B
    begin
        if (addrb==5) addrb<=0;
        else
           addrb<=addrb+1;
        doutb0<=doutb;
        doutb1<=doutb0;
        doutb2<=doutb1;
           
        case (addrb)
           0:showdat[3:0]<=doutb2;
           1:showdat[7:4]<=doutb2;
           2:showdat[11:8]<=doutb2;
           3:showdat[15:12]<=doutb2;
           4:showdat[19:16]<=doutb2;
           5:showdat[23:20]<=doutb2;
 		  default:
           showdat=showdat;
       endcase                     
    end  

 
v_ajxd uut_ajxd(//调用按键消抖动IP
    .clk(clk_ms),
    .btn_clk(clk_20ms),
    .col(col),
    .row(row),
    .btn_out(btnout)
 );
 endmodule