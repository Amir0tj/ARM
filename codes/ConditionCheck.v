module ConditionCheck(
    input [3:0] cond_in, status_in,
    output reg cond_out
);

    wire n, z, c, v;
    assign {n, z, c, v} = status_in;
    always @(cond_in, n, z, c, v) begin
        cond_out = 1'b0;
        case (cond_in)
            4'b0000: cond_out = z;             // EQ
            4'b0001: cond_out = ~z;            // NE
            4'b0010: cond_out = c;             // CS/HS
            4'b0011: cond_out = ~c;            // CC/LO
            4'b0100: cond_out = n;             // MI
            4'b0101: cond_out = ~n;            // PL
            4'b0110: cond_out = v;             // VS
            4'b0111: cond_out = ~v;            // VC
            4'b1000: cond_out = c & ~z;        // HI
            4'b1001: cond_out = ~c | z;        // LS
            4'b1010: cond_out = (n == v);      // GE
            4'b1011: cond_out = (n != v);      // LT
            4'b1100: cond_out = ~z & (n == v); // GT
            4'b1101: cond_out = z | (n != v);  // LE
            4'b1110: cond_out = 1'b1;          // AL
            default: cond_out = 1'bx;
        endcase
    end
    
endmodule

