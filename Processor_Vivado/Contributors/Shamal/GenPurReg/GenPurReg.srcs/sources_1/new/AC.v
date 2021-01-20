`timescale 1ns / 1ps
module ac (
    input clk, writealu,rstac,incac,
    input [15:0] data_inalu,
    output reg [15:0] data_out
   );

    

    always @(posedge clk ) 
        begin
            if (writealu) data_out = data_inalu;
            else if (rstac) data_out =0;
            else if (incac) data_out =data_out + 1;    
        end
endmodule