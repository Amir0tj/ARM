module MEM_Stage_Reg (
    input clk, rst, WB_EN_in, MEM_R_EN_in,
    input [3:0] Dest_in,
    input [31:0] ALU_Res_in, Data_Mem_in,
    output reg WB_EN_out, MEM_R_EN_out,
    output reg [3:0] Dest_out,
    output reg [31:0] ALU_Res_out, Data_Mem_out
);

    always@(posedge clk or posedge rst) begin

        if (rst) begin
            WB_EN_out        <= 1'b0;
            MEM_R_EN_out     <= 1'b0;
            Dest_out         <= 4'b0;
            Data_Mem_out     <= 32'b0;
            ALU_Res_out      <= 32'b0;
        end 
        
        else begin
            WB_EN_out        <= WB_EN_in;
            MEM_R_EN_out     <= MEM_R_EN_in;
            Dest_out         <= Dest_in;
            Data_Mem_out     <= Data_Mem_in;
            ALU_Res_out      <= ALU_Res_in;
        end
    end

endmodule
