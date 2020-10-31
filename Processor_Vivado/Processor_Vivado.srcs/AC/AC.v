`timescale 1ns / 1ps
module ac (
    input clk, writealu,writebus,read,rstac,incac,
    input [15:0] data_inalu,data_inbus,
    output reg [15:0] data_out,data_store,
    output reg zflag =1'b0);

    always @(negedge clk)
        begin
            if (read) data_out = data_store;
            if(data_store==0) zflag = 1'b1;
            else if (data_store==1) zflag = 1'b0;
               
        end

    always @(posedge clk ) 
        begin
            if (writealu) data_store = data_inalu;
            else if (writebus) data_store = data_inbus;
            else if (rstac) data_store =0;
            else if (incac) data_store =data_store + 1;    
            if(data_store==0) zflag = 1'b1;
            else if (data_store==1) zflag =1'b0;
        end
endmodule