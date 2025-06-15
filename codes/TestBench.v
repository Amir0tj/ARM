`timescale 1ns/1ns
module TestBench();
    reg clk , rst ;

    ARM_amir_wrapper ARM_Test (.clk_1(clk), .rst_1(rst));

    always #2 clk = ~clk;

    initial begin
            clk = 1'b0;
             rst = 1'b0;

        rst = 1'b1;
        #4 rst = 1'b0;
        #1000 $stop;
    end

endmodule
