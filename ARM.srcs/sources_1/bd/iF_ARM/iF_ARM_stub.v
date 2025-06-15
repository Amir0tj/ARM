// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Apr  8 15:25:14 2025
// Host        : AmirTJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM_stub.v
// Design      : iF_ARM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module iF_ARM(clk_0, enable_0, flush_0, freeze_0, in2_0, 
  instruction, pc, rst_0, select_0)
/* synthesis syn_black_box black_box_pad_pin="clk_0,enable_0,flush_0,freeze_0,in2_0[31:0],instruction[31:0],pc[31:0],rst_0,select_0" */;
  input clk_0;
  input enable_0;
  input flush_0;
  input freeze_0;
  input [31:0]in2_0;
  output [31:0]instruction;
  output [31:0]pc;
  input rst_0;
  input select_0;
endmodule
