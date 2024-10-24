`timescale 1ns / 1ps

module Lab7_tb();

    reg J,K, CLK;
    wire Q, QP;

    JK_Flip_Flop jkff( CLK, J, K, Q, QP );


    initial begin

        CLK = 1'b0;
        forever begin
            #10;
            CLK = ~CLK;
        end

    end

    initial begin

        J = 0; K = 0;
        $monitor( "simtime = %g, CLK = %b, J = %b, K = %b, Q = %b, QBAR = %b", $time, CLK, J, K, Q, QP );

        #100; J = 0; K = 1;
        $monitor( "simtime = %g, CLK = %b, J = %b, K = %b, Q = %b, QBAR = %b", $time, CLK, J, K, Q, QP );

        #100; J = 1; K = 1; 
        $monitor( "simtime = %g, CLK = %b, J = %b, K = %b, Q = %b, QBAR = %b", $time, CLK, J, K, Q, QP );
        
        #100; J = 1; K = 0;
        $monitor( "simtime = %g, CLK = %b, J = %b, K = %b, Q = %b, QBAR = %b", $time, CLK, J, K, Q, QP );

        #100; J = 0; K = 0;
        $monitor( "simtime = %g, CLK = %b, J = %b, K = %b, Q = %b, QBAR = %b", $time, CLK, J, K, Q, QP );

    end 

endmodule
