module keyboard_input (
    input wire clk,                // System clock
    input wire rst,                // Reset signal
    input wire [3:0] row,          // 4 rows of the keypad
    output reg [3:0] col,          // 4 columns of the keypad
    output reg valid,              // Valid signal for detected key
    output reg [7:0] key           // Key value (ASCII or encoded representation)
);

    // Internal signals
    reg [3:0] col_scan;            // Current column being scanned
    reg [19:0] debounce_counter;   // Counter for debounce
    reg debounce_active;           // Debounce active flag
    reg [3:0] row_latched;         // Latched row value
    reg [7:0] key_latched;         // Latched key value

    // Keypad character map
    reg [7:0] keypad_map [15:0];   // Mapping from row/col index to key value

    initial begin
        // Initialize the keypad map
        keypad_map[ 0] = 8'h31; // '1'
        keypad_map[ 1] = 8'h32; // '2'
        keypad_map[ 2] = 8'h33; // '3'
        keypad_map[ 3] = 8'h2B; // '+'
        keypad_map[ 4] = 8'h34; // '4'
        keypad_map[ 5] = 8'h35; // '5'
        keypad_map[ 6] = 8'h36; // '6'
        keypad_map[ 7] = 8'h2D; // '-'
        keypad_map[ 8] = 8'h37; // '7'
        keypad_map[ 9] = 8'h38; // '8'
        keypad_map[10] = 8'h39; // '9'
        keypad_map[11] = 8'h2A; // '*'
        keypad_map[12] = 8'h2E; // '.'
        keypad_map[13] = 8'h30; // '0'
        keypad_map[14] = 8'h3D; // '='
        keypad_map[15] = 8'h43; // 'C' (Clear)
    end

    // Column scanning logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            col_scan <= 4'b1110; // Start with the first column
        end else begin
            col_scan <= {col_scan[2:0], col_scan[3]}; // Rotate to the next column
        end
    end

    // Assign current column
    always @(*) begin
        col = col_scan;
    end

    // Debounce and row detection logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            debounce_counter <= 20'd0;
            debounce_active <= 1'b0;
            row_latched <= 4'b0000;
            key_latched <= 8'd0;
            valid <= 1'b0;
        end else begin
            if (row != 4'b1111 && !debounce_active) begin
                // Key press detected, start debounce
                debounce_active <= 1'b1;
                debounce_counter <= 20'd100000; // Adjust for debounce timing
                row_latched <= row;
            end else if (debounce_active) begin
                if (debounce_counter > 0) begin
                    debounce_counter <= debounce_counter - 1;
                end else begin
                    debounce_active <= 1'b0;
                    key_latched <= keypad_map[{row_latched, col_scan}];
                    valid <= 1'b1;
                end
            end else begin
                valid <= 1'b0;
            end
        end
    end

    // Assign output key value
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            key <= 8'd0;
        end else if (valid) begin
            key <= key_latched;
        end
    end

endmodule
