module Genaral_Purpose_Register
    (input clk,write,read,
    input [15:0] data_in,
    output reg [15:0] data_out,
    output reg [15:0] data_store);
    
    reg [15:0] data_store;

    always @(negedge clk)
        begin
            if (read) data_out <= data_store;
        end
     always @(posedge clk)
        begin
            if (write) data_store <= data_in;
        end
endmodule