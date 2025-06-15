module RegisterFile(
    input clk, rst,
    input [3:0] src1, src2, Dest_wb,
    input [31:0] Result_WB,
    input writeBackEn,
    output [31:0] reg1, reg2
);

    reg [31:0] regFile [0:15];

    integer i;
    initial begin
        for (i = 0; i < 16; i = i + 1)
            regFile[i] <= i;
    end

    always @(negedge clk) begin
        if (rst) begin
            for (i = 0; i < 16; i = i + 1)
                regFile[i] <= i;
        end
        if (writeBackEn) regFile[Dest_wb] <= Result_WB;
    end

    assign reg1 = regFile[src1];
    assign reg2 = regFile[src2]; 

endmodule 
