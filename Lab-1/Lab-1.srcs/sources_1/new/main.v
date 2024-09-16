`timescale 1ns / 1ps

module MUX2x1(in,sel,out);
    input [1:0] in;
    input sel;
    output reg out;
    
    always @(*) begin
        if (sel == 0)
            out <= in[0];
        else
            out <= in[1];
    end
endmodule

module MUX4x1(in,sel,out);

    input [3:0] in;
    input [1:0] sel;
    output out;

    wire [1:0] m_out;

    MUX2x1 m1(in[1:0], sel[0], m_out[0]);
    MUX2x1 m2(in[3:2], sel[0], m_out[1]);
    
    MUX2x1 m3(m_out, sel[1], out);

endmodule
