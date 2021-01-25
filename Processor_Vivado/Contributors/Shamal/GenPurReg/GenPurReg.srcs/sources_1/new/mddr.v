module mddr(input clk,write_ins,write_data,write_bus,
    input [15:0] data_in_ins,
    input [15:0] data_in_data,
    input [15:0] data_in_bus,
    output reg [15:0] data_out
    );
    always @(negedge clk)
        begin
            if (write_ins) data_out <= data_in_ins;
            if (write_bus) data_out <= data_in_bus;
            if (write_data) data_out <= data_in_data;    
        end 
endmodule
