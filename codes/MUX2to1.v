module MUX2to1 #(parameter N = 32) (
    input select,
    input [N - 1 : 0] in1, in2,
    output [N - 1 :0] out
);
    assign out = select ? in2 : in1; 
    
endmodule

