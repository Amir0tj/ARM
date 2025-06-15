//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Tue May 13 10:29:01 2025
//Host        : AmirTJ running 64-bit major release  (build 9200)
//Command     : generate_target iF_ARM.bd
//Design      : iF_ARM
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "iF_ARM,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=iF_ARM,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_BD}" *) (* HW_HANDOFF = "iF_ARM.hwdef" *) 
module iF_ARM
   (clk_0,
    enable_0,
    flush_0,
    freeze_0,
    in2_0,
    instruction,
    pc,
    rst_0,
    select_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN iF_ARM_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk_0;
  input enable_0;
  input flush_0;
  input freeze_0;
  input [31:0]in2_0;
  output [31:0]instruction;
  output [31:0]pc;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_0;
  input select_0;

  wire [31:0]Adder_0_out;
  wire [31:0]MUX2to1_0_out;
  wire [31:0]REG_0_out;
  wire [31:0]blk_mem_gen_2_douta;
  wire clk_0_1;
  wire enable_0_1;
  wire [31:0]in2_0_1;
  wire rst_0_1;
  wire select_0_1;
  wire [0:0]xlconstant_0_dout;

  assign clk_0_1 = clk_0;
  assign enable_0_1 = enable_0;
  assign in2_0_1 = in2_0[31:0];
  assign instruction[31:0] = blk_mem_gen_2_douta;
  assign pc[31:0] = Adder_0_out;
  assign rst_0_1 = rst_0;
  assign select_0_1 = select_0;
  iF_ARM_Adder_0_0 Adder_0
       (.in1(xlconstant_0_dout),
        .in2(REG_0_out),
        .out(Adder_0_out));
  iF_ARM_MUX2to1_0_0 MUX2to1_0
       (.in1(Adder_0_out),
        .in2(in2_0_1),
        .out(MUX2to1_0_out),
        .select(select_0_1));
  iF_ARM_REG_0_0 REG_0
       (.clk(clk_0_1),
        .enable(enable_0_1),
        .in(MUX2to1_0_out),
        .out(REG_0_out),
        .rst(rst_0_1));
  iF_ARM_blk_mem_gen_2_1 blk_mem_gen_2
       (.addra(REG_0_out[12:0]),
        .clka(clk_0_1),
        .douta(blk_mem_gen_2_douta));
  iF_ARM_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
