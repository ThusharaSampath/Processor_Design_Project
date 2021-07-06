module CORE(
    input clk,
    input  [15:0]data_DM_core,//from data mem to proc(MDDR)
    input  [15:0]data_IM_core,
    input  [15:0]proId,
    output reg [15:0]data_core_IM,
    output reg [15:0]data_core_DM,//from processor(MDDR) to data mem (data)
    output reg [0:0]DM_en,//from processor to data mem (control signal)
    output reg [0:0]IM_en,
    output reg [15:0]AR_out,  
    output reg finish,  
    output reg [15:0]bus,
    output reg [7:0]current_micro_instruction
    
    );
    wire [7:0]current_micro_instruction_wire;
    wire to_DM;
    wire to_IM;
    wire [0:0]wire_decoder_registers [16:0];
    wire [15:0] bus_wire;
    wire [15:0] MIDR_wire;
    wire [15:0] wire_iram_mddr;
    wire [15:0] wire_dram_mddr;
    wire [15:0] Base_A_wire;
    wire [15:0] Base_B_wire;
    wire [15:0] Base_C_wire;
    wire [15:0] data_alu_ac;
    wire [15:0] wire_registers_busMultiplexer [12:0];
    wire [0:0] PC_inc_wire;
    wire [0:0] iflag_wire;
    wire [0:0] jflag_wire;
    wire [0:0] kflag_wire;
    wire [0:0] zflag_wire;
    wire [15:0] i_ref_wire;
    wire [15:0] j_ref_wire;
    wire [15:0] k_ref_wire;
    wire [3:0] opcode_wire;
    wire [2:0] ac_cu_wire;
    wire [5:0] wire_cu_decoder;//select reg by cu
    wire [5:0] wire_regSelector_decoder;//select read/write by reg selector module
    wire [4:0] bus_selector_from_cu; //
    wire [4:0] bus_selector_from_register_selector;
    wire [0:0] en_register_selector;//form CU - enable 
    wire [0:0] rw_register_selector;//from cu - read/wrie select 
    wire [0:0] finish_wire;//from cu - read/wrie select 

    assign wire_iram_mddr = data_IM_core;
    assign wire_dram_mddr = data_DM_core;
        
    always@(*)
     begin
        current_micro_instruction <= current_micro_instruction_wire;
        bus <= bus_wire;
        IM_en <= to_IM;
        DM_en <= to_DM;
        AR_out <= wire_registers_busMultiplexer[0];
        data_core_IM <= wire_registers_busMultiplexer[2];
        data_core_DM <= wire_registers_busMultiplexer[2];
        finish <= finish_wire ;
        if(finish==1'd1) $display("finish");
        //$display("AR:- %d , I:- %d, I_ref:- %d, J:- %d, J_ref:- %d, base_A: %d, K:- %d, K_ref:- %d,base_B: %d, P:- %d, MAT_A:- %d, MAT_B:- %d, MAT_C:- %d" ,wire_registers_busMultiplexer[0],wire_registers_busMultiplexer[4],i_ref_wire,wire_registers_busMultiplexer[5],j_ref_wire,Base_A_wire,wire_registers_busMultiplexer[6],k_ref_wire,Base_B_wire,wire_registers_busMultiplexer[7],wire_registers_busMultiplexer[10],wire_registers_busMultiplexer[11],wire_registers_busMultiplexer[3]);
     end
     
     GENERAL_PURPOSE_REGISTER ID (.clk(clk), .write(1'd1), .data_in(proId),.data_out(wire_registers_busMultiplexer[12]));

     GENERAL_PURPOSE_REGISTER AR (.clk(clk), .write(wire_decoder_registers[0]), .data_in(bus_wire),.data_out(wire_registers_busMultiplexer[0]));
      
     PC PC (.clk(clk), .write(wire_decoder_registers[1]), .incpc(PC_inc_wire), .data_in(bus_wire),.data_out(wire_registers_busMultiplexer[1]));
     
     GENERAL_PURPOSE_REGISTER MIDR (.clk(clk), .write(wire_decoder_registers[2]), .data_in(bus_wire),.data_out(MIDR_wire));
      
     MDDR MDDR (.clk(clk), .write_ins(wire_decoder_registers[4]),.write_data(wire_decoder_registers[5]),.write_bus(wire_decoder_registers[3]),.instr_iram_mddr(wire_iram_mddr),
     .data_dram_mddr(wire_dram_mddr),.data_bus_mddr(bus_wire),.data_out(wire_registers_busMultiplexer[2]));
     
     GENERAL_PURPOSE_REGISTER BASE_C (.clk(clk), .write(wire_decoder_registers[6]), .data_in(bus_wire),.data_out(Base_C_wire));
      
     REG_X I (.clk(clk), .write_x(wire_decoder_registers[7]),.write_xref(wire_decoder_registers[8]), .data_in(bus_wire),.xflag(iflag_wire), 
     .data_out_x(wire_registers_busMultiplexer[4]), .data_out_xref(i_ref_wire));
      
     REG_X J (.clk(clk), .write_x(wire_decoder_registers[10]),.write_xref(wire_decoder_registers[11]), .data_in(bus_wire),
      .xflag(jflag_wire), .data_out_x(wire_registers_busMultiplexer[5]), .data_out_xref(j_ref_wire));
      
     REG_X K (.clk(clk), .write_x(wire_decoder_registers[13]),.write_xref(wire_decoder_registers[14]), .data_in(bus_wire),
      .xflag(kflag_wire), .data_out_x(wire_registers_busMultiplexer[6]), .data_out_xref(k_ref_wire)); 
     
     GENERAL_PURPOSE_REGISTER BASE_A (.clk(clk), .write(wire_decoder_registers[9]), .data_in(bus_wire),
      .data_out(Base_A_wire));
     
     GENERAL_PURPOSE_REGISTER BASE_B (.clk(clk), .write(wire_decoder_registers[12]), .data_in(bus_wire),
      .data_out(Base_B_wire));

      //4 i
      //5 j
      //6 k
     MAT_X MAT_A (.clk(clk), .X_Ref(j_ref_wire), .X(wire_registers_busMultiplexer[5]), .Base(Base_A_wire),
      .Y(wire_registers_busMultiplexer[4]),.Mat_data_out(wire_registers_busMultiplexer[10]));
      
     MAT_X MAT_B (.clk(clk), .X_Ref(k_ref_wire), .X(wire_registers_busMultiplexer[6]), .Base(Base_B_wire),
      .Y(wire_registers_busMultiplexer[5]),.Mat_data_out(wire_registers_busMultiplexer[11]));

     MAT_X MAT_C (.clk(clk), .X_Ref(k_ref_wire), .X(wire_registers_busMultiplexer[6]), .Base(Base_C_wire),
      .Y(wire_registers_busMultiplexer[4]),.Mat_data_out(wire_registers_busMultiplexer[3]));

      
     GENERAL_PURPOSE_REGISTER P (.clk(clk), .write(wire_decoder_registers[15]), .data_in(bus_wire),
      .data_out(wire_registers_busMultiplexer[7]));
      
     GENERAL_PURPOSE_REGISTER R (.clk(clk), .write(wire_decoder_registers[16]), .data_in(bus_wire),
      .data_out(wire_registers_busMultiplexer[8]));
      
     MAIN_ALU ALU (.clk(clk), .data_bus_alu(bus_wire), .data_ac_alu(wire_registers_busMultiplexer[9]),
      .op_code(opcode_wire),.out(data_alu_ac), .zflag(zflag_wire));
     
     AC AC (.clk(clk), .write(ac_cu_wire), 
     .data_alu_ac(data_alu_ac), .data_out(wire_registers_busMultiplexer[9]));
     
     DECODER DECODER (  
        .clk(clk),
        .from_cu(wire_cu_decoder),
        .from_selector(wire_regSelector_decoder),
        .out_AR(wire_decoder_registers[0]),
        .out_PC(wire_decoder_registers[1]),
        .out_MIDR(wire_decoder_registers[2]),
        .out_MDDR_BUS(wire_decoder_registers[3]),
        .out_MDDR_IM(wire_decoder_registers[4]),
        .out_MDDR_DM(wire_decoder_registers[5]),
        .out_BASE(wire_decoder_registers[6]),
        .out_I(wire_decoder_registers[7]),
        .out_I_Ref(wire_decoder_registers[8]),
        .out_Base_A(wire_decoder_registers[9]),
        .out_J(wire_decoder_registers[10]),
        .out_J_Ref(wire_decoder_registers[11]),
        .out_Base_B(wire_decoder_registers[12]),
        .out_K(wire_decoder_registers[13]),
        .out_K_Ref(wire_decoder_registers[14]),
        .out_P(wire_decoder_registers[15]),
        .out_R(wire_decoder_registers[16])
    );
    BUS_MULTIPLEXER BUS_MULTIPLEXER(
    .clk(clk),
    .from_selector(bus_selector_from_register_selector),
    .from_cu(bus_selector_from_cu),
    .AR(wire_registers_busMultiplexer[0]),
    .PC(wire_registers_busMultiplexer[1]),
    .R(wire_registers_busMultiplexer[8]),
    .P(wire_registers_busMultiplexer[7]),
    .Mat_A(wire_registers_busMultiplexer[10]),
    .Mat_B(wire_registers_busMultiplexer[11]),
    .MDDR(wire_registers_busMultiplexer[2]),
    .AC(wire_registers_busMultiplexer[9]),
    .I(wire_registers_busMultiplexer[4]),
    .I_ref(i_ref_wire),
    .J(wire_registers_busMultiplexer[5]),
    .J_ref(j_ref_wire),
    .K(wire_registers_busMultiplexer[6]),
    .K_ref(k_ref_wire),
    .Mat_C(wire_registers_busMultiplexer[3]),
    .proId(wire_registers_busMultiplexer[12]),
    .out(bus_wire)
    );
    CONTROL_UNIT CONTROL_UNIT(
        .clk(clk),
        .z(zflag_wire),
        .i(iflag_wire),
        .j(jflag_wire),
        .k(kflag_wire),
        .instruction(MIDR_wire),
        .MDDR(wire_registers_busMultiplexer[2]),
        .to_ALU(opcode_wire),
        .to_DM(to_DM),
        .to_IM(to_IM),
        .to_RegSelector(wire_cu_decoder),
        .to_BUS(bus_selector_from_cu),
        .to_PC(PC_inc_wire),
        .to_AC(ac_cu_wire),
        .En_Select(en_register_selector),
        .RW_Select(rw_register_selector),
        .finish(finish_wire),
        .current_micro_instruction(current_micro_instruction_wire)
    );
    REGISTER_SELECTOR REGISTER_SELECTOR(
    .clk(clk),
    .en(en_register_selector),
    .rw(rw_register_selector),
    .fromMDDR(wire_registers_busMultiplexer[2]),
    .toDecoder(wire_regSelector_decoder),
    .toBus(bus_selector_from_register_selector)
    );

endmodule
