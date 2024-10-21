`timescale 1ns / 1ps

module ALU_4b (

    input [3:0] A, B,
    input Cin,
    input [2:0] Select,
    output reg [3:0] Out,
    output reg Cout

);
    
    always @( A, B, Cin, Select ) begin
        
        case( Select )

            3'b000: { Cout, Out } <= A + B + Cin;
            3'b001: { Cout, Out } <= A - B - Cin;
            3'b010: { Cout, Out } <= A | B;
            3'b011: { Cout, Out } <= A & B;
            3'b100: { Cout, Out } <= A << 1'b1;
            3'b101: { Cout, Out } <= A >> 1'b1;
            3'b110: { Cout, Out } <= A[2:0] & A[3];
            3'b111: { Cout, Out } <= A[0] & A[3:1];

        endcase

    end

endmodule
