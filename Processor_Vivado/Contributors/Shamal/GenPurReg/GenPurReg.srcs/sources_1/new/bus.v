module BUS(
    input clk,
    input [4:0] from_selector,
    input [4:0] from_cu,
    input [15:0] AR,
    input [15:0] PC,
    input [15:0] R,
    input [15:0] P,
    input [15:0] Mat_A,
    input [15:0] Mat_B,
    input [15:0] MDDR,
    input [15:0] AC,
    input [15:0] I,
    input [15:0] I_ref,
    input [15:0] J,
    input [15:0] J_ref,
    input [15:0] K,
    input [15:0] K_ref,
    input [15:0] Mat_C,
    input [15:0] proId,
    output reg [15:0] out) ;
    reg [4:0] reg_select;
always @(*)
    begin
    if (from_selector==5'd0)reg_select=from_cu;
    else reg_select=from_selector;
    case(reg_select)
        5'd1: out = AR;
        5'd2: out = PC;
        5'd4: out = MDDR;
        5'd7: out = Mat_C;
        5'd8: out = I;
        5'd9: out = I_ref;
        5'd11: out = J;
        5'd12: out = J_ref;
        5'd14: out = K;
        5'd15: out = K_ref;
        5'd16: out = P;
        5'd17: out = R;
        5'd20: out = AC;
        5'd21: out = Mat_A;
        5'd22: out = Mat_B;
        5'd23: out = proId;
        default: out= 16'd0;
    endcase
    end
endmodule