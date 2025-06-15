module ID_Stage_Reg (
    input clk, rst, clr, WB_EN_in, MEM_R_EN_in, MEM_W_EN_in, B_in, S_in, I_in,
    input[3:0] EXE_CMD_in, Dest_in, status_in,
    input [11:0] shift_operand_in,
    input [23:0] Imm24_in,
    input[31:0] PC_in, Val_Rm_in, Val_Rn_in,
    output reg WB_EN_out, MEM_R_EN_out, MEM_W_EN_out, B_out, S_out, I_out,
    output reg[3:0] EXE_CMD_out, Dest_out, status_out, 
    output reg[11:0] shift_operand_out,
    output reg[23:0] Imm24_out,
    output reg[31:0] PC_out, Val_Rm_out, Val_Rn_out
);

    always@(posedge clk, posedge rst) begin
        if (rst) begin
            WB_EN_out        <= 1'b0;
            MEM_R_EN_out     <= 1'b0;
            MEM_W_EN_out     <= 1'b0;
            B_out            <= 1'b0;
            S_out            <= 1'b0;
            I_out            <= 1'b0;
            EXE_CMD_out      <= 4'b0;
            Dest_out         <= 4'b0;
            status_out       <= 4'b0;
            shift_operand_out <= 12'b0;
            Imm24_out        <= 24'b0;
            PC_out           <= 32'b0;
            Val_Rm_out       <= 32'b0;
            Val_Rn_out       <= 32'b0;
        end 
        else if (clr) begin
            WB_EN_out        <= 1'b0;
            MEM_R_EN_out     <= 1'b0;
            MEM_W_EN_out     <= 1'b0;
            B_out            <= 1'b0;
            S_out            <= 1'b0;
            I_out            <= 1'b0;
            EXE_CMD_out      <= 4'b0;
            Dest_out         <= 4'b0;
            status_out       <= 4'b0;
            shift_operand_out <= 12'b0;
            Imm24_out        <= 24'b0;
            PC_out           <= 32'b0;
            Val_Rm_out       <= 32'b0;
            Val_Rn_out       <= 32'b0;
        end
        else  begin
            WB_EN_out        <= WB_EN_in;
            MEM_R_EN_out     <= MEM_R_EN_in;
            MEM_W_EN_out     <= MEM_W_EN_in;
            B_out            <= B_in;
            S_out            <= S_in;
            I_out            <= I_in;
            EXE_CMD_out      <= EXE_CMD_in;
            Dest_out         <= Dest_in;
            status_out       <= status_in;
            shift_operand_out <= shift_operand_in;
            Imm24_out        <= Imm24_in;
            PC_out           <= PC_in;
            Val_Rm_out       <= Val_Rm_in;
            Val_Rn_out       <= Val_Rn_in;
            
        end
    end

endmodule