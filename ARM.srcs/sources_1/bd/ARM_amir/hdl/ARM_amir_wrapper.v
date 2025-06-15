//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Wed Jun 11 15:46:28 2025
//Host        : AmirTJ running 64-bit major release  (build 9200)
//Command     : generate_target ARM_amir_wrapper.bd
//Design      : ARM_amir_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ARM_amir_wrapper
   (clk_1,
    rst_1);
  input clk_1;
  input rst_1;

  wire clk_1;
  wire rst_1;

  ARM_amir ARM_amir_i
       (.clk_1(clk_1),
        .rst_1(rst_1));
endmodule
