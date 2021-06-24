`timescale 1ns / 1ps

module Processor(

input clk,
    output reg [15:0]test,
    output reg [15:0]test2,
    output reg [15:0]test3,
    output reg [15:0]test4,
    output reg [7:0]current_micro_instruction,
    output reg [0:0]finish
    );
    wire [7:0]current_micro_instruction_wire;
    wire [3:0]en_from_cpu_to_IM;
    wire [3:0]en_from_cpu_to_DM;
    wire [63:0]data_from_cpu_to_IM;
    wire [63:0]data_from_cpu_to_DM;
    wire [63:0]data_from_IM_to_cpu;
    wire [63:0]data_from_DM_to_cpu;
    wire [63:0]data_from_AR_to_M;
    wire [15:0]test_wire;
    wire [15:0]test2_wire;
    wire [15:0]test3_wire;
    wire [15:0]test4_wire;
    wire [0:0]finish_wire;
    parameter proId0 =16'd0 ;
    parameter proId1 =16'd1 ;

    always @(*) 
    begin
        //please work!
        current_micro_instruction<=current_micro_instruction_wire;
        test <= test_wire;
        test2 <= test2_wire;
        test3 <= test3_wire;
        test4 <= test4_wire;
        finish<=finish_wire;

    end

    topProcessor core1 (
        .clk(clk),
        .DM_out(data_from_DM_to_cpu[15:0]),
        .IM_out(data_from_IM_to_cpu[15:0]),
        .proId(proId0),
        .IM_in(data_from_cpu_to_IM[15:0]),     
        .DM_in(data_from_cpu_to_DM[15:0]),    
        .DM_en(en_from_cpu_to_DM[0:0]),
        .IM_en(en_from_cpu_to_IM[0:0]),
        .AR_out(data_from_AR_to_M[15:0]),
        .finish(finish_wire),
        .test(test_wire),
        .test2(test2_wire),
        .test3(test3_wire),
        .test4(test4_wire),
        .current_micro_instruction(current_micro_instruction_wire)
        );

    topProcessor core2 (
        .clk(clk),
        .DM_out(data_from_DM_to_cpu[31:16]),
        .IM_out(data_from_IM_to_cpu[31:16]),
        .proId(proId1),
        .IM_in(data_from_cpu_to_IM[31:16]),     
        .DM_in(data_from_cpu_to_DM[31:16]),    
        .DM_en(en_from_cpu_to_DM[1:1]),
        .IM_en(en_from_cpu_to_IM[1:1]),
        .AR_out(data_from_AR_to_M[31:16]),
        .finish(finish_wire),
        .test(),
        .test2(),
        .test3(),
        .test4(),
        .current_micro_instruction()
        );

        topProcessor core3 (
        .clk(clk),
        .DM_out(data_from_DM_to_cpu[47:32]),
        .IM_out(data_from_IM_to_cpu[47:32]),
        .proId(16'd2),
        .IM_in(data_from_cpu_to_IM[47:32]),     
        .DM_in(data_from_cpu_to_DM[47:32]),    
        .DM_en(en_from_cpu_to_DM[2:2]),
        .IM_en(en_from_cpu_to_IM[2:2]),
        .AR_out(data_from_AR_to_M[47:32]),
        .finish(finish_wire),
        .test(),
        .test2(),
        .test3(),
        .test4(),
        .current_micro_instruction()
        );

        // topProcessor core4 (
        // .clk(clk),
        // .DM_out(data_from_DM_to_cpu[63:48]),
        // .IM_out(data_from_IM_to_cpu[63:48]),
        // .proId(16'd3),
        // .IM_in(data_from_cpu_to_IM[63:48]),     
        // .DM_in(data_from_cpu_to_DM[63:48]),    
        // .DM_en(en_from_cpu_to_DM[3:3]),
        // .IM_en(en_from_cpu_to_IM[3:3]),
        // .AR_out(data_from_AR_to_M[63:48]),
        // .finish(finish_wire),
        // .test(),
        // .test2(),
        // .test3(),
        // .test4(),
        // .current_micro_instruction()
        // );



    IRAM IRAM(
        .clk(clk),
        .write(en_from_cpu_to_IM),
        .address(data_from_AR_to_M),
        .instr_in(data_from_cpu_to_IM),
        .instr_out(data_from_IM_to_cpu)

    );

    dram DRAM (
        .clk(clk),
        .write(en_from_cpu_to_DM),
        .address(data_from_AR_to_M),
        .data_in(data_from_cpu_to_DM),
        .data_out(data_from_DM_to_cpu)
    );
endmodule
