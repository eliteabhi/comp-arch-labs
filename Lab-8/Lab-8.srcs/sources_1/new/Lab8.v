`timescale 1ns / 1ps

module Ring_Counter_4bit( CLK, RST, Q, QBAR );

    input CLK, RST;
    output reg [3:0] Q, QBAR;

    integer i;
    always @( posedge CLK or negedge RST ) begin

        if ( RST ) begin
            
            Q <= 4'b1000;

        end

        else begin
            
            Q[3] <= Q[0];

            for ( i = 0; i < 3; i = i + 1 ) begin
                
                Q[i] <= Q[ i + 1 ];

            end

        end

        QBAR <= ~Q;

    end

endmodule

module Johnson_Ring_Counter_4bit( CLK, RST, Q, QBAR );

    input CLK, RST;
    output reg [3:0] Q, QBAR;

    integer i;
    always @( posedge CLK or negedge RST ) begin

        if ( RST ) begin
            
            Q <= 4'b1000;

        end

        else begin
            
            Q[3] <= QBAR[0];

            for ( i = 0; i < 3; i = i + 1 ) begin
                
                Q[i] <= Q[ i + 1 ];

            end

        end

        QBAR <= ~Q;

    end

endmodule
