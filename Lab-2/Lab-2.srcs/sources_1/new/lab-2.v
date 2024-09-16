`timescale 1ns / 1ps

module Full_Adder( A, B, Cin, Sum, Cout );
    
   input A, B, Cin;
   output Sum, Cout;
   
   assign Sum = ( A ^ B ) ^ Cin;
   assign Cout = ( ( A ^ B ) && Cin ) || ( A & B );
    
endmodule

module RCA_4b( A, B, Cin, Sum, Cout );

    input [3:0] A, B;
    input Cin;
    output [3:0] Sum;
    output Cout;

    wire [2:0] Carry;

    Full_Adder adder1( A[0], B[0], Cin, Sum[0], Carry[0]);
    Full_Adder adder2( A[1], B[1], Carry[0], Sum[1], Carry[1]);
    Full_Adder adder3( A[2], B[2], Carry[1], Sum[2], Carry[2]);
    Full_Adder adder4( A[3], B[3], Carry[2], Sum[3], Cout);

endmodule

module RCA_8b( A, B, Cin, Sum, Cout );

    input [7:0] A, B;
    input Cin;
    output [7:0] Sum;
    output Cout;

    wire Carry;

    RCA_4b rca1( A[3:0], B[3:0], Cin, Sum[3:0], Carry );
    RCA_4b rca2( A[7:4], B[7:4], Carry, Sum[7:4], Cout );

endmodule
