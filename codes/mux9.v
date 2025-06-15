module mux2to1_9bit (
    input wire [8:0] in0,  
    input wire [8:0] in1,  
    input wire sel,        
    output wire [8:0] out  
);

    assign out = (sel == 1'b0) ? in0 : in1;

endmodule
