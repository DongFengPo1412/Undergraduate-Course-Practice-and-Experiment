//module seg_disp #(
//    parameter       TCLK                    =   20      ,//系统时钟周期，单位ns。
//    parameter       TIME_20US               =   20_000  ,//数码管刷新时间，默认20us。
//    parameter       SEG_NUM                 =   8        //需要显示的数码管个数。
//)(
//    //输入信号定义
//    input                                       clk     ,//系统时钟，50MHz。
//    input                                       rst_n   ,//系统复位，低电平有效。

//    input           [(SEG_NUM * 4) - 1  :0]     din     ,//需要数码管显示的BCD码数码；
//    //输出信号定义
//    output reg      [7 : 0]                     segment ,//数码管的数据线；
//    output reg      [SEG_NUM - 1 : 0]           seg_sel ,//数码管的位选信号；
//    output reg                                  dout_vld //为高电平时，表示段选和位选信号有效；
//);
//    //参数定义
//    localparam      TIME                    =   TIME_20US/TCLK  ;
//    localparam      TIME_W                  =   clogb2(TIME-1)  ;//计算数码管扫描时间的时钟数据位宽；
//    localparam      SEG_W                   =   clogb2(SEG_NUM) ;
//    localparam      ZERO                    =   8'h3F  ; //8'hC0;前面的数据是共阴数码管使用的，后面数据是共阳数码管使用的；
//    localparam      ONE                     =   8'h06  ; //8'hF9;
//    localparam      TWO                     =   8'h5B  ; //8'hA4;
//    localparam      THREE                   =   8'h4F  ; //8'hB0;
//    localparam      FOUR                    =   8'h66  ; //8'h99;
//    localparam      FIVE                    =   8'h6D  ; //8'h92;
//    localparam      SIX                     =   8'h7D  ; //8'h82;
//    localparam      SEVEN                   =   8'h07  ; //8'hF8;
//    localparam      EIGHT                   =   8'h7F  ; //8'h80;
//    localparam      NINE                    =   8'h6F  ; //8'h90;
//    localparam      ERR                     =   8'h77  ; //8'h86;

//    //中间信号定义
//    reg             [3 : 0]                     sel_result  ;
//    reg             [SEG_W - 1 : 0]             sel         ;
//    reg             [SEG_W - 1 : 0]             sel_ff0     ;
//    reg             [TIME_W - 1 : 0]            cnt_20us    ;
//    reg                                         add_sel_r   ;//

//    wire                                        end_cnt_20us;
//    wire                                        add_sel     ;
//    wire                                        end_sel     ;

//    //自动计算位宽的函数；
//    function integer clogb2(input integer depth);
//        begin
//            if(depth==0)
//                clogb2=1;
//            else if(depth!=0)
//                for(clogb2=0; depth>0;clogb2=clogb2+1)
//                    depth=depth>>1;
//        end
//    endfunction

//    //20us计数器,用于对一个数码管点亮的持续时间进行计数，计数器初始值为0，对
//    always@(posedge clk or negedge rst_n)begin
//        if(!rst_n)begin//计数器初始值为0；
//            cnt_20us <= 0;
//        end
//        else if(end_cnt_20us)begin//当计数器计数到20us时，表示一个数码管已经被点亮20US了，将计数器清零；
//            cnt_20us <= 0;
//        end
//        else begin//否则，计数器加一；
//            cnt_20us <= cnt_20us + 1'b1;
//        end
//    end

//    //计数器结束条件，当计数器计数到TIME-1时表示20US已经到了，将计数器清零；
//    assign end_cnt_20us = cnt_20us == TIME - 1;

//    //计数器sel，用于计数此时点亮的时第几个数码管，上电复位时点亮第零个数码管，所以初始值为0，之后当计数器cnt_20us计数结束时，表示一个数码管点亮时间已经到了，此时计数器sel加一，表示该点亮下一个计数器了，当点亮SEG_NUM-1个计数器完成（end_sel有效）时表示数码管都被点亮了一次，此时计数器sel清零，又从第一个数码管开始点亮；
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0；
//            sel <= 0;
//        end
//        else if(add_sel) begin
//            if(end_sel)//当计数器sel计数结束时，计数器清零；
//                sel <= 0;
//            else
//                sel <= sel + 1;
//        end
//    end
//    assign add_sel = end_cnt_20us;//计数器sel的加一条件是，计数器cnt_20us计数器结束；
//    assign end_sel = add_sel && sel == SEG_NUM - 1;//计数器sel计数到SEL_NUM-1时，计数器sel清零；

//    //sel_result信号是当前被点亮数码管需要显示的数据，根据计数器sel的值确定此时应该将输入信号的哪几位数据译码输出给数码管进行显示；
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0；
//            sel_result <= 4'd0;
//        end
//        else if(add_sel)begin//取输入信号din[4*sel+3 : 4*sel]信号给译码部分进行译码，之后输出给数码管数据信号驱动数码管显示该数据；
//            sel_result <= din[4*sel+3 -: 4];//{din[4*sel+3],din[4*sel+2],din[4*sel+1],din[4*sel]};
//        end
//    end

//    //译码器部分，将sel_result十进制信号译码成数码管显示该数字对应的八位数据信号；
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始上电时，所有数码管显示数据0；
//            segment <= ZERO;
//        end
//        else if(add_sel_r)begin
//            case(sel_result)//将sel_result译码成对应的segment数据，segment数据驱动数码管才能显示sel_result代表的数字；
//                0: segment <= ZERO ;//想要数码管显示0，就要给数码管数据信号segment输入ZERO数据，其余类似；
//                1: segment <= ONE  ;
//                2: segment <= TWO  ;
//                3: segment <= THREE;
//                4: segment <= FOUR ;
//                5: segment <= FIVE ;
//                6: segment <= SIX  ;
//                7: segment <= SEVEN;
//                8: segment <= EIGHT;
//                9: segment <= NINE ;
//                default: segment <= ERR;
//            endcase
//        end
//    end

//    //为了与段选动态扫描，保持同步，此时位选应该打一拍再赋给位选信号 seg_sel
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin
//            sel_ff0 <= 0;
//        end
//        else if(add_sel)begin
//            sel_ff0 <= sel;
//        end
//    end

//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0，全部数码管被点亮；
//            seg_sel <= {{SEG_NUM}{1'b0}};
//        end
//        else if(add_sel_r)begin//将1右移sel_ff0位之后取反，seg_sel的第sel_ff0输出低电平，对应的第sel_ff0个数码管被点亮了，其余位输出高电平，对应的数码管熄灭；
//            seg_sel <= ~({1'b1,{{SEG_NUM-1}{1'b0}}} >> sel_ff0);//~(6'h1<<sel_ff0);
//        end
//    end

//    //移位寄存器，将数据更新的指示信号暂存；
//    //dout_vld与segment、seg_sel对齐。
//    always@(posedge clk)begin
//        add_sel_r <= add_sel;
//        dout_vld <= add_sel_r;
//    end

//endmodule