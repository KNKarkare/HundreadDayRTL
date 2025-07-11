`timescale 1ns / 1ps

module mux4_1_tb;

logic [1:0]s;
logic [3:0]x;
logic y;

mux4_1 uut (
    .x(x),
    .s(s),
    .y(y));
    
    initial begin
        $monitor("Time=%0t | in=%b sel=%b -> out=%b", $time, x, s, y);
        
        x = 4'b1010;
        
        s = 2'b00; #10;
        s = 2'b01; #10;
        s = 2'b10; #10;
        s = 2'b11; #10;
        
        $finish;
    
    end
endmodule
