`timescale 1ns / 1ps
module ProcessorTB;
    reg clk;
    wire [15:0]test;
    wire [5:0]test2;
    wire [15:0] test3;
    wire [7:0]current_micro_instruction;
    parameter clk_period = 10;
    Processor Processor(clk,test,test2,test3,current_micro_instruction);

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
