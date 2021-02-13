module topProcessor(
    input clk,
    input DM_out,
    input IM_out,
    output reg IM_in,
    output reg DM_in,
    output reg DM_en,
    output reg IM_en,
    output reg AR_out    
    );
    
    wire to_DM;
    wire to_IM;
    wire [18:0] d_wire;
    wire [15:0] bus_wire;
    wire [15:0] AR_bus_wire;
    always@(*)
     begin
        IM_en <= to_IM;
        DM_en <= to_DM;
        AR_out <= AR_bus_wire;
     end
     
     Genaral_Purpose_Register AR (.clk(clk), .write(d_wire[0]), .data_in(bus_wire),
      .data_out(AR_bus_wire));
      
     
      
         
endmodule
