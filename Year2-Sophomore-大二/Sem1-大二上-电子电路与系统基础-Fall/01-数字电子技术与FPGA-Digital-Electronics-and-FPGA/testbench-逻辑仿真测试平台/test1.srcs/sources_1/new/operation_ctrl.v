//module operation_ctrl (
//    //输入信号定义
//    input                           clk             ,//系统时钟，50MHz。
//    input                           rst_n           ,//系统复位，低电平有效。

//    input       [3 : 0]             din_key         ,//按键按下的数值；
//    input                           din_key_vld     ,//按下指示信号，高电平有效；
//    input                           mult_vld        ,//乘法模块运算结果有效指示信号；
//    input       [26 : 0]            mult_in         ,//乘法模块运算结果；
//    //输出信号定义
//    output reg                      mult_en         ,//乘法模块使能信号；
//    output reg  [26 : 0]            data1           ,//被乘数或者被除数数据；
//    output reg  [26 : 0]            data2           ,//乘数或者除数数据；
//    output reg  [26 : 0]            dout             //输出数码管需要显示的数据；
//);
//    localparam 	IDLE        =       5'b00001        ;//状态机的空闲状态编码；
//    localparam 	IDATA1      =       5'b00010        ;//状态机的输入参数1状态编码；
//    localparam 	OPERAT      =       5'b00100        ;//状态机的输入运算符状态编码；
//    localparam 	IDATA2      =       5'b01000        ;//状态机的输入参数2状态编码；
//    localparam 	RESULT      =       5'b10000        ;//状态机的计算结果状态编码；
    
//    reg                             number_flag     ;//高电平表示由数字按键被按下；
//    reg                             operat_flag     ;//高电平表示有运算符按键被按下；
//    reg                             din_key_vld_r0  ;//
//    reg                             din_key_vld_r1  ;
//    reg         [1 : 0]             operation       ;//
//    reg         [3 : 0]             din_key_r0      ;//
//    reg         [3 : 0]             din_key_r1      ;//
//    reg         [4 : 0]	            state_n         ;
//    reg         [4 : 0]	            state_c         ;
//    reg         [3 : 0]             key_value       ;//
//    reg                             operat_flag_r   ;

//    wire		                    idl2idata1_start    ;
//    wire                            operat2idata2_start ;
//    wire		                    idata12operat_start ;
//    wire                            idata22result_start ;
//    wire                            result2idata1_start ;
//    wire                            result2operat_start ;
    
//    //The first section: synchronous timing always module, formatted to describe the transfer of the secondary register to the live register ?
//    always@(posedge clk or negedge rst_n)begin
//        if(!rst_n)begin
//            state_c <= IDLE;
//        end
//        else if(din_key_vld && din_key==13)begin//按下清除按键时，状态机回到空闲状态；
//            state_c <= IDLE;
//        end
//        else begin
//            state_c <= state_n;
//        end
//    end
    
//    //The second paragraph: The combinational logic always module describes the state transition condition judgment.
//    always@(*)begin
//        case(state_c)
//            IDLE:begin
//                if(idl2idata1_start)begin
//                    state_n = IDATA1;
//                end
//                else begin
//                    state_n = state_c;
//                end
//            end
//            IDATA1:begin
//                if(idata12operat_start)begin
//                    state_n = OPERAT;
//                end
//                else begin
//                    state_n = state_c;
//                end
//            end
//            OPERAT:begin
//                if(operat2idata2_start)begin
//                    state_n = IDATA2;
//                end
//                else begin
//                    state_n = state_c;
//                end
//            end
//            IDATA2:begin
//                if(idata22result_start)begin
//                    state_n = RESULT;
//                end
//                else begin
//                    state_n = state_c;
//                end
//            end
//            RESULT:begin
//                if(result2idata1_start)begin
//                    state_n = IDATA1;
//                end
//                else if(result2operat_start)begin
//                    state_n = OPERAT;
//                end
//                else begin
//                    state_n = state_c;
//                end
//            end
//            default:begin
//                state_n = IDLE;
//            end
//        endcase
//    end

//    // Third paragraph: Design transfer conditions；
//    assign idl2idata1_start    = ((state_c == IDLE) && (number_flag));//空闲状态下有数字按键按下；
//    assign idata12operat_start = ((state_c == IDATA1) && (operat_flag));//在输入数据1状态下，有运算符按键按下；
//    assign operat2idata2_start = ((state_c == OPERAT) && (number_flag));//在输入运算符状态下，有数字按键被按下；
//    assign idata22result_start = ((state_c == IDATA2) && (din_key_vld && din_key==14));//在输入数据2状态下，等号被按下； 
//    assign result2idata1_start = ((state_c == RESULT) && (number_flag));//在输出运算结果的状态下，有数字按键被按下；
//    assign result2operat_start = ((state_c == RESULT) && (operat_flag));//在输出运算结果的状态下，有运算符被按下；
    
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0;
//            number_flag <= 1'b0;
//        end
//        else begin//数字按键按下时位高电平，其余时间均为低电平；
//            number_flag <= din_key_vld && (din_key != 3) && (din_key != 7) && (din_key != 11) && (din_key != 13) && (din_key != 14) && (din_key != 15);
//        end
//    end
    
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0;
//            operat_flag <= 1'b0;
//        end
//        else begin//运算符按键按下时位高电平，其余时间均为低电平；
//            operat_flag <= din_key_vld && ((din_key == 3) || (din_key == 7) || (din_key == 11) || (din_key == 15));
//        end
//    end
    
//    //对按键的输入信号进行暂存；
//    always@(posedge clk)begin
//        operat_flag_r <= operat_flag;
//        {din_key_r1,din_key_r0} <= {din_key_r0,din_key};//将输入的按键信号延迟两个时钟周期，与state_c信号对齐；
//        {din_key_vld_r1,din_key_vld_r0} <= {din_key_vld_r0,din_key_vld};//将输入的按键有效指示信号延迟两个时钟周期，与state_c信号对齐；
//    end
    
//    //当按下数字按键时，将数字按键译码成对应数字，key_value与din_key_vld_r1对齐；
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0;
//            key_value <= 4'd0;
//        end
//        else if(din_key_vld_r0)begin
//            case(din_key_r0)//当按下数字按键时，将数字按键译码成对应数字；
//                    4'd0  : key_value <= 4'd1;
//                    4'd1  : key_value <= 4'd2;
//                    4'd2  : key_value <= 4'd3;
//                    4'd4  : key_value <= 4'd4;
//                    4'd5  : key_value <= 4'd5;
//                    4'd6  : key_value <= 4'd6;
//                    4'd8  : key_value <= 4'd7;
//                    4'd9  : key_value <= 4'd8;
//                    4'd10 : key_value <= 4'd9;
//                    4'd12 : key_value <= 4'd0;
//                default : key_value <= 4'd0;
//            endcase
//        end
//    end

//    //对运算进行保存，0表示加法运算，1表示减法运算，2表示乘法运算，3表示除法运算。
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0;
//            operation <= 2'd0;
//        end
//        else if((state_c == OPERAT) && din_key_vld_r1)begin
//            case(din_key_r1)//当在符号状态下按下对应符号按键时，进行译码保存。
//                        4'd3  : operation <= 2'd0;
//                        4'd7  : operation <= 2'd1;
//                        4'd11 : operation <= 2'd2;
//                        4'd15 : operation <= 2'd3;
//                default: operation <= 2'd0;//默认进行加法运算；
//            endcase
//        end
//    end
    
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0;
//            data1 <= 14'd0;
//        end//当跳转到IDATA1状态时，将该数据清零；
//        else if(idl2idata1_start || result2idata1_start)begin
//            data1 <= 14'd0;
//        end//如果从输出结果状态跳转到输入符号状态，说明是进行连续运算，则将上次输出结果作为数据1；
//        else if(result2operat_start)begin
//            data1 <= dout;
//        end
//        //将原始数据乘以10，此处采用移位实现，然后加上输入数据，就可以表示当前数据；
//        else if(din_key_vld_r1 && (state_c == IDATA1))begin
//            data1 <= (data1 << 3) + (data1 << 1) + key_value;
//        end
//    end

//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0;
//            data2 <= 14'd0;
//        end//当跳转到IDATA2状态时，将该数据清零；
//        else if(operat2idata2_start)begin
//            data2 <= 14'd0;
//        end//将原始数据乘以10，此处采用移位实现，然后加上输入数据，就可以表示当前数据；
//        else if(~operat_flag_r && din_key_vld_r1 && (state_c == IDATA2))begin
//            data2 <= (data2 << 3) + (data2 << 1) + key_value;
//        end
//    end

//    //对输出结果进行运算；
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0;
//            dout <= 27'd0;
//        end
//        else if(state_c == IDATA1)begin//在输入数据1阶段显示输入的数据1；
//            dout <= data1;
//        end
//        else if(state_c == IDATA2)begin//在输入数据2阶段显示输入的数据2；
//            dout <= data2;
//        end
//        else if(state_c == RESULT)begin//在输出结果阶段,进行相关运算并输出进行显示；
//            case (operation)
//                    2'd0 : dout <= data1 + data2;
//                    2'd1 : dout <= data1 - data2;
//                    2'd2 : if(mult_vld) dout <= mult_in;
//                    2'd3 : if(div_vld) dout <= div_in;
//                default : dout <= dout;
//            endcase
//        end
//        else if(state_c == IDLE)begin//其他时候数码管显示0；
//            dout <= 27'd0;
//        end
//    end
//    //生成乘法模块或者除法模块使能信号；
//    always@(posedge clk or negedge rst_n)begin
//        if(rst_n==1'b0)begin//初始值为0;
//            mult_en <= 1'b0;
//            div_en  <= 1'b0;
//        end
//        else begin//当状态机跳转到运算结果的状且进行乘法运算，则将乘法运算的使能信号拉高；
//            mult_en <= (idata22result_start && (operation == 2'd2));
//            div_en <= (idata22result_start && (operation == 2'd3));
//        end
//    end

//endmodule