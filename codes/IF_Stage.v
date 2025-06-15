module IF_Stage (
    input clk, rst, freeze, Branch_taken,
    input [31:0] BranchAddr,
    output [31:0] PC, Instruction
);

wire [31:0] muxOut, pcAdderOut; 
MUX2to1 mux2to1(.in1(pcAdderOut), .in2(BranchAddr), .select(Branch_taken), .out(muxOut)); 

wire [31:0] pcRegOut;
REG pcReg(.clk(clk), .rst(rst), .enable(~freeze), .in(muxOut), .out(pcRegOut));

Adder addPcWith4(.in1(pcRegOut), .in2(32'd4), .out(pcAdderOut));

assign PC = pcAdderOut;

Instruction_Memory IM(.PC(pcRegOut), .Instruction(Instruction));
endmodule 