//X colum Y row
module MAT_X
    (input clk,
    input [15:0] X_Ref, 
    input [15:0] X, //Counter 1
    input [15:0] Base, //Starting Address
    input [15:0] Y, //Counter 2
    output reg [15:0] Mat_data_out
    );
     always @(*)
        begin
            Mat_data_out <= Y*X_Ref + X+Base;
        end
endmodule
