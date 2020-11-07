`timescale 1ns / 1ps
module ac (
    input clk, writealu,readalu,readbus,rstac,incac,
    input [15:0] data_inalu,
    output reg [15:0] data_out_alu,data_out_bus,data_store
   );

    always @(negedge clk)
        begin
            if (readalu) data_out_alu = data_store;
            if (readbus) data_out_bus = data_store;

        end

    always @(posedge clk ) 
        begin
            if (writealu) data_store = data_inalu;
            else if (rstac) data_store =0;
            else if (incac) data_store =data_store + 1;    
        end
endmodule