module mux2to1_32bit (
    input wire [31:0] in0,  
    input wire [31:0] in1,  
    input wire sel,        
    output wire [31:0] out  
);

    assign out = (sel == 1'b0) ? in0 : in1;

endmodule
