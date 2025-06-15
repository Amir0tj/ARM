module HazardUnit(
    input Two_src, EXE_WB_EN, MEM_WB_EN,
    input [3:0] Rn, EXE_Dest, MEM_Dest, src2_in,
    output reg Hazard_out
);

    always @(*) begin
        Hazard_out = 1'b0;

        if (EXE_WB_EN & (Rn == EXE_Dest | (Two_src & src2_in == EXE_Dest))) Hazard_out = 1'b1;

        else if (MEM_WB_EN & (Rn == MEM_Dest | (Two_src & src2_in == MEM_Dest))) Hazard_out = 1'b1;
    end

endmodule
