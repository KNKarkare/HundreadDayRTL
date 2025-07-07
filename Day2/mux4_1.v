`timescale 1ns / 1ps

module mux4_1(
    input [3:0]x,
    input [1:0]s,
    output y
    );
    
assign y = s[1]?(s[0]?x[3]:x[2]):(s[0]?x[1]:x[0]);
    
endmodule
