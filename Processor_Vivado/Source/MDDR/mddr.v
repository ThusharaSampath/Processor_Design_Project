`timescale 1ns / 1ps
module PC
    (input clk,write,read,incpc,
    input [15:0] data_in,
    output reg [15:0] data_out,
    output reg [15:0] data_store);
       

    always @(negedge clk )
        begin 
            
            if (read) data_out <= data_store;
        end
     always @(posedge clk)
        begin
            if (write) data_store <= data_in;
            else if (incpc) data_store <= data_store + 1;
        end
endmodule