`timescale 1ns / 1ps

module Lab6_tb();

    reg [3:0] A, B;
    reg [2:0] Select;
    reg Cin;

    wire [3:0] Out;
    wire Cout;

    ALU_4b alu( A, B, Cin, Select, Out, Cout );
    
    integer i;
    initial begin

        A = 4'b1010;
        B = 4'b0110;
        Cin = 1'b1;

        Select = 3'b000;

        $monitor( "\nSelect: %b\n\nA: %b\nB: %b\nCin: %b\nOut: %b\nCout: %b\n", Select, A, B, Cin, Out, Cout );
        $monitor( "----------------------------------------------------" );
        
        for ( i = 0; i < 7; i = i + 1 ) begin
            #100
            
            $monitor( "\nSelect: %b\n\nA: %b\nB: %b\nCin: %b\nOut: %b\nCout: %b\n", Select, A, B, Cin, Out, Cout );
            $monitor( "----------------------------------------------------" );

            Select = Select + 1'b1;

        end

    end

endmodule
