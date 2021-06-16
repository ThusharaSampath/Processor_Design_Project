`timescale 1ns / 1ps
module ProcessorTB;
    reg clk;
    wire [15:0]R;
    wire [15:0]MDDR;
    wire [15:0]AC;
    wire [15:0]BUS;
    wire [7:0]current_micro_instruction;
    parameter clk_period = 10;
    Processor Processor(clk,R,MDDR,AC,BUS,current_micro_instruction);

    initial 
    begin
       clk = 0; 
    end
    
    always
        #(clk_period/2)
        clk = ~clk;
    initial
        begin
            #(clk_period/2);
            #(clk_period/2);
            #(clk_period/2);
            #(clk_period/2);
           end
endmodule
