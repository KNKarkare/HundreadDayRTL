`timescale 1ns / 1ps

module johnson_count #(parameter WIDTH=4)( 
    input clk, rstn,
    output reg [WIDTH-1:0]q
    );

    
always @ (posedge clk) begin
    if (!rstn)
        q <= 0;
    else begin
        q<={~q[0], q[3:1]}; 
    end
end   
endmodule
