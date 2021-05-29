`timescale 1ns / 1ps

module decoderTB; 
   reg clk;
    reg [5:0] from_cu;
    reg [5:0] from_selector;
   wire [0:0] out_AR;
    wire [0:0] out_PC;
   wire [0:0] out_MIDR;
    wire  [0:0] out_MDDR_BUS;
    wire  [0:0] out_MDDR_IM;
    wire  [0:0] out_MDDR_DM;
   wire [0:0] out_BASE;
   wire  [0:0] out_I;
    wire  [0:0] out_I_Ref;
   wire  [0:0] out_Base_A;
    wire  [0:0] out_J;
   wire [0:0] out_J_Ref;
   wire  [0:0] out_Base_B;
    wire  [0:0] out_K;
    wire  [0:0] out_K_Ref;
    wire  [0:0] out_P;
   wire  [0:0] out_R;
    parameter clk_period = 10;

    decoder decoder (
        clk,
from_cu,
from_selector,
out_AR,
out_PC,
out_MIDR,
out_MDDR_BUS,
out_MDDR_IM,
out_MDDR_DM,
out_BASE,
out_I,
out_I_Ref,
out_Base_A,
out_J,
out_J_Ref,
out_Base_B,
out_K,
out_K_Ref,
out_P,
out_R
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
            from_cu=5'd0 ; from_selector=5'd0;
            #(clk_period);
            from_cu=5'd2 ; from_selector=5'd0;
            #(clk_period);
            from_cu=5'd3 ; from_selector=5'd0;
            #(clk_period);
            from_cu=5'd3 ; from_selector=5'd6;
            #(clk_period);
        end
endmodule
