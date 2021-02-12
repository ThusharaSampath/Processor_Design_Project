module regSelect(
    input clk,
    input en,
    input rw,
    input [7:0] fromMDDR,
    output reg [5:0] toDecoder,
    output reg [4:0] toBus

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