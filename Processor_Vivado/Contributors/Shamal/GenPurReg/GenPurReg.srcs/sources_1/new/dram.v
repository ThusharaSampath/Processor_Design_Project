module dram(
    input clk,
    input write,
    input [15:0] address,
    input [15:0] data_in,
    output reg [15:0] data_out );
    reg [15:0] MEM [65535:0];
        always @(*)
            begin
                if (write == 1)
                MEM[address] <= data_in[15:0];
                else
                data_out <= MEM[address];
            end
endmodule
