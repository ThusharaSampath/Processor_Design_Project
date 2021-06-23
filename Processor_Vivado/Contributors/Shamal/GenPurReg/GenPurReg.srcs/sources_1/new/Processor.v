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
    wire [0:0]en_from_cpu_to_IM;
    wire [0:0]en_from_cpu_to_DM;
    wire [15:0]data_from_cpu_to_IM;
    wire [15:0]data_from_cpu_to_DM;
    wire [15:0]data_from_IM_to_cpu;
    wire [15:0]data_from_DM_to_cpu;
    wire [15:0]data_from_AR_to_M;
    wire [15:0]test_wire;
    wire [15:0]test2_wire;
    wire [15:0]test3_wire;
    wire [15:0]test4_wire;
    wire [0:0]finish_wire;

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

    topProcessor topProcessor (
        .clk(clk),
        .DM_out(data_from_DM_to_cpu),
        .IM_out(data_from_IM_to_cpu),
        .IM_in(data_from_cpu_to_IM),     
        .DM_in(data_from_cpu_to_DM),    
        .DM_en(en_from_cpu_to_DM),
        .IM_en(en_from_cpu_to_IM),
        .AR_out(data_from_AR_to_M),
        .finish(finish_wire),
        .test(test_wire),
        .test2(test2_wire),
        .test3(test3_wire),
        .test4(test4_wire),
        .current_micro_instruction(current_micro_instruction_wire)
        );
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
