//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Tue May 13 10:29:01 2025
//Host        : AmirTJ running 64-bit major release  (build 9200)
//Command     : generate_target iF_ARM_wrapper.bd
//Design      : iF_ARM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module iF_ARM_wrapper
   (clk_0,
    enable_0,
    flush_0,
    freeze_0,
    in2_0,
    instruction,
    pc,
    rst_0,
    select_0);
  input clk_0;
  input enable_0;
  input flush_0;
  input freeze_0;
  input [31:0]in2_0;
  output [31:0]instruction;
  output [31:0]pc;
  input rst_0;
  input select_0;

  wire clk_0;
  wire enable_0;
  wire flush_0;
  wire freeze_0;
  wire [31:0]in2_0;
  wire [31:0]instruction;
  wire [31:0]pc;
  wire rst_0;
  wire select_0;

  iF_ARM iF_ARM_i
       (.clk_0(clk_0),
        .enable_0(enable_0),
        .flush_0(flush_0),
        .freeze_0(freeze_0),
        .in2_0(in2_0),
        .instruction(instruction),
        .pc(pc),
        .rst_0(rst_0),
        .select_0(select_0));
endmodule
