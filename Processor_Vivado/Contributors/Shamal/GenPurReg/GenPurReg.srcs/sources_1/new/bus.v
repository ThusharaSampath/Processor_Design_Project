module BUS(
    input clk,
    input [3:0] r_en,
    input [15:0] AR,
    input [15:0] PC,
    input [15:0] R,
    input [15:0] P,
    input [15:0] Mat_A,
    input [15:0] Mat_B,
    input [15:0] MDDR,
    input [15:0] AC,
    input [15:0] I,
    input [15:0] J,
    input [15:0] K,
    input [15:0] BASE,
    output reg [15:0] out ) ;
always @(posedge clk)
    begin
    case(r_en)
        4'd1: out = R;
        4'd2: out = P;
        4'd4: out = Mat_A;
        4'd5: out = Mat_B;
        4'd6: out = AR;
        4'd7: out = MDDR;
        4'd8: out = AC;
        4'd9: out = I;
        4'd10: out = J;
        4'd11: out = K;
        4'd11: out = BASE;
        4'd12: out = PC;
        default: out= 16'd0;
    endcase
    end
endmodule