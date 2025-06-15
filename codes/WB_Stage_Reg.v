module WB_Stage_Reg (
    input clk,
    input rst,
    input [31:0] PC_in,
    output reg [31:0] PC
);
    always @(posedge clk, posedge rst) begin
        if (rst) PC <= 32'b0;
        else begin 
            PC <= PC_in;
        end
    end
endmodule

