`timescale 1ns / 1ps

module Lab8_tb();

    reg CLK, RST;
    wire [3:0] Q, QBAR;

    Ring_Counter_4bit RC( .CLK( CLK ), .RST( RST ), .Q( Q ), .QBAR( QBAR ) );

    initial begin

        CLK = 1'b0;
        forever begin
            #50;
            CLK = ~CLK;
        end

    end

    initial begin

        RST = 1'b1;
        $monitor( "CLK: %b\nRST: %b\nQ: %d\nQBAR: %d", CLK, RST, Q, QBAR );
        #100;
        RST = 1'b0;
        
        forever begin

            #50;
            $monitor( "CLK: %b\nRST: %b\nQ: %d\nQBAR: %d", CLK, RST, Q, QBAR );
        
        end

    end

endmodule

module Lab8_jrc_tb();

    reg CLK, RST;
    wire [3:0] Q, QBAR;

    Johnson_Ring_Counter_4bit RC( .CLK( CLK ), .RST( RST ), .Q( Q ), .QBAR( QBAR ) );

    initial begin

        CLK = 1'b0;
        forever begin
            #50;
            CLK = ~CLK;
        end

    end

    initial begin

        RST = 1'b1;
        $monitor( "CLK: %b\nRST: %b\nQ: %d\nQBAR: %d", CLK, RST, Q, QBAR );
        #100;
        RST = 1'b0;
        
        forever begin

            #50;
            $monitor( "CLK: %b\nRST: %b\nQ: %d\nQBAR: %d", CLK, RST, Q, QBAR );
        
        end

    end

endmodule
