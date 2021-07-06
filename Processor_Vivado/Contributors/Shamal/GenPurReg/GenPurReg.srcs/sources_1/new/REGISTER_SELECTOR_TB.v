`timescale 1ns / 1ps

module REGISTER_SELECTOR_TB;
    reg clk;
    reg [0:0]en;
    reg [0:0]rw;
    reg [7:0] fromMDDR;
    wire [5:0] toDecoder;
    wire [4:0] toBus;

    parameter clk_period = 10;
    REGISTER_SELECTOR REGISTER_SELECTOR(clk,
                                        en,
                                        rw,
                                        fromMDDR,
                                        toDecoder,
                                        toBus);
     initial 
        begin
        clk = 0; 
        end
    
    always
        #(clk_period/2)
        clk = ~clk;
    initial
        begin
           en=1'd1 ;rw=1'd1;fromMDDR=16'd17;
            #(clk_period);
               
        end
endmodule
