`timescale 1ns / 1ps
module Reg_X
    (input clk,write_i,write_iref,
    input [15:0] data_in,
    output reg [0:0] iflag,
    output reg [15:0] data_out_i,
    output reg [15:0] data_out_iref);
    
    
    
    always @(negedge clk)
        begin  
            if(data_out_i < data_out_iref) iflag = 1'd0;
            else iflag = 1'd1;
            
        end
     always @(negedge clk)
        begin
            if (write_i) data_out_i = data_in;
            if (write_iref) data_out_iref = data_in;
            if(data_out_i < data_out_iref) iflag = 1'd0;
            else iflag = 1'd1;
        end
endmodule