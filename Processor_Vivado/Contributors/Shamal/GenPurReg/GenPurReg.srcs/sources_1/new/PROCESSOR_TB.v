`timescale 1ns / 1ps
module PROCESSOR_TB;
    reg clk;

    wire [15:0]BUS_core1;
    wire [7:0]current_micro_instruction_core1;
    wire [15:0]BUS_core2;
    wire [7:0]current_micro_instruction_core2;
    wire [15:0]BUS_core3;
    wire [7:0]current_micro_instruction_core3;
    wire [15:0]BUS_core4;
    wire [7:0]current_micro_instruction_core4;
    wire [3:0]finish;
    parameter clk_period = 10;
    PROCESSOR PROCESSOR(clk,
                    BUS_core1,current_micro_instruction_core1,
                    BUS_core2,current_micro_instruction_core2,
                    BUS_core3,current_micro_instruction_core3,
                    BUS_core4,current_micro_instruction_core4,
                    finish);

    initial 
    begin
       clk = 0; 
    end
    
    always
    begin
        #(clk_period/2)
        clk = ~clk;
        $display("finish:%b",finish);
        if(finish==4'b1111) $stop;
    end
endmodule
