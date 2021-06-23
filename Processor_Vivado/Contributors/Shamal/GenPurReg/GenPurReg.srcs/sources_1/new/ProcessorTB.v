`timescale 1ns / 1ps
module ProcessorTB;
    reg clk;
    wire [15:0]R;
    wire [15:0]MDDR;
    wire [15:0]AC;
    wire [15:0]BUS;
    wire [7:0]current_micro_instruction;
    wire [0:0]finish;
    parameter clk_period = 10;
    Processor Processor(clk,R,MDDR,AC,BUS,current_micro_instruction,finish);

    initial 
    begin
       clk = 0; 
    end
    
    always
    begin
        #(clk_period/2)
        clk = ~clk;
        $display("finish:%d",finish);
        if(finish==1'd1) $stop;
        
    end
endmodule
