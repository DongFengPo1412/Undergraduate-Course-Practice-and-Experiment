module control_logic (
    input wire clk,                   // System clock
    input wire rst,                   // Reset signal
    input wire valid_key,             // Signal indicating valid key press
    input wire [7:0] key,             // Key value from the keyboard input module
    output reg [31:0] num1,           // First operand (IEEE 754 format)
    output reg [31:0] num2,           // Second operand (IEEE 754 format)
    output reg [7:0] operator,        // Operator (+, -, *)
    output reg calculate,             // Signal to trigger calculation
    input wire [31:0] result,         // Result from the floating-point calculation module
    output reg [1:0] display_mode     // Mode signal for the display control module
);

    // States for the control FSM
    typedef enum reg [2:0] {
        IDLE = 3'b000,
        INPUT_NUM1 = 3'b001,
        INPUT_OPERATOR = 3'b010,
        INPUT_NUM2 = 3'b011,
        CALCULATE = 3'b100,
        DISPLAY_RESULT = 3'b101
    } state_t;

    state_t current_state, next_state;

    // Internal registers
    reg [31:0] temp_num1, temp_num2;  // Temporary storage for numbers (decimal to IEEE 754 conversion required)
    reg [7:0] temp_operator;          // Temporary storage for the operator

    // FSM state transition
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // FSM next state logic
    always @(*) begin
        case (current_state)
            IDLE: begin
                if (valid_key && key >= 8'h30 && key <= 8'h39) // Detect number input
                    next_state = INPUT_NUM1;
                else
                    next_state = IDLE;
            end
            INPUT_NUM1: begin
                if (valid_key && (key == 8'h2B || key == 8'h2D || key == 8'h2A)) // Detect operator (+, -, *)
                    next_state = INPUT_OPERATOR;
                else
                    next_state = INPUT_NUM1;
            end
            INPUT_OPERATOR: begin
                if (valid_key && key >= 8'h30 && key <= 8'h39) // Detect second number input
                    next_state = INPUT_NUM2;
                else
                    next_state = INPUT_OPERATOR;
            end
            INPUT_NUM2: begin
                if (valid_key && key == 8'h3D) // '=' key to trigger calculation
                    next_state = CALCULATE;
                else
                    next_state = INPUT_NUM2;
            end
            CALCULATE: begin
                next_state = DISPLAY_RESULT;
            end
            DISPLAY_RESULT: begin
                if (valid_key && key == 8'h43) // 'C' key to clear
                    next_state = IDLE;
                else
                    next_state = DISPLAY_RESULT;
            end
            default: next_state = IDLE;
        endcase
    end

    // FSM output logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            num1 <= 32'b0;
            num2 <= 32'b0;
            operator <= 8'b0;
            calculate <= 1'b0;
            display_mode <= 2'b00;
            temp_num1 <= 32'b0;
            temp_num2 <= 32'b0;
            temp_operator <= 8'b0;
        end else begin
            case (current_state)
                IDLE: begin
                    num1 <= 32'b0;
                    num2 <= 32'b0;
                    operator <= 8'b0;
                    calculate <= 1'b0;
                    display_mode <= 2'b00;
                end
                INPUT_NUM1: begin
                    if (valid_key && key >= 8'h30 && key <= 8'h39) begin
                        temp_num1 <= (temp_num1 * 10) + (key - 8'h30); // Accumulate input
                        display_mode <= 2'b00;
                    end
                end
                INPUT_OPERATOR: begin
                    if (valid_key && (key == 8'h2B || key == 8'h2D || key == 8'h2A)) begin
                        temp_operator <= key;
                        operator <= key;
                        num1 <= temp_num1; // Store first operand
                        display_mode <= 2'b01;
                    end
                end
                INPUT_NUM2: begin
                    if (valid_key && key >= 8'h30 && key <= 8'h39) begin
                        temp_num2 <= (temp_num2 * 10) + (key - 8'h30); // Accumulate input
                        display_mode <= 2'b10;
                    end
                end
                CALCULATE: begin
                    num2 <= temp_num2; // Store second operand
                    calculate <= 1'b1; // Trigger calculation
                    display_mode <= 2'b11;
                end
                DISPLAY_RESULT: begin
                    calculate <= 1'b0; // Reset calculate signal
                    display_mode <= 2'b11; // Keep showing the result
                end
            endcase
        end
    end

endmodule
