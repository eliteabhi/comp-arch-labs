`timescale 1ns / 1ps

module full_sub_1b( input a, b, Bin, output Diff, Bout );
    assign Diff = a ^ b ^ Bin;
    assign Bout = ~a & ( b ^ Bin ) | b & Bin;

endmodule

module full_sub_4b( a, b, Bin, Diff, Bout );
    input [3:0] a, b;
    input Bin;
    output [3:0] Diff;
    output Bout;

    wire [2:0] Carry;

    full_sub_1b sub1( a[0], b[0], Bin, Diff[0], Carry[0] );
    full_sub_1b sub2( a[1], b[1], Carry[0], Diff[1], Carry[1] );
    full_sub_1b sub3( a[2], b[2], Carry[1], Diff[2], Carry[2] );
    full_sub_1b sub4( a[3], b[3], Carry[2], Diff[3], Bout );

endmodule
