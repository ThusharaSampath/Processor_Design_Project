module CONTROL_UNIT_TB;
    reg clk;
    reg [0:0] z;
    reg [0:0] i;
    reg [0:0] j;
    reg [0:0] k;
    reg [7:0] instruction;
    reg [15:0] MDDR;
    wire [2:0] to_ALU;
    wire [0:0] to_DM;
    wire [0:0] to_IM;
    wire [4:0] to_REG;
    wire [3:0] to_BUS;
    wire [0:0] to_PC;
    wire [2:0] to_AC;
    wire [0:0] En_Select;
    wire [0:0] RW_Select;
    wire finish;
    parameter clk_period = 10;
    
       
    CONTROL_UNIT CONTROL_UNIT (clk,z,i,j,k,instruction,MDDR,to_ALU,to_DM,to_IM,to_REG,to_BUS,to_PC,
    to_AC,En_Select,RW_Select,finish);
       
    initial 
        begin
            clk = 0; 
        end
    
    always
        #(clk_period/2)
        clk = ~clk;
    
    initial
        begin
            z=1'b0;i=1'b0;j=1'b0;k=1'b0;instruction=8'd28;MDDR=16'd0;
            #(clk_period);
            #(clk_period);
            #(clk_period);
            #(clk_period);
  

        end

endmodule
