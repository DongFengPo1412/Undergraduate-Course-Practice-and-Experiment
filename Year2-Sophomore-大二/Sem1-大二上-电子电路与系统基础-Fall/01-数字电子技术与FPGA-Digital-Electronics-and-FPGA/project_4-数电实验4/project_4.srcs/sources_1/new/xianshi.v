module display_control (
    input wire clk,                // System clock
    input wire rst,                // Reset signal
    input wire [31:0] ieee754_num, // IEEE 754 floating-point input number
    input wire [7:0] operator,     // Operator to display ('+', '-', '*', etc.)
    input wire [1:0] mode,         // Display mode: 0=input1, 1=operator, 2=input2, 3=result
    output reg [5:0] an,           // Anode control for 6 seven-segment displays
    output reg [7:0] seg           // Cathode control for seven-segment segments
);

    // Internal signals
    reg [3:0] digit[5:0];          // Digits to display (6 digits max)
    reg [19:0] refresh_counter;    // Counter for refreshing display
    reg [2:0] current_digit;       // Currently active digit (0-5)

    // Seven-segment encoding (0-F)
    reg [7:0] seg_encoding [15:0];
    initial begin
        seg_encoding[ 0] = 8'b11000000; // 0
        seg_encoding[ 1] = 8'b11111001; // 1
        seg_encoding[ 2] = 8'b10100100; // 2
        seg_encoding[ 3] = 8'b10110000; // 3
        seg_encoding[ 4] = 8'b10011001; // 4
        seg_encoding[ 5] = 8'b10010010; // 5
        seg_encoding[ 6] = 8'b10000010; // 6
        seg_encoding[ 7] = 8'b11111000; // 7
        seg_encoding[ 8] = 8'b10000000; // 8
        seg_encoding[ 9] = 8'b10010000; // 9
        seg_encoding[10] = 8'b10001000; // A
        seg_encoding[11] = 8'b10000011; // B
        seg_encoding[12] = 8'b11000110; // C
        seg_encoding[13] = 8'b10100001; // D
        seg_encoding[14] = 8'b10000110; // E
        seg_encoding[15] = 8'b10001110; // F
    end

    // Refresh rate logic (1kHz refresh rate assumed)
    always @(posedge clk or posedge rst) begin
        if (rst)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    // Determine active digit based on refresh counter
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_digit <= 0;
        else if (refresh_counter == 0)
            current_digit <= current_digit + 1;
    end

    // Anode control logic
    always @(*) begin
        an = 6'b111111; // Default all off
        case (current_digit)
            0: an = 6'b111110;
            1: an = 6'b111101;
            2: an = 6'b111011;
            3: an = 6'b110111;
            4: an = 6'b101111;
            5: an = 6'b011111;
        endcase
    end

    // IEEE 754 to decimal conversion (simple approximation)
    wire [31:0] integer_part;
    wire [31:0] fractional_part;
    ieee754_to_decimal convertor (
        .ieee754_num(ieee754_num),
        .integer_part(integer_part),
        .fractional_part(fractional_part)
    );

    // Assign digits based on mode
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            digit[0] <= 0;
            digit[1] <= 0;
            digit[2] <= 0;
            digit[3] <= 0;
            digit[4] <= 0;
            digit[5] <= 0;
        end else begin
            case (mode)
                2'b00: begin // Input 1
                    digit[0] <= integer_part % 10;
                    digit[1] <= (integer_part / 10) % 10;
                    digit[2] <= (integer_part / 100) % 10;
                    digit[3] <= fractional_part % 10;
                    digit[4] <= (fractional_part / 10) % 10;
                    digit[5] <= (fractional_part / 100) % 10;
                end
                2'b01: begin // Operator
                    digit[0] <= operator[7:4];
                    digit[1] <= operator[3:0];
                    digit[2] <= 0;
                    digit[3] <= 0;
                    digit[4] <= 0;
                    digit[5] <= 0;
                end
                2'b10: begin // Input 2
                    digit[0] <= integer_part % 10;
                    digit[1] <= (integer_part / 10) % 10;
                    digit[2] <= (integer_part / 100) % 10;
                    digit[3] <= fractional_part % 10;
                    digit[4] <= (fractional_part / 10) % 10;
                    digit[5] <= (fractional_part / 100) % 10;
                end
                2'b11: begin // Result
                    digit[0] <= integer_part % 10;
                    digit[1] <= (integer_part / 10) % 10;
                    digit[2] <= (integer_part / 100) % 10;
                    digit[3] <= fractional_part % 10;
                    digit[4] <= (fractional_part / 10) % 10;
                    digit[5] <= (fractional_part / 100) % 10;
                end
            endcase
        end
    end

    // Cathode control logic
    always @(*) begin
        seg = 8'b11111111; // Default off
        seg = seg_encoding[digit[current_digit]];
    end

endmodule
