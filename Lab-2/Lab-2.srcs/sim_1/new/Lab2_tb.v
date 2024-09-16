`timescale 1ns / 1ps

module Lab2_tb();

    // RCA_8b_tb rca_8b();

    reg [7:0] A, B;
    reg Cin;

    wire [7:0] Sum;
    wire out;

    RCA_8b uut( A, B, Cin, Sum, Cout );

    initial begin

        // Test 1
        Cin = 1'b0;
        A = 8'b01011000;
        B = 8'b00011001;

        $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
        #100;

        // Test 2
        Cin = 1'b1;
        A = 8'b10001001;
        B = 8'b11011001;

        $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
        #100;

        // Test 3
        Cin= 1'b1;
        A = 8'b00110011;
        B = 8'b00111100;

        $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
        #100;

        // Test 4
        Cin=1'b0;
        A = 8'b10110011;
        B = 8'b01111100;

        $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
        

    end

endmodule

// module RCA_8b_tb();

//     reg [7:0] A, B;
//     reg Cin;
    
//     wire [7:0] Sum;
//     wire out;

//     RCA_8b uut( A, B, Cin, Sum, Cout );

//     initial begin

//         // Test 1
//         Cin = 1'b0;
//         A = 8'b01011000;
//         B = 8'b00011001;

//         $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
//         #100;

//         // Test 2
//         Cin = 1'b1;
//         A = 8'b01100011;
//         B = 8'b11011001;

//         $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
//         #100;

//         // Test 3
//         Cin= 1'b1;
//         A = 8'b00110011;
//         B = 8'b00111100;

//         $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
//         #100;

//         // Test 4
//         Cin=1'b0;
//         A = 8'b10110011;
//         B = 8'b01111100;

//         $monitor( "A: %b\nB: %b\nCin: %b\n\nSum: %b\nCout: %b\n\n-------------------------\n", A, B, Cin, Sum, Cout );
        

//     end
    
// endmodule

// module Full_Adder_tb();

//     reg A, B, Cin;
//     wire Sum, Cout;
    
//     Full_Adder uut( A, B, Cin, Sum, Cout );

//     integer i;
//     initial begin
        
//         A = 1'b0;
//         B = 1'b0;
//         Cin = 1'b0;
        
//         for ( i = 0; i < 7; i = i + 1 ) begin
                
//             #100;
//             { A, B, Cin } = { A, B, Cin } + 1;

//         end

//     end

// endmodule

// module RCA_tb();

//     reg [3:0] A, B;
//     reg Cin;

//     wire [3:0] Sum;
//     wire Cout;

//     RCA_4b uut( A, B, Cin, Sum, Cout );

//     integer i;
//     initial begin

//         #100
//         A = 4'b000;
//         B = 4'b000;
//         Cin = 1'b0;

//         for ( i = 0; i < ( ( 2 ** 9 ) - 1 ); i = i + 1 ) begin

//             { A, B, Cin } = { A, B, Cin } + 1;

//         end

//     end

// endmodule
