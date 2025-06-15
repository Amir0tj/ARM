//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Wed Jun 11 15:46:28 2025
//Host        : AmirTJ running 64-bit major release  (build 9200)
//Command     : generate_target ARM_amir.bd
//Design      : ARM_amir
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ARM_amir,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ARM_amir,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=53,numReposBlks=50,numNonXlnxBlks=0,numHierBlks=3,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=24,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "ARM_amir.hwdef" *) 
module ARM_amir
   (clk_1,
    rst_1);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_1 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_1, ASSOCIATED_RESET rst_1, CLK_DOMAIN ARM_amir_clk_1, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_1 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_1, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst_1;

  wire [31:0]EXE_Stage_ALU_Res_0;
  wire [31:0]EXE_Stage_B_Addr;
  wire [31:0]EXE_Stage_Reg_0_ALU_Res_out;
  wire [3:0]EXE_Stage_Reg_0_Dest_out;
  wire EXE_Stage_Reg_0_MEM_R_EN_out;
  wire [31:0]EXE_Stage_Reg_0_Val_Rm_out;
  wire EXE_Stage_Reg_MEM_W_EN_out;
  wire EXE_Stage_Reg_WB_EN_out;
  wire [3:0]EXE_Stage_status_out_0;
  wire HazardUnit_0_Hazard_out;
  wire ID_Stage_Reg_0_B_out;
  wire [3:0]ID_Stage_Reg_0_EXE_CMD_out;
  wire ID_Stage_Reg_0_I_out;
  wire [23:0]ID_Stage_Reg_0_Imm24_out;
  wire ID_Stage_Reg_0_MEM_R_EN_out;
  wire ID_Stage_Reg_0_MEM_W_EN_out;
  wire [31:0]ID_Stage_Reg_0_PC_out;
  wire ID_Stage_Reg_0_S_out;
  wire [31:0]ID_Stage_Reg_0_Val_Rm_out;
  wire [31:0]ID_Stage_Reg_0_Val_Rn_out;
  wire [11:0]ID_Stage_Reg_0_shift_operand_out;
  wire [3:0]ID_Stage_Reg_Dest_out;
  wire ID_Stage_Reg_WB_EN_out;
  wire [3:0]ID_Stage_Reg_status_out;
  wire [0:0]ID_stage_B_out;
  wire [3:0]ID_stage_EXE_CMD_out;
  wire [0:0]ID_stage_MEM_R_EN_out;
  wire [3:0]ID_stage_Rm_Out;
  wire [0:0]ID_stage_S_out;
  wire ID_stage_Two_src;
  wire [31:0]ID_stage_Val_Rm;
  wire [31:0]ID_stage_Val_Rn;
  wire [0:0]ID_stage_WB_EN_out;
  wire [31:0]IF_STAGE_instruction;
  wire [31:0]IF_STAGE_pc;
  wire [31:0]IF_Stage_Reg_0_Instruction;
  wire [31:0]IF_Stage_Reg_PC;
  wire [3:0]MEM_Stage_Reg_0_Dest_out;
  wire MEM_Stage_Reg_0_MEM_R_EN_out;
  wire MEM_Stage_Reg_0_WB_EN_out;
  wire [31:0]MEM_Stage_Reg_ALU_Res_out;
  wire [31:0]MEM_Stage_Reg_Data_Mem_out;
  wire [0:0]MEM_W_EN_1;
  wire [3:0]RD_in_1;
  wire [3:0]RM_in_1;
  wire [3:0]RN_in_1;
  wire [0:0]S_in_1;
  wire [3:0]StatusRegister_0_status_out;
  wire [0:0]V_in_1;
  wire [31:0]WB_Value_in_1;
  wire clk_1_1;
  wire [31:0]dist_mem_gen_0_spo;
  wire [0:0]imm_1;
  wire rst_1_1;
  wire [0:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;
  wire [3:0]xlslice_0_Dout1;
  wire [23:0]xlslice_12_Dout;
  wire [12:0]xlslice_14_Dout;
  wire [1:0]xlslice_1_Dout1;
  wire [3:0]xlslice_3_Dout1;
  wire [11:0]xlslice_7_Dout;

  assign clk_1_1 = clk_1;
  assign rst_1_1 = rst_1;
  EXE_Stage_imp_1QBV0IJ EXE_Stage
       (.ALU_Res_0(EXE_Stage_ALU_Res_0),
        .B_Addr(EXE_Stage_B_Addr),
        .EXE_CMD_in_1(ID_Stage_Reg_0_EXE_CMD_out),
        .I_in_0(ID_Stage_Reg_0_I_out),
        .V_in(V_in_1),
        .Val1_in_0(ID_Stage_Reg_0_Val_Rn_out),
        .Val_Rm_in_0(ID_Stage_Reg_0_Val_Rm_out),
        .a_0(ID_Stage_Reg_0_MEM_R_EN_out),
        .b_0(ID_Stage_Reg_0_MEM_W_EN_out),
        .in1_0(ID_Stage_Reg_0_PC_out),
        .in2_1(ID_Stage_Reg_0_Imm24_out),
        .shift_operand_in_0(ID_Stage_Reg_0_shift_operand_out),
        .status_out_0(EXE_Stage_status_out_0));
  ARM_amir_EXE_Stage_Reg_0_2 EXE_Stage_Reg
       (.ALU_Res_in(EXE_Stage_ALU_Res_0),
        .ALU_Res_out(EXE_Stage_Reg_0_ALU_Res_out),
        .Dest_in(ID_Stage_Reg_Dest_out),
        .Dest_out(EXE_Stage_Reg_0_Dest_out),
        .MEM_R_EN_in(ID_stage_MEM_R_EN_out),
        .MEM_R_EN_out(EXE_Stage_Reg_0_MEM_R_EN_out),
        .MEM_W_EN_in(ID_Stage_Reg_0_MEM_W_EN_out),
        .MEM_W_EN_out(EXE_Stage_Reg_MEM_W_EN_out),
        .Val_Rm_in(ID_stage_Val_Rm),
        .Val_Rm_out(EXE_Stage_Reg_0_Val_Rm_out),
        .WB_EN_in(ID_Stage_Reg_WB_EN_out),
        .WB_EN_out(EXE_Stage_Reg_WB_EN_out),
        .clk(clk_1_1),
        .clr(xlconstant_1_dout),
        .en(xlconstant_0_dout),
        .rst(rst_1_1));
  ARM_amir_HazardUnit_0_0 HazardUnit_0
       (.EXE_Dest(ID_Stage_Reg_Dest_out),
        .EXE_WB_EN(ID_Stage_Reg_WB_EN_out),
        .Hazard_out(HazardUnit_0_Hazard_out),
        .MEM_Dest(EXE_Stage_Reg_0_Dest_out),
        .MEM_WB_EN(EXE_Stage_Reg_WB_EN_out),
        .Rn(RN_in_1),
        .Two_src(ID_stage_Two_src),
        .src2_in(ID_stage_Rm_Out));
  ARM_amir_ID_Stage_Reg_0_5 ID_Stage_Reg
       (.B_in(ID_stage_B_out),
        .B_out(ID_Stage_Reg_0_B_out),
        .Dest_in(RD_in_1),
        .Dest_out(ID_Stage_Reg_Dest_out),
        .EXE_CMD_in(ID_stage_EXE_CMD_out),
        .EXE_CMD_out(ID_Stage_Reg_0_EXE_CMD_out),
        .I_in(imm_1),
        .I_out(ID_Stage_Reg_0_I_out),
        .Imm24_in(xlslice_12_Dout),
        .Imm24_out(ID_Stage_Reg_0_Imm24_out),
        .MEM_R_EN_in(ID_stage_MEM_R_EN_out),
        .MEM_R_EN_out(ID_Stage_Reg_0_MEM_R_EN_out),
        .MEM_W_EN_in(MEM_W_EN_1),
        .MEM_W_EN_out(ID_Stage_Reg_0_MEM_W_EN_out),
        .PC_in(IF_Stage_Reg_PC),
        .PC_out(ID_Stage_Reg_0_PC_out),
        .S_in(ID_stage_S_out),
        .S_out(ID_Stage_Reg_0_S_out),
        .Val_Rm_in(ID_stage_Val_Rm),
        .Val_Rm_out(ID_Stage_Reg_0_Val_Rm_out),
        .Val_Rn_in(ID_stage_Val_Rn),
        .Val_Rn_out(ID_Stage_Reg_0_Val_Rn_out),
        .WB_EN_in(ID_stage_WB_EN_out),
        .WB_EN_out(ID_Stage_Reg_WB_EN_out),
        .clk(clk_1_1),
        .clr(ID_Stage_Reg_0_B_out),
        .rst(rst_1_1),
        .shift_operand_in(xlslice_7_Dout),
        .shift_operand_out(ID_Stage_Reg_0_shift_operand_out),
        .status_in(StatusRegister_0_status_out),
        .status_out(ID_Stage_Reg_status_out));
  ID_stage_imp_1RXNWS6 ID_stage
       (.B_out(ID_stage_B_out),
        .EXE_CMD_out(ID_stage_EXE_CMD_out),
        .Hazard(HazardUnit_0_Hazard_out),
        .MEM_R_EN_out(ID_stage_MEM_R_EN_out),
        .MEM_W_EN(MEM_W_EN_1),
        .MEM_W_EN_out(MEM_W_EN_1),
        .Op_code(xlslice_3_Dout1),
        .RD_in(RD_in_1),
        .RM_in(RM_in_1),
        .RN_in(RN_in_1),
        .Rm_Out(ID_stage_Rm_Out),
        .S_in(S_in_1),
        .S_out(ID_stage_S_out),
        .Two_src(ID_stage_Two_src),
        .Val_Rm(ID_stage_Val_Rm),
        .Val_Rn(ID_stage_Val_Rn),
        .WB_Dest_in(MEM_Stage_Reg_0_Dest_out),
        .WB_EN_out(ID_stage_WB_EN_out),
        .WB_Value_in(WB_Value_in_1),
        .WB_WB_EN_in(MEM_Stage_Reg_0_WB_EN_out),
        .clk_1(clk_1_1),
        .cond_in(xlslice_0_Dout1),
        .imm(imm_1),
        .mode(xlslice_1_Dout1),
        .rst_1(rst_1_1),
        .status_in(StatusRegister_0_status_out));
  IF_STAGE_imp_1CFTBBI IF_STAGE
       (.B(ID_Stage_Reg_0_B_out),
        .B_Addr(EXE_Stage_B_Addr),
        .Freeze(HazardUnit_0_Hazard_out),
        .clk_0(clk_1_1),
        .instruction(IF_STAGE_instruction),
        .pc(IF_STAGE_pc),
        .rst_0(rst_1_1));
  ARM_amir_IF_Stage_Reg_0_0 IF_Stage_Reg
       (.Instruction(IF_Stage_Reg_0_Instruction),
        .Instruction_in(IF_STAGE_instruction),
        .PC(IF_Stage_Reg_PC),
        .PC_in(IF_STAGE_pc),
        .clk(clk_1_1),
        .flush(ID_Stage_Reg_0_B_out),
        .freeze(HazardUnit_0_Hazard_out),
        .rst(rst_1_1));
  ARM_amir_dist_mem_gen_0_0 MEM_Stage
       (.a(xlslice_14_Dout),
        .clk(clk_1_1),
        .d(EXE_Stage_Reg_0_Val_Rm_out),
        .spo(dist_mem_gen_0_spo),
        .we(EXE_Stage_Reg_MEM_W_EN_out));
  ARM_amir_MEM_Stage_Reg_0_1 MEM_Stage_Reg
       (.ALU_Res_in(EXE_Stage_Reg_0_ALU_Res_out),
        .ALU_Res_out(MEM_Stage_Reg_ALU_Res_out),
        .Data_Mem_in(dist_mem_gen_0_spo),
        .Data_Mem_out(MEM_Stage_Reg_Data_Mem_out),
        .Dest_in(EXE_Stage_Reg_0_Dest_out),
        .Dest_out(MEM_Stage_Reg_0_Dest_out),
        .MEM_R_EN_in(EXE_Stage_Reg_0_MEM_R_EN_out),
        .MEM_R_EN_out(MEM_Stage_Reg_0_MEM_R_EN_out),
        .WB_EN_in(EXE_Stage_Reg_WB_EN_out),
        .WB_EN_out(MEM_Stage_Reg_0_WB_EN_out),
        .clk(clk_1_1),
        .rst(rst_1_1));
  ARM_amir_StatusRegister_0_0 StatusRegister_0
       (.S_in(ID_Stage_Reg_0_S_out),
        .clk(clk_1_1),
        .rst(rst_1_1),
        .status_in(EXE_Stage_status_out_0),
        .status_out(StatusRegister_0_status_out));
  ARM_amir_mux2to1_32bit_0_0 mux2to1_32bit
       (.in0(MEM_Stage_Reg_ALU_Res_out),
        .in1(MEM_Stage_Reg_Data_Mem_out),
        .out(WB_Value_in_1),
        .sel(MEM_Stage_Reg_0_MEM_R_EN_out));
  ARM_amir_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  ARM_amir_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  ARM_amir_xlslice_0_1 xlslice_0
       (.Din(IF_Stage_Reg_0_Instruction),
        .Dout(xlslice_0_Dout1));
  ARM_amir_xlslice_1_1 xlslice_1
       (.Din(IF_Stage_Reg_0_Instruction),
        .Dout(xlslice_1_Dout1));
  ARM_amir_xlslice_12_0 xlslice_12
       (.Din(IF_Stage_Reg_0_Instruction),
        .Dout(xlslice_12_Dout));
  ARM_amir_xlslice_14_0 xlslice_14
       (.Din(EXE_Stage_Reg_0_ALU_Res_out),
        .Dout(xlslice_14_Dout));
  ARM_amir_xlslice_15_0 xlslice_15
       (.Din(ID_Stage_Reg_status_out),
        .Dout(V_in_1));
  ARM_amir_xlslice_2_1 xlslice_2
       (.Din(IF_Stage_Reg_0_Instruction),
        .Dout(imm_1));
  ARM_amir_xlslice_3_2 xlslice_3
       (.Din(IF_Stage_Reg_0_Instruction),
        .Dout(xlslice_3_Dout1));
  ARM_amir_xlslice_4_2 xlslice_4
       (.Din(IF_Stage_Reg_0_Instruction),
        .Dout(S_in_1));
  ARM_amir_xlslice_5_2 xlslice_5
       (.Din(IF_Stage_Reg_0_Instruction),
        .Dout(RN_in_1));
  ARM_amir_xlslice_6_0 xlslice_6
       (.Din(IF_Stage_Reg_0_Instruction),
        .Dout(RD_in_1));
  ARM_amir_xlslice_7_0 xlslice_7
       (.Din(IF_Stage_Reg_0_Instruction),
        .Dout(xlslice_7_Dout));
  ARM_amir_xlslice_8_0 xlslice_8
       (.Din(xlslice_7_Dout),
        .Dout(RM_in_1));
endmodule

module EXE_Stage_imp_1QBV0IJ
   (ALU_Res_0,
    B_Addr,
    EXE_CMD_in_1,
    I_in_0,
    V_in,
    Val1_in_0,
    Val_Rm_in_0,
    a_0,
    b_0,
    in1_0,
    in2_1,
    shift_operand_in_0,
    status_out_0);
  output [31:0]ALU_Res_0;
  output [31:0]B_Addr;
  input [3:0]EXE_CMD_in_1;
  input I_in_0;
  input V_in;
  input [31:0]Val1_in_0;
  input [31:0]Val_Rm_in_0;
  input a_0;
  input b_0;
  input [31:0]in1_0;
  input [23:0]in2_1;
  input [11:0]shift_operand_in_0;
  output [3:0]status_out_0;

  wire [31:0]ALU_0_ALU_Res;
  wire [3:0]ALU_0_status_out;
  wire [31:0]Adder_0_out;
  wire [3:0]EXE_CMD_in_1_1;
  wire I_in_0_1;
  wire OR_0_y;
  wire [31:0]Val1_in_0_1;
  wire [31:0]Val2Generate_0_Val2;
  wire [31:0]Val_Rm_in_0_1;
  wire a_0_1;
  wire b_0_2;
  wire [31:0]in1_0_1;
  wire [23:0]in2_1_1;
  wire [11:0]shift_operand_in_0_1;
  wire status_in_2_1;

  assign ALU_Res_0[31:0] = ALU_0_ALU_Res;
  assign B_Addr[31:0] = Adder_0_out;
  assign EXE_CMD_in_1_1 = EXE_CMD_in_1[3:0];
  assign I_in_0_1 = I_in_0;
  assign Val1_in_0_1 = Val1_in_0[31:0];
  assign Val_Rm_in_0_1 = Val_Rm_in_0[31:0];
  assign a_0_1 = a_0;
  assign b_0_2 = b_0;
  assign in1_0_1 = in1_0[31:0];
  assign in2_1_1 = in2_1[23:0];
  assign shift_operand_in_0_1 = shift_operand_in_0[11:0];
  assign status_in_2_1 = V_in;
  assign status_out_0[3:0] = ALU_0_status_out;
  ARM_amir_ALU_0_0 ALU_0
       (.ALU_Res(ALU_0_ALU_Res),
        .EXE_CMD_in(EXE_CMD_in_1_1),
        .Val1_in(Val1_in_0_1),
        .Val2_in(Val2Generate_0_Val2),
        .status_in(status_in_2_1),
        .status_out(ALU_0_status_out));
  ARM_amir_Adder_0_3 Adder_0
       (.in1(in1_0_1),
        .in2(in2_1_1),
        .out(Adder_0_out));
  ARM_amir_OR_0_1 OR_0
       (.a(a_0_1),
        .b(b_0_2),
        .y(OR_0_y));
  ARM_amir_Val2Generate_0_0 Val2Generate_0
       (.Out_or(OR_0_y),
        .Shift_operand(shift_operand_in_0_1),
        .Val2(Val2Generate_0_Val2),
        .Val_Rm(Val_Rm_in_0_1),
        .imm(I_in_0_1));
endmodule

module ID_stage_imp_1RXNWS6
   (B_out,
    EXE_CMD_out,
    Hazard,
    MEM_R_EN_out,
    MEM_W_EN,
    MEM_W_EN_out,
    Op_code,
    RD_in,
    RM_in,
    RN_in,
    Rm_Out,
    S_in,
    S_out,
    Two_src,
    Val_Rm,
    Val_Rn,
    WB_Dest_in,
    WB_EN_out,
    WB_Value_in,
    WB_WB_EN_in,
    clk_1,
    cond_in,
    imm,
    mode,
    rst_1,
    status_in);
  output [0:0]B_out;
  output [3:0]EXE_CMD_out;
  input Hazard;
  output [0:0]MEM_R_EN_out;
  input MEM_W_EN;
  output [0:0]MEM_W_EN_out;
  input [3:0]Op_code;
  input [3:0]RD_in;
  input [3:0]RM_in;
  input [3:0]RN_in;
  output [3:0]Rm_Out;
  input S_in;
  output [0:0]S_out;
  output Two_src;
  output [31:0]Val_Rm;
  output [31:0]Val_Rn;
  input [3:0]WB_Dest_in;
  output [0:0]WB_EN_out;
  input [31:0]WB_Value_in;
  input WB_WB_EN_in;
  input clk_1;
  input [3:0]cond_in;
  input imm;
  input [1:0]mode;
  input rst_1;
  input [3:0]status_in;

  wire ConditionCheck_0_cond_out;
  wire ControlUnit_0_B;
  wire [3:0]ControlUnit_0_Execute_Command;
  wire ControlUnit_0_S_out;
  wire ControlUnit_0_WB_Enable;
  wire ControlUnit_0_mem_read;
  wire ControlUnit_0_mem_write;
  wire [3:0]Dest_wb_0_1;
  wire IN_0_1;
  wire Not_0_OUT;
  wire Not_1_OUT;
  wire OR_0_y;
  wire OR_1_y;
  wire [3:0]Op_code_0_1;
  wire [3:0]RD_in_1;
  wire [3:0]RM_in_1;
  wire [31:0]RegisterFile_0_reg1;
  wire [31:0]RegisterFile_0_reg2;
  wire [31:0]Result_WB_0_1;
  wire S_0_1;
  wire b_0_1;
  wire b_1_1;
  wire clk_1_1;
  wire [3:0]cond_in_0_1;
  wire [1:0]mode_0_1;
  wire [3:0]mux2to1_4bit_0_out;
  wire [8:0]mux2to1_9bit_0_out;
  wire rst_1_1;
  wire [3:0]src1_0_1;
  wire [3:0]status_in_0_1;
  wire writeBackEn_0_1;
  wire [8:0]xlconcat_0_dout;
  wire [8:0]xlconstant_0_dout;
  wire [3:0]xlslice_0_Dout;
  wire [0:0]xlslice_1_Dout;
  wire [0:0]xlslice_2_Dout;
  wire [0:0]xlslice_3_Dout;
  wire [0:0]xlslice_4_Dout;
  wire [0:0]xlslice_5_Dout;

  assign B_out[0] = xlslice_3_Dout;
  assign Dest_wb_0_1 = WB_Dest_in[3:0];
  assign EXE_CMD_out[3:0] = xlslice_0_Dout;
  assign IN_0_1 = imm;
  assign MEM_R_EN_out[0] = xlslice_1_Dout;
  assign MEM_W_EN_out[0] = xlslice_4_Dout;
  assign Op_code_0_1 = Op_code[3:0];
  assign RD_in_1 = RD_in[3:0];
  assign RM_in_1 = RM_in[3:0];
  assign Result_WB_0_1 = WB_Value_in[31:0];
  assign Rm_Out[3:0] = mux2to1_4bit_0_out;
  assign S_0_1 = S_in;
  assign S_out[0] = xlslice_5_Dout;
  assign Two_src = OR_1_y;
  assign Val_Rm[31:0] = RegisterFile_0_reg2;
  assign Val_Rn[31:0] = RegisterFile_0_reg1;
  assign WB_EN_out[0] = xlslice_2_Dout;
  assign b_0_1 = Hazard;
  assign b_1_1 = MEM_W_EN;
  assign clk_1_1 = clk_1;
  assign cond_in_0_1 = cond_in[3:0];
  assign mode_0_1 = mode[1:0];
  assign rst_1_1 = rst_1;
  assign src1_0_1 = RN_in[3:0];
  assign status_in_0_1 = status_in[3:0];
  assign writeBackEn_0_1 = WB_WB_EN_in;
  ARM_amir_ConditionCheck_0_0 ConditionCheck_0
       (.cond_in(cond_in_0_1),
        .cond_out(ConditionCheck_0_cond_out),
        .status_in(status_in_0_1));
  ARM_amir_ControlUnit_0_0 ControlUnit_0
       (.B(ControlUnit_0_B),
        .Execute_Command(ControlUnit_0_Execute_Command),
        .Op_code(Op_code_0_1),
        .S(S_0_1),
        .S_out(ControlUnit_0_S_out),
        .WB_Enable(ControlUnit_0_WB_Enable),
        .mem_read(ControlUnit_0_mem_read),
        .mem_write(ControlUnit_0_mem_write),
        .mode(mode_0_1));
  ARM_amir_Not_0_0 Not_0
       (.IN(ConditionCheck_0_cond_out),
        .OUT(Not_0_OUT));
  ARM_amir_Not_1_0 Not_1
       (.IN(IN_0_1),
        .OUT(Not_1_OUT));
  ARM_amir_OR_0_0 OR_0
       (.a(Not_0_OUT),
        .b(b_0_1),
        .y(OR_0_y));
  ARM_amir_OR_1_0 OR_1
       (.a(Not_1_OUT),
        .b(b_1_1),
        .y(OR_1_y));
  ARM_amir_RegisterFile_0_0 RegisterFile_0
       (.Dest_wb(Dest_wb_0_1),
        .Result_WB(Result_WB_0_1),
        .clk(clk_1_1),
        .reg1(RegisterFile_0_reg1),
        .reg2(RegisterFile_0_reg2),
        .rst(rst_1_1),
        .src1(src1_0_1),
        .src2(mux2to1_4bit_0_out),
        .writeBackEn(writeBackEn_0_1));
  ARM_amir_mux2to1_4bit_0_0 mux2to1_4bit_0
       (.in0(RM_in_1),
        .in1(RD_in_1),
        .out(mux2to1_4bit_0_out),
        .sel(ControlUnit_0_mem_write));
  ARM_amir_mux2to1_9bit_0_0 mux2to1_9bit_0
       (.in0(xlconcat_0_dout),
        .in1(xlconstant_0_dout),
        .out(mux2to1_9bit_0_out),
        .sel(OR_0_y));
  ARM_amir_xlconcat_0_0 xlconcat_0
       (.In0(ControlUnit_0_Execute_Command),
        .In1(ControlUnit_0_mem_read),
        .In2(ControlUnit_0_WB_Enable),
        .In3(ControlUnit_0_B),
        .In4(ControlUnit_0_mem_write),
        .In5(ControlUnit_0_S_out),
        .dout(xlconcat_0_dout));
  ARM_amir_xlconstant_0_2 xlconstant_0
       (.dout(xlconstant_0_dout));
  ARM_amir_xlslice_0_0 xlslice_0
       (.Din(mux2to1_9bit_0_out),
        .Dout(xlslice_0_Dout));
  ARM_amir_xlslice_1_0 xlslice_1
       (.Din(mux2to1_9bit_0_out),
        .Dout(xlslice_1_Dout));
  ARM_amir_xlslice_2_0 xlslice_2
       (.Din(mux2to1_9bit_0_out),
        .Dout(xlslice_2_Dout));
  ARM_amir_xlslice_3_0 xlslice_3
       (.Din(mux2to1_9bit_0_out),
        .Dout(xlslice_3_Dout));
  ARM_amir_xlslice_4_0 xlslice_4
       (.Din(mux2to1_9bit_0_out),
        .Dout(xlslice_4_Dout));
  ARM_amir_xlslice_5_0 xlslice_5
       (.Din(mux2to1_9bit_0_out),
        .Dout(xlslice_5_Dout));
endmodule

module IF_STAGE_imp_1CFTBBI
   (B,
    B_Addr,
    Freeze,
    clk_0,
    instruction,
    pc,
    rst_0);
  input B;
  input [31:0]B_Addr;
  input Freeze;
  input clk_0;
  output [31:0]instruction;
  output [31:0]pc;
  input rst_0;

  wire [31:0]Adder_0_out;
  wire Freeze_1;
  wire [31:0]MUX2to1_0_out;
  wire Not_0_OUT;
  wire [31:0]REG_0_out;
  wire clk_0_1;
  wire [31:0]dist_mem_gen_0_spo;
  wire [31:0]in2_0_1;
  wire rst_0_1;
  wire select_0_1;
  wire [31:0]xlconstant_0_dout;
  wire [12:0]xlslice_0_Dout;

  assign Freeze_1 = Freeze;
  assign clk_0_1 = clk_0;
  assign in2_0_1 = B_Addr[31:0];
  assign instruction[31:0] = dist_mem_gen_0_spo;
  assign pc[31:0] = Adder_0_out;
  assign rst_0_1 = rst_0;
  assign select_0_1 = B;
  ARM_amir_Adder_0_1 Adder_0
       (.in1(xlconstant_0_dout),
        .in2(REG_0_out[23:0]),
        .out(Adder_0_out));
  ARM_amir_MUX2to1_0_1 MUX2to1_0
       (.in1(Adder_0_out),
        .in2(in2_0_1),
        .out(MUX2to1_0_out),
        .select(select_0_1));
  ARM_amir_Not_0_1 Not_0
       (.IN(Freeze_1),
        .OUT(Not_0_OUT));
  ARM_amir_REG_0_1 REG_0
       (.clk(clk_0_1),
        .enable(Not_0_OUT),
        .in(MUX2to1_0_out),
        .out(REG_0_out),
        .rst(rst_0_1));
  ARM_amir_dist_mem_gen_0_1 dist_mem_gen_0
       (.a(xlslice_0_Dout),
        .spo(dist_mem_gen_0_spo));
  ARM_amir_xlconstant_0_1 xlconstant_0
       (.dout(xlconstant_0_dout));
  ARM_amir_xlslice_0_2 xlslice_0
       (.Din(REG_0_out),
        .Dout(xlslice_0_Dout));
endmodule
