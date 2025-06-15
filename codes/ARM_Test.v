module ARM_Test (
    input clk, rst
);

    wire [31:0] pcOutIF, InstructionIFOut, BranchAddr;
    IF_Stage ifStage(.clk(clk), .rst(rst), .freeze(1'b0), .Branch_taken(1'b0), .BranchAddr(BranchAddr), .PC(pcOutIF),
     .Instruction(InstructionIFOut));

    wire [31:0] pcOutIFReg, InstructionIFRegOut, pcOutEXE, pcOutMEM, pcOutWB, pcOutIDReg, pcOutEXEReg, pcOutMEMReg, pcOutWBReg;
    IF_Stage_Reg ifStageReg(.clk(clk), .rst(rst), .freeze(1'b0), .flush(1'b0), .PC_in(pcOutIF), .Instruction_in(InstructionIFOut), .PC(pcOutIFReg),
    .Instruction(InstructionIFRegOut)); 

    wire [31:0] Val_Rn_IDOut, Val_Rm_IDOut;
    wire Two_src, S_IDOut, B_IDOut, MEM_W_EN_IDOut, MEM_R_EN_IDOut, WB_EN_IDOut, I_IDOut;
    wire [3:0] EXE_CMD_IDOut, Dest_IDOut, src1_IDOut, src2_IDOut;
    wire [11:0] shift_operand_IDOut;
    wire [23:0] Imm24_IDOut;
    ID_Stage idStage(.clk(clk), .rst(rst), .WB_EN_in(1'b0), .Hazard_in(1'b0), .WB_Dest(4'b0), .status_in(4'b0000), .Instruction_in(InstructionIFRegOut),
    .WB_Value(32'b0), .Val_Rn_out(Val_Rn_IDOut), .Val_Rm_out(Val_Rm_IDOut), .Two_src(Two_src), .S_out(S_IDOut), .B_out(B_IDOut),
    .MEM_W_EN_out(MEM_W_EN_IDOut), .MEM_R_EN_out(MEM_R_EN_IDOut), .WB_EN_out(WB_EN_IDOut), .I_out(I_IDOut), .EXE_CMD_out(EXE_CMD_IDOut),
    .Dest_out(Dest_IDOut), .src1_out(src1_IDOut), .src2_out(src2_IDOut), .shift_operand_out(shift_operand_IDOut), .Imm24_out(Imm24_IDOut));

    wire WB_EN_IDRegOut, MEM_R_EN_IDRegOut, MEM_W_EN_IDRegOut, B_IDRegOut, S_IDRegOut, I_IDRegOut;
    wire[3:0] EXE_CMD_IDRegOut, Dest_IDRegOut, status_IDRegOut, src1_IDRegOut, src2_IDRegOut;
    wire[11:0] shift_operand_IDRegOut;
    wire[23:0] Imm24_IDRegOut;
    wire[31:0] Val_Rm_IDRegOut, Val_Rn_IDRegOut;
    ID_Stage_Reg idStageReg(.clk(clk), .rst(rst), .en(1'b1), .clr(1'b0), .WB_EN_in(WB_EN_IDOut), .MEM_R_EN_in(MEM_R_EN_IDOut),
    .MEM_W_EN_in(MEM_W_EN_IDOut), .B_in(B_IDOut), .S_in(S_IDOut), .I_in(I_IDOut), .EXE_CMD_in(EXE_CMD_IDOut), .Dest_in(Dest_IDOut),
    .status_in(4'b0), .src1_in(src1_IDOut), .src2_in(src2_IDOut), .shift_operand_in(shift_operand_IDOut), .Imm24_in(Imm24_IDOut),
    .PC_in(pcOutIFReg), .Val_Rm_in(Val_Rm_IDOut), .Val_Rn_in(Val_Rn_IDOut), .WB_EN_out(WB_EN_IDRegOut), .MEM_R_EN_out(MEM_R_EN_IDRegOut),
    .MEM_W_EN_out(MEM_W_EN_IDRegOut), .B_out(B_IDRegOut), .S_out(S_IDRegOut), .I_out(I_IDRegOut), .EXE_CMD_out(EXE_CMD_IDRegOut),
    .Dest_out(Dest_IDRegOut), .status_out(status_IDRegOut), .src1_out(src1_IDRegOut), .src2_out(src2_IDRegOut),
    .shift_operand_out(shift_operand_IDRegOut), .Imm24_out(Imm24_IDRegOut), .Val_Rm_out(Val_Rm_IDRegOut), .Val_Rn_out(Val_Rn_IDRegOut),
    .PC_out(pcOutIDReg));

    EXE_Stage exeStage(.clk(clk), .rst(rst), .PC_in(pcOutIDReg), .PC(pcOutEXE));
    EXE_Stage_Reg exeStageReg(.clk(clk), .rst(rst), .PC_in(pcOutEXE), .PC(pcOutEXEReg));

    MEM_Stage memStage(.clk(clk), .rst(rst), .PC_in(pcOutEXEReg), .PC(pcOutMEM));
    MEM_Stage_Reg memStageReg(.clk(clk), .rst(rst), .PC_in(pcOutMEM), .PC(pcOutMEMReg));

    WB_Stage wbStage(.clk(clk), .rst(rst), .PC_in(pcOutMEMReg), .PC(pcOutWB));
    WB_Stage_Reg wbStageReg(.clk(clk), .rst(rst), .PC_in(pcOutWB), .PC(pcOutWBReg));

endmodule
