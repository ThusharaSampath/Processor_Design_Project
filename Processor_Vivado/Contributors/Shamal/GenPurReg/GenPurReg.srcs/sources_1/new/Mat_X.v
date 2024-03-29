//X colum Y ROw
module Mat_X
    (input clk,
    input [15:0] X_Ref, 
    input [15:0] X,
    input [15:0] Base, 
    input [15:0] Y,
    output reg [15:0] Mat_data_out
    );
    


     always @(*)
        begin
            Mat_data_out <= Y*X_Ref + X+Base;
        end
endmodule
