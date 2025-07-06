`timescale 1ns / 1ps

module and_gate_4bit(
    input [3:0] a,
    input [3:0] b,
    output [3:0] y
    );
    
assign y = a & b;

endmodule
