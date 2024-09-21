`timescale 1ns / 1ps

module D_FF( CLK, D, RST, Q, Q_NOT );

    input CLK, D, RST;
    output reg Q, Q_NOT;

    always @ ( posedge CLK ) begin
        
        if ( RST ) begin
            
            Q <= 1'b0;

        end

        else if ( D ) begin
            
            Q <= 1'b1;

        end

        Q_NOT = !Q;

    end

endmodule
