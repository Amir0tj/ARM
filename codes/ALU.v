module ALU(
    input [31:0] Val1_in, Val2_in,
    input [3:0] EXE_CMD_in,
    input status_in,
    output [3:0] status_out,
    output reg [31:0] ALU_Res
);

    reg c, v;
    wire z, n;
    assign status_out = {n, z, c, v};
    assign z = ~|ALU_Res;
    assign n = ALU_Res[31];

    wire [31:0] status_inExt, notStatus_inExt;
    assign status_inExt = {{(31){1'b0}}, status_in};
    assign notStatus_inExt = {{(31){1'b0}}, ~status_in};

    always @(EXE_CMD_in or Val1_in or Val2_in or status_inExt or notStatus_inExt) begin
        c = 1'b0;
        case (EXE_CMD_in)
            4'b0001: ALU_Res = Val2_in;                                     // MOV
            4'b1001: ALU_Res = ~Val2_in;                                    // MVN
            4'b0010: {c, ALU_Res} = Val1_in + Val2_in;                      // ADD
            4'b0011: {c, ALU_Res} = Val1_in + Val2_in + status_inExt;       // ADC
            4'b0100: {c, ALU_Res} = Val1_in - Val2_in;                      // SUB
            4'b0101: {c, ALU_Res} = Val1_in - Val2_in - notStatus_inExt;    // SBC
            4'b0110: ALU_Res = Val1_in & Val2_in;                           // AND
            4'b0111: ALU_Res = Val1_in | Val2_in;                           // ORR
            4'b1000: ALU_Res = Val1_in ^ Val2_in;                           // EOR
            default: ALU_Res = {32{1'b0}};
        endcase

        v = 1'b0;
        if (EXE_CMD_in[3:1] == 3'b001) begin      // ADD, ADC
            v = (Val1_in[31] == Val2_in[31]) && (Val1_in[31] != ALU_Res[31]);
        end
        else if (EXE_CMD_in[3:1] == 3'b010) begin // SUB, SBC
            v = (Val1_in[31] != Val2_in[31]) && (Val1_in[31] != ALU_Res[31]);
        end

    end
endmodule

