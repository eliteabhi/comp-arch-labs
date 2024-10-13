`timescale 1ns / 1ps

module CLA_4b_tb();

    reg [3:0] A, B;
    reg Cin;

    wire [3:0] Sum;
    wire Cout;

    CLA_4b cla( A, B, Cin, Sum, Cout );

    initial begin

        // Test 1
        Cin = 1'b0;
        A = 4'b0101;
        B = 4'b1001;

        $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
        #100;

        // Test 2
        Cin = 1'b1;
        A = 8'b0011;
        B = 8'b1001;

        $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
        #100;

        // Test 3
        Cin= 1'b1;
        A = 8'b0110;
        B = 8'b1011;

        $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
        #100;

        // Test 4
        Cin=1'b0;
        A = 8'b1001;
        B = 8'b0101;

        $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );

    end

endmodule
