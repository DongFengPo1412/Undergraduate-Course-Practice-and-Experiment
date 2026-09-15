
`timescale 1ns / 1ps

module ALU_float_tb;

// Inputs
reg clk;
reg rst_n;
reg start;
reg [1:0] S;
reg [31:0] A;
reg [31:0] B;

// Outputs
wire [31:0] C;
wire error;
wire ready;

// Instantiate the Unit Under Test (UUT)
ALU_float uut (
    .clk(clk),
    .rst_n(rst_n),
    .start(start),
    .S(S),
    .A(A),
    .B(B),
    .C(C),
    .error(error),
    .ready(ready)
);

// Clock generation
always #5 clk = ~clk; // 10ns clock period

initial begin
    // Initialize Inputs
    clk = 0;
    rst_n = 0;
    start = 0;
    S = 0;
    A = 0;
    B = 0;

    // Reset
    #10 rst_n = 1;

    // Test case 1: Addition (A + B)
    #10;
    S = 2'b00; // Addition
    A = 32'h4177D567; // 15.4896 in IEEE754
    B = 32'h4119DAB8; // 9.615898 in IEEE754
    start = 1;
    #10 start = 0;

    // Wait for ready signal
    wait (ready);
    $display("Addition Result: %h, Error: %b", C, error);

    // Test case 2: Subtraction (A - B)
    #10;
    S = 2'b11; // Subtraction
    A = 32'h4177D567; // 15.4896 in IEEE754
    B = 32'h4119DAB8; // 9.615898 in IEEE754
    start = 1;
    #10 start = 0;

    // Wait for ready signal
    wait (ready);
    $display("Subtraction Result: %h, Error: %b", C, error);

    // Test case 3: Multiplication (A * B)
    #10;
    S = 2'b01; // Multiplication
    A = 32'h40B5C28F; // 5.68 in IEEE754
    B = 32'h410F851F; // 8.97 in IEEE754
    start = 1;
    #10 start = 0;

    // Wait for ready signal
    wait (ready);
    $display("Multiplication Result: %h, Error: %b", C, error);
     // Finish simulation
    #100 $finish;
end

endmodule
