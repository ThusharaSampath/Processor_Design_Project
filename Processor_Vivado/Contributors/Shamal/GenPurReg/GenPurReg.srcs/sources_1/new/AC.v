`timescale 1ns / 1ps
module ac (
    input clk,
    input [2:0]writealu_rstac_incac,
    input [15:0] data_inalu,
    output reg [15:0] data_out 
   );
    always @(*) 
        begin
            if (writealu_rstac_incac==3'b100) data_out = data_inalu;
            else if (writealu_rstac_incac==3'b010) data_out =0;
            else if (writealu_rstac_incac==3'b001) data_out =data_out + 1;    
            else data_out =data_out;
        end
endmodule