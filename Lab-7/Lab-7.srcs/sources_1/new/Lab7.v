`timescale 1ns / 1ps

module JK_Flip_Flop( CLK, J, K, Q, QP );

    input CLK,J,K;
    output reg Q, QP;

    always @ ( posedge CLK ) begin

        if ( J == K ) begin
        end

        else if ( J == 1 ) begin
            Q <= 1;
            QP <= 0;
        end

        else if ( K == 1 ) begin
            Q <= 0;
            QP <= 1;
        end

    end

endmodule
