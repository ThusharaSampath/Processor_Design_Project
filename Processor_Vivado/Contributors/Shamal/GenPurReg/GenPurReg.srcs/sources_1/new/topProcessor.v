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
    wire [15:0] MIDR_wire;
    wire [15:0] data_IM;
    wire [15:0] data_DM;
    wire [15:0] Base_A_wire;
    wire [15:0] Base_B_wire;
    wire [15:0] alu_out;
    wire [15:0] Mul_bus_wire [11:0];
    wire [0:0] PC_inc_wire;
    wire [0:0] iflag_wire;
    wire [0:0] jflag_wire;
    wire [0:0] kflag_wire;
    wire [0:0] zflag_wire;
    wire [0:0] i_ref_wire;
    wire [0:0] j_ref_wire;
    wire [0:0] k_ref_wire;
    wire [2:0] opcode_wire;
    wire [2:0] ac_cu_wire;
    wire [5:0] cu_decoder_wire;
    wire [0:0] decoder_selector;
    always@(*)
     begin
        IM_en <= to_IM;
        DM_en <= to_DM;
        AR_out <= Mul_bus_wire[0];
        IM_in <= Mul_bus_wire[2];
        DM_in <= Mul_bus_wire[2];
     end
     
     Genaral_Purpose_Register AR (.clk(clk), .write(d_wire[0]), .data_in(bus_wire),.data_out(Mul_bus_wire[0]));
      
     PC PC (.clk(clk), .write(d_wire[1]), .incpc(PC_inc_wire), .data_in(bus_wire),.data_out(Mul_bus_wire[1]));
     
     Genaral_Purpose_Register MIDR (.clk(clk), .write(d_wire[2]), .data_in(bus_wire),.data_out(MIDR_wire));
      
     mddr MDDR (.clk(clk), .write_ins(d_wire[4]),.write_data(d_wire[5]),.write_bus(d_wire[3]),.data_in_ins(data_IM),
     .data_in_data(data_DM),.data_in_bus(bus_wire),.data_out(Mul_bus_wire[2]));
     
     Genaral_Purpose_Register BASE (.clk(clk), .write(d_wire[6]), .data_in(bus_wire),.data_out(Mul_bus_wire[3]));
      
     Reg_X I (.clk(clk), .write_i(d_wire[7]),.write_iref(d_wire[8]), .data_in(bus_wire),.iflag(iflag_wire), 
     .data_out_i(Mul_bus_wire[4]), .data_out_iref(i_ref_wire));
      
     Reg_X J (.clk(clk), .write_i(d_wire[10]),.write_iref(d_wire[11]), .data_in(bus_wire),
      .iflag(jflag_wire), .data_out_i(Mul_bus_wire[5]), .data_out_iref(j_ref_wire));
      
     Reg_X K (.clk(clk), .write_i(d_wire[13]),.write_iref(d_wire[14]), .data_in(bus_wire),
      .iflag(kflag_wire), .data_out_i(Mul_bus_wire[6]), .data_out_iref(k_ref_wire)); 
     
     Genaral_Purpose_Register BASE_A (.clk(clk), .write(d_wire[9]), .data_in(bus_wire),
      .data_out(Base_A_wire));
     
     Genaral_Purpose_Register BASE_B (.clk(clk), .write(d_wire[12]), .data_in(bus_wire),
      .data_out(Base_B_wire));
      
     Mat_X MAT_A (.clk(clk), .X_Ref(i_ref_wire), .X(Mul_bus_wire[4]), .Base(Base_A_wire),
      .Y(Mul_bus_wire[5]),.Mat_data_out(Mul_bus_wire[10]));
      
     Mat_X MAT_B (.clk(clk), .X_Ref(j_ref_wire), .X(Mul_bus_wire[5]), .Base(Base_B_wire),
      .Y(Mul_bus_wire[6]),.Mat_data_out(Mul_bus_wire[11]));
      
     Genaral_Purpose_Register P (.clk(clk), .write(d_wire[15]), .data_in(bus_wire),
      .data_out(Mul_bus_wire[7]));
      
     Genaral_Purpose_Register R (.clk(clk), .write(d_wire[16]), .data_in(bus_wire),
      .data_out(Mul_bus_wire[8]));
      
     main_alu ALU (.clk(clk), .bus_in(bus_wire), .ac_in(Mul_bus_wire[9]),
      .op_code(opcode_wire),.out(alu_out), .zflag(zflag_wire));
     
     ac AC (.clk(clk), .writealu(ac_cu_wire[0]), .rstac(ac_cu_wire[1]), .incac(ac_cu_wire[2]), 
     .data_inalu(alu_out), .data_out(Mul_bus_wire[9]));
     
     decoder decoder (  
        .clk(clk),
        .from_cu(cu_decoder_wire),
        .selector(decoder_selector),
        .out_AR(d_wire[0]),
        .out_PC(d_wire[1]),
        .out_MIDR(d_wire[2]),
        .out_MDDR_BUS(d_wire[3]),
        .out_MDDR_IM(d_wire[4]),
        .out_MDDR_DM(d_wire[5]),
        .out_BASE(d_wire[6]),
        .out_I(d_wire[7]),
        .out_I_Ref(d_wire[8]),
        .out_Base_A(d_wire[9]),
        .out_J(d_wire[10]),
        .out_J_Ref(d_wire[11]),
        .out_Base_B(d_wire[12]),
        .out_K(d_wire[13]),
        .out_K_Ref(d_wire[14]),
        .out_P(d_wire[15]),
        .out_R(d_wire[16])
    );
      
endmodule
