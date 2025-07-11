`timescale 1ns / 1ps

//Bidirectional shift register

module shiftreg #(parameter MSB=4) (
    input d, clk, en, dir, rstn,
    output reg [MSB-1:0] out
     );
     
always @ (posedge clk)
    if (!rstn)
        out <= 0;
    else begin
        if (en)
            case (dir)
                0: out <= {out[MSB-2:0], d}; //right shift
                1: out <= {d, out[MSB-1:1]}; //left shift
            endcase
        else
            out <= out;
    end
     
     
endmodule
