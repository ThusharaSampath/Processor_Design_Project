module regSelect(
    input clk,
    input [0:0]en,
    input [0:0]rw,
    input [15:0] fromMDDR,
    output reg [5:0] toDecoder = 6'd0,
    output reg [4:0] toBus = 4'd0

   );
always @(*)
    begin
    if (en==0)
        begin 
        toDecoder=0;
        toBus=0;
        end
    else 
       begin
        if(rw==0)toBus = fromMDDR[4:0];
        else toDecoder = fromMDDR[5:0];
       end
    end
endmodule