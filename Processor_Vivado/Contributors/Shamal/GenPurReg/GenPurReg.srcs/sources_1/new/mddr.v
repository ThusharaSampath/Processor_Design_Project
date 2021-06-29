module MDDR(
    input clk,write_ins,write_data,write_bus,
    input [15:0] instr_iram_mddr,
    input [15:0] data_dram_mddr,
    input [15:0] data_bus_mddr,
    output reg [15:0] data_out
    );
    always @(negedge clk)
        begin
            if (write_ins) data_out <= instr_iram_mddr;
            if (write_bus) data_out <= data_bus_mddr;
            if (write_data) data_out <= data_dram_mddr;    
        end 
endmodule
