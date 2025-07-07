`timescale 1ns / 1ps

module prio_enco_4bit(
    input [3:0]d,
    output reg [1:0]q

    );
    
always@(d) begin
    casex(d)
    4'b1xxx: q = 2'b11;
    4'b01xx: q = 2'b10;
    4'b001x: q = 2'b01;
    4'b0001: q = 2'b00;
    default: $display("Invalid data received");
    endcase
        
end
endmodule
