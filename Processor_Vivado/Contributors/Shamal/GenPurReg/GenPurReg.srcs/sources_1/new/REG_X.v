`timescale 1ns / 1ps
module REG_X
    (input clk,write_x,write_xref,
    input [15:0] data_in,
    output reg [0:0] xflag,
    output reg [15:0] data_out_x,
    output reg [15:0] data_out_xref);
    
    always @(negedge clk)
        begin  
            if (write_x) data_out_x = data_in;
            if (write_xref) data_out_xref = data_in;
            if(data_out_x < data_out_xref) xflag = 1'd0;
            else xflag = 1'd1;
        end
endmodule