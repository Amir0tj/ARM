module EXE_Stage_Reg(
    input clk, rst, en, clr,
    input WB_EN_in, MEM_R_EN_in, MEM_W_EN_in,
    input [3:0] Dest_in,
    input [31:0] ALU_Res_in, Val_Rm_in,
    output reg WB_EN_out, MEM_R_EN_out, MEM_W_EN_out,
    output reg[3:0] Dest_out,
    output reg[31:0] ALU_Res_out, Val_Rm_out
);

    always@(posedge clk or posedge rst) begin
        if (rst) begin
            WB_EN_out        <= 1'b0;
            MEM_R_EN_out     <= 1'b0;
            MEM_W_EN_out     <= 1'b0;
            Dest_out         <= 4'b0;
            Val_Rm_out       <= 32'b0;
            ALU_Res_out      <= 32'b0;
        end 
        
        else if (clr) begin
            WB_EN_out        <= 1'b0;
            MEM_R_EN_out     <= 1'b0;
            MEM_W_EN_out     <= 1'b0;
            Dest_out         <= 4'b0;
            Val_Rm_out       <= 32'b0;
            ALU_Res_out      <= 32'b0;
        end

        else if (en) begin
            WB_EN_out        <= WB_EN_in;
            MEM_R_EN_out     <= MEM_R_EN_in;
            MEM_W_EN_out     <= MEM_W_EN_in;
            Dest_out         <= Dest_in;
            Val_Rm_out       <= Val_Rm_in;
            ALU_Res_out      <= ALU_Res_in;
        end
    end

endmodule
