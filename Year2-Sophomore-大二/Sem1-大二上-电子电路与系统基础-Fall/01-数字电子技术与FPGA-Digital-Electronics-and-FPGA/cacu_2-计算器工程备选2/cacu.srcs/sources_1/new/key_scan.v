module v_ajxd(
    input clk,
    input btn_clk,
    input [3:0] col,      // 4位列输入信号
    output reg [3:0] row, // 4位行扫描信号
    output reg [15:0] btn_out, // 16位输出，表示按键状态
    output reg [15:0] key_code,
    output  reg start,
    output [2:0] S

);
   
    reg [2:0] S = 2'b10;
    reg [15:0] btn = 0;        // 存储当前按键的状态
    reg [15:0] btn0 = 0;       // 用于消抖
    reg [15:0] btn1 = 0;       // 用于消抖
    reg [15:0] btn2 = 0;       // 用于消抖

    always @ (posedge clk) begin
        if (row == 4'b1000)
            row <= 4'b0001;    // 行扫描到第4行后，重新开始从第1行扫描
        else
            row <= row << 1;   // 每次将行信号左移，依次扫描
    end

    always @ (negedge clk) begin
        case (row)
            4'b0001: btn[3:0] = col;    // 第一行按键
            4'b0010: btn[7:4] = col;    // 第二行按键
            4'b0100: btn[11:8] = col;   // 第三行按键
            4'b1000: btn[15:12] = col;  // 第四行按键
            default: btn = 0;           // 默认清空按键状态
        endcase
    end

    // 按键消抖
    always @ (posedge btn_clk) begin
        btn0 <= btn;
        btn1 <= btn0;
        btn2 <= btn1;
    end

    // 生成按键状态的输出
    always @(*) begin
        case (1'b1)

        (btn2[0] && btn1[0] && btn0[0]) : btn_out = 16'b0000010000000000;  //A
        // 按下2
        (btn2[1] && btn1[1] && btn0[1]) : btn_out = 16'b0000100000000000;  //B
        // 按下3
        (btn2[2] && btn1[2] && btn0[2]) : btn_out = 16'b0000000000000001;  //0
        // 按下A
        (btn2[3] && btn1[3] && btn0[3]) : btn_out = 16'b0001000000000000;  //C
        // 按下4
        (btn2[4] && btn1[4] && btn0[4]) : btn_out = 16'b0010000000000000;  //D
        // 按下5
        (btn2[5] && btn1[5] && btn0[5]) : btn_out = 16'b0000000000001000;  //3
        // 按下6
        (btn2[6] && btn1[6] && btn0[6]) : btn_out = 16'b0000000000000100;  //2
        // 按下B
        (btn2[7] && btn1[7] && btn0[7]) : btn_out = 16'b0000000000000010;   //1
        // 按下7
        (btn2[8] && btn1[8] && btn0[8]) : btn_out = 16'b0100000000000000;  //E
        // 按下8
        (btn2[9] && btn1[9] && btn0[9]) : btn_out = 16'b0000000001000000;   //6
        // 按下9
        (btn2[10] && btn1[10] && btn0[10]) : btn_out = 16'b0000000000100000;  //5
        // 按下C
        (btn2[11] && btn1[11] && btn0[11]) : btn_out = 16'b0000000000010000;  //4
        // 按下*
        (btn2[12] && btn1[12] && btn0[12]) : btn_out = 16'b1000000000000000;  // F
        // 按下0
        (btn2[13] && btn1[13] && btn0[13]) : btn_out = 16'b0000001000000000; // 9
        // 按下#
        (btn2[14] && btn1[14] && btn0[14]) : btn_out = 16'b0000000100000000;  //8
        // 按下D
        (btn2[15] && btn1[15] && btn0[15]) : btn_out = 16'b0000000010000000;  //7
        default: btn_out = 16'b0000000000000000; // 默认情况下为0
        endcase
    end

    always @(*) begin
        case (1'b1)

        (btn2[0] && btn1[0] && btn0[0]) : start = 1;  //A k开始计算
        // 按下2
        (btn2[1] && btn1[1] && btn0[1]) : key_code =16'h2E; //B
        // 按下3
        (btn2[2] && btn1[2] && btn0[2]) : key_code = 16'h30;  //0

        (btn2[4] && btn1[4] && btn0[4]) : S <= 2'b00;  //D
        // 按下5
        (btn2[5] && btn1[5] && btn0[5]) : key_code = 16'h33;  //3
        // 按下6
        (btn2[6] && btn1[6] && btn0[6]) : key_code = 16'h32;  //2
        // 按下B
        (btn2[7] && btn1[7] && btn0[7]) : key_code = 16'h31;   //1
        // 按下7
        (btn2[8] && btn1[8] && btn0[8]) : S <= 2'b11;  //E
        // 按下8
        (btn2[9] && btn1[9] && btn0[9]) : key_code = 16'h36;   //6
        // 按下9
        (btn2[10] && btn1[10] && btn0[10]) : key_code = 16'h35;  //5
        // 按下C
        (btn2[11] && btn1[11] && btn0[11]) : key_code = 16'h34; //4
        // 按下*
        (btn2[12] && btn1[12] && btn0[12]) : S <= 2'b01;  // F  乘法
        // 按下0
        (btn2[13] && btn1[13] && btn0[13]) : key_code = 16'h39; // 9
        // 按下#
        (btn2[14] && btn1[14] && btn0[14]) : key_code = 16'h38;  //8
        // 按下D
        (btn2[15] && btn1[15] && btn0[15]) : key_code = 16'h37;  //7
        default: btn_out = 16'b0000000000000000; // 默认情况下为0
        endcase
    end
endmodule
