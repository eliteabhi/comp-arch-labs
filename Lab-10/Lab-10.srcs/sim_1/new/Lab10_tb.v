`timescale 1ns / 1ps

module Lab10_tb();

    reg [31:0] A, B;
    reg overflow, underflow, exception;
    wire [31:0] product;
    real value, A_dec, B_dec;

    ieee_754_mult F_Mult ( .A( A ), .B( B ), .P( product ) );

    initial begin

        A = 32'b00111111101000000000000000000000;  // 1.25
        B = 32'b01000000001000000000000000000000;  // 2.5
        
        #50
        value = ( ( -1 ) ** ( product[31] ) ) * ( 2 ** ( product[30:23] - 127 ) ) * ( $itor( { 1'b1,product[22:0] } ) / ( 2 ** 23 ) );
        $monitor( "Expected Value : %f product : %f", 1.25 * 32.5, value );
        
        #20

        A = 32'b01000000010010001111010111000011;  // 3.14
        B = 32'b01000000010010001111010111000011;  // 3.14
        
        #50
        value = ( ( -1 ) ** ( product[31] ) ) * ( 2 ** ( product[ 30:23 ] - 127 ) ) * ( $itor( { 1'b1, product[22:0] } ) / ( 2 ** 23 ) );
        $monitor( "Expected Value : %f product : %f", 3.14 * 3.14, value );
        
        #50

        A = 32'b01000001110000000000000000000000;  // 24
        B = 32'b01000010000000000000000000000000;  // 32
        
        #50
        value = ( ( -1 ) ** ( product[31] ) ) * ( 2 ** ( product[30:23] - 127 ) ) * ( $itor( { 1'b1,product[22:0] } ) / ( 2 ** 23 ) );
        $monitor( "Expected Value : %f product : %f", 24 * 32, value );

        #50

        A = 32'b01000000101110011001100110011010; // 5.8
        B = 32'b01000010000000000000000000000000; // 4.2

        #50
        value = ( ( -1 ) ** ( product[31] ) ) * ( 2 ** ( product[30:23] - 127 ) ) * ( $itor( { 1'b1,product[22:0] } ) / ( 2 ** 23 ) );
        $monitor( "Expected Value : %f product : %f", 5.8 * 32, value );

        $finish;

    end

endmodule
