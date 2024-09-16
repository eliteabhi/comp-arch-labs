`timescale 1ns / 1ps

module main_tb();
    reg [3:0] in;
    reg [1:0] sel;
    wire out;

    MUX4x1 m1(in, sel, out);
    
    integer i;
    initial begin
    
        $monitor("in: %b\nsel: %b\nout: %b\n\n", in, sel, out);
        
        in = 4'b0110;
        sel = 2'b00;
        
        for ( i=0; i < 3; i = i + 1 ) begin
            #100;
            sel = sel + 1; 
        end
    
    end

endmodule
