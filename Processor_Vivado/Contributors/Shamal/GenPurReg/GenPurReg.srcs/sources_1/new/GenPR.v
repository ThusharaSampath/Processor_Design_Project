module Genaral_Purpose_Register
    (input clk,write,
    input [15:0] data_in,
    output reg [15:0] data_out
    );
    


    
     always @(negedge clk)
        begin
            if (write) data_out <= data_in;
        end
endmodule