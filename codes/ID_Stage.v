module ID_Stage (
    input clk, rst, WB_EN_in, Hazard_in, 
    input[3:0] WB_Dest, status_in, 
    input[31:0] Instruction_in, WB_Value, 
    output[31:0] Val_Rn_out, Val_Rm_out, 
    output Two_src, S_out, B_out, MEM_W_EN_out, MEM_R_EN_out, WB_EN_out, I_out, 
    output[3:0] EXE_CMD_out, Dest_out, src1_out, src2_out, 
    output[11:0] shift_operand_out,
    output[23:0] Imm24_out
);

    assign shift_operand_out = Instruction_in[11:0];
    wire[3:0] Rm;
    assign Rm = Instruction_in[3:0];
    assign Imm24_out = Instruction_in[23:0];
    wire[3:0] Rd;
    assign Rd = Instruction_in[15:12];
    assign Dest_out = Rd;
    wire[3:0] Rn;
    assign Rn = Instruction_in[19:16];
    assign src1_out = Rn;
    wire[0:0] S;
    assign S = Instruction_in[20];
    wire[3:0] Op_code;
    assign Op_code = Instruction_in[24:21];
    wire I;
    assign I = Instruction_in[25];
    assign I_out = I;
    wire[1:0] mode;
    assign mode = Instruction_in[27:26];
    wire[3:0] cond;
    assign cond = Instruction_in[31:28];

    wire[8:0] controlUnit_out;
    ControlUnit controlUnit(
        .Op_code(Op_code), .S(S), .mode(mode), .Execute_Command(controlUnit_out[3:0]), .S_out(controlUnit_out[4]), .B(controlUnit_out[5]),
        .mem_write(controlUnit_out[6]), .mem_read(controlUnit_out[7]), .WB_Enable(controlUnit_out[8])
    );

    wire conditionCheck_out;
    ConditionCheck conditionCheck(
        .cond_in(cond), .cond_out(conditionCheck_out), .status_in(status_in)
    );

    wire controlSignalsSelector;
    assign controlSignalsSelector = (~conditionCheck_out) | Hazard_in;

    wire[8:0] signals;
    MUX2to1 #(9) controlSignalsMux(
        .in1(controlUnit_out), .in2(9'b0), .select(controlSignalsSelector), .out(signals)
    );

    assign EXE_CMD_out  = signals[3:0];
    assign S_out = signals[4];
    assign B_out = signals[5];
    assign MEM_W_EN_out = signals[6]; 
    assign MEM_R_EN_out = signals[7];
    assign WB_EN_out = signals[8];

    wire[3:0] src2Mux_out;
    MUX2to1 #(4) src2Mux(
        .in1(Rm), .in2(Rd), .select(controlUnit_out[6]), .out(src2Mux_out)
    );
    assign src2_out = src2Mux_out;

    RegisterFile registerFile(
        .clk(clk), .rst(rst), .writeBackEn(WB_EN_in), .src1(Rn), .src2(src2Mux_out), .Dest_wb(WB_Dest), .Result_WB(WB_Value),
        .reg1(Val_Rn_out), .reg2(Val_Rm_out)
    );

    assign Two_src = ~I | controlUnit_out[6];

endmodule
