`timescale 1ns / 1ps

module sync_count_up(
    input clk, rstn,
    output reg [2:0]count

    );
    
always @ (posedge clk) begin
    if (!rstn)
        count <= 0;
    else
        count <= count + 1;
 
end      
endmodule
