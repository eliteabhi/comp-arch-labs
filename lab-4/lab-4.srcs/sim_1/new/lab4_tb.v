`timescale 1ns / 1ps

module lab4_tb();
    reg [3:0] A, B;
    reg Bin;
    wire [3:0] Diff;
    wire Bout;

    full_sub_4b sub_4b( A, B, Bin, Diff, Bout );

    integer i, j;
    initial begin
        
        A = 4'b0000;
        B = 4'b0000;
        Bin = 1'b0;
        
        for ( i = 0; i < 16 ; i = i + 1 ) begin
            for ( j = 0; j < 16 ; j = j + 1 ) begin
                #10
                $monitor( "A: %b | B: %b | Bin: %b\nDiff: %b, Bout: %b\n\n", A, B, Bin, Diff, Bout );
                { A, B, Bin } = { A, B, Bin } + 1;

            end

        end

    end

endmodule
