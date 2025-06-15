module StatusRegister (
    input clk, rst, S_in,
    input [3:0] status_in,
    output reg [3:0] status_out  
);

always @(negedge clk, posedge rst) begin  
    if (rst) 
        status_out <= 4'b0; 
    else if (S_in) 
        status_out <= status_in;  
end

endmodule
