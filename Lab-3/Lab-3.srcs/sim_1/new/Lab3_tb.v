`timescale 1ns / 1ps

module D_FF_tb();

    reg CLK, D, RST;
    wire Q, Q_NOT;

    D_FF ff( CLK, D, RST, Q, Q_NOT );

    initial begin
    
        CLK = 1'b0;
    
        forever begin
    
            #10;
            CLK = !CLK; //This will generate a positive edge every 10ns
    
        end
    
    end
    
    initial begin
        
        // Test 1
        D = 1'b1;
        RST = 1'b0;
        $monitor( "D: %b\nRST: %b\n\nQ: %b\nQ_NOT: %b\n--------------------\n", D, RST, Q, Q_NOT );
        #100;

        // Test 2
        D = 1'b0;
        RST = 1'b0;
        $monitor( "D: %b\nRST: %b\n\nQ: %b\nQ_NOT: %b\n--------------------\n", D, RST, Q, Q_NOT );
        #100;
        
        // Test 3
        D = 1'b0;
        RST = 1'b1;
        $monitor( "D: %b\nRST: %b\n\nQ: %b\nQ_NOT: %b\n--------------------\n", D, RST, Q, Q_NOT );
        #100;

        // Test 4
        D = 1'b0;
        RST = 1'b0;
        $monitor( "D: %b\nRST: %b\n\nQ: %b\nQ_NOT: %b\n--------------------\n", D, RST, Q, Q_NOT );
        #100;

        // Test 5
        D = 1'b1;
        RST = 1'b1;
        $monitor( "D: %b\nRST: %b\n\nQ: %b\nQ_NOT: %b\n--------------------\n", D, RST, Q, Q_NOT );
        #100;

    end

endmodule
