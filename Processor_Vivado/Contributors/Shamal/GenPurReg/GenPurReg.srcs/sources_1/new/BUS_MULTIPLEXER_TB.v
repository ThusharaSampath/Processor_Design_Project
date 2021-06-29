`timescale 1ns / 1ps


module BUS_MULTIPLEXER_TB;

    reg clk;
    reg [4:0] from_selector;
    reg [4:0] from_cu;
    reg [15:0] AR;
    reg [15:0] PC;
    reg [15:0] R;
    reg [15:0] P;
    reg [15:0] Mat_A;
    reg [15:0] Mat_B;
    reg [15:0] MDDR;
    reg [15:0] AC;
    reg [15:0] I;
    reg [15:0] J;
    reg [15:0] K;
    reg [15:0] BASE;
    wire  [15:0] out;
    parameter clk_period = 10;

    BUS_MULTIPLEXER BUS_MULTIPLEXER (clk,
        from_selector,
        from_cu,
        AR,
        PC,
        R,
        P,
        Mat_A,
        Mat_B,
        MDDR,
        AC,
        I,
        J,
        K,
        BASE,
        out
        );

    initial 
    begin
       clk = 0; 
    end
    
    always
        #(clk_period/2)
        clk = ~clk;
    initial
        begin
            from_selector=5'd0;from_cu=5'd2;PC=16'd9;
            #(clk_period);
        end
endmodule