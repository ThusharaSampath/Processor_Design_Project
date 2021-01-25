`timescale 1ns / 1ps
module PC
    (input clk,write,incpc,
    input [15:0] data_in,
    output reg [15:0] data_out
    );
       

      always @(negedge clk)
        begin
            if (write) data_out <= data_in;
            else if (incpc) data_out <= data_out + 1;
        end
endmodule
