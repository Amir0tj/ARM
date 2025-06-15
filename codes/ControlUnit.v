module ControlUnit(
    input [1:0] mode,
    input [3:0] Op_code,
    input S,
    output reg [3:0] Execute_Command,
    output reg mem_read, mem_write, WB_Enable, B, S_out
); 

    always @(mode, Op_code, S) begin
        Execute_Command = 4'd0;
        {mem_read, mem_write, WB_Enable, B, S_out} = 5'd0;

        case (Op_code)
            4'b1101: Execute_Command = 4'b0001; // MOV
            4'b1111: Execute_Command = 4'b1001; // MVN
            4'b0100: Execute_Command = 4'b0010; // ADD, LDR, STR
            4'b0101: Execute_Command = 4'b0011; // ADC
            4'b0010: Execute_Command = 4'b0100; // SUB
            4'b0110: Execute_Command = 4'b0101; // SBC
            4'b0000: Execute_Command = 4'b0110; // AND
            4'b1100: Execute_Command = 4'b0111; // ORR
            4'b0001: Execute_Command = 4'b1000; // EOR
            4'b1010: Execute_Command = 4'b0100; // CMP
            4'b1000: Execute_Command = 4'b0110; // TST
            default: Execute_Command = 4'b0001;
        endcase

        case (mode)
            2'b00: begin  // Arithmetic/Logic mode
                S_out = S; 
                WB_Enable = (Op_code == 4'b1010 || Op_code == 4'b1000) ? 1'b0 : 1'b1;
            end
            2'b01: begin  // Memory mode
                WB_Enable = S;
                mem_read = S;
                mem_write = ~S;
            end
            2'b10:  // Branch mode
                B = 1'b1;
        endcase
    end
    
endmodule

