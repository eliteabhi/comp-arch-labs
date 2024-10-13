`timescale 1ns / 1ps

module PFA( A, B, Cin, G, P, S );

    input A, B, Cin;
    output G, P, S;

    assign G = A & B;
    assign P = A ^ B;
    assign S = P ^ Cin;

endmodule

module CLA_Assign_Carries ( G, P, Cin, Carry, Cout );

    input [3:0] G, P;
    input Cin;
    output [2:0] Carry;
    output Cout;

    assign Carry[0] = G[0] | P[0] & Cin;
    assign Carry[1] = G[1] | P[1] & G[0] | P[1] & P[0] & Cin;
    assign Carry[2] = G[2] | P[2] & G[1] | P[1] & P[0] & G[0] | P[2] & P[1] & P[0] & Cin;
    assign Cout = G[3] | P[3] & G[2] | P[3] & P[2] & G[1] | P[3] & P[2] & P[1] & G[0] | P[3] & P[2] & P[1] & P[0] & Cin;
    
endmodule

module CLA_4b( A, B, Cin, Sum, Cout );

    input [3:0] A, B;
    input Cin;
    output [3:0] Sum;
    output Cout;

    wire [2:0] Carry;
    wire [3:0] G, P;

    PFA pfa_1( A[0], B[0], Cin, G[0], P[0], Sum[0] );
    PFA pfa_2( A[1], B[1], Carry[0], G[1], P[1], Sum[1] );
    PFA pfa_3( A[2], B[2], Carry[1], G[2], P[2], Sum[2] );
    PFA pfa_4( A[3], B[3], Carry[2], G[3], P[3], Sum[3] );

    CLA_Assign_Carries carry_logic( G, P, Cin, Carry, Cout );

endmodule
