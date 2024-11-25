`timescale 1ns / 1ps

module ieee_754_mult( A, B, P );
    
    input [ 31:0 ] A, B;
    output reg [ 31:0 ] P;
   
    reg [ 23:0 ] A_Mantissa;
    reg [ 23:0 ] B_Mantissa;
    reg [ 7:0 ] A_Exponent;
    reg [ 7:0 ] B_Exponent;
    reg [ 7:0 ] A_sign;
    reg [ 7:0 ] B_sign;
    reg [ 47:0 ] Temp_Mantissa;
    reg [ 22:0 ] Mantissa;
    reg [ 8:0 ] Temp_Exponent;
    reg [ 8:0 ] Exponent;
    reg Sign;
    
    always @( A, B ) begin
        
        A_Mantissa = { 1'b1, A[ 22:0 ] };
        B_Mantissa = { 1'b1, B[ 22:0 ] };
        A_Exponent = A[ 30:23 ];
        B_Exponent = B[ 30:23 ];
        A_sign = A[ 31 ];
        B_sign = B[ 31 ];
        Mantissa = Temp_Mantissa[ 45:23 ];
        Exponent = Temp_Exponent[ 7:0 ];
        
    end
    
    always @( A, B ) begin
        
        Temp_Exponent = ( A_Exponent + B_Exponent < 'd127 ) ? 8'd0 : A_Exponent + B_Exponent - 'd127;
        Temp_Mantissa = A_Mantissa * B_Mantissa;
        
        if ( Temp_Mantissa[ 47 ] ) begin
        
            Temp_Mantissa = Temp_Mantissa << 1;  // Mantissa = Temp_Mantissa[46:24]
            Exponent = Exponent + 1;
        
        end
        
        if ( Exponent[ 8 ] ) begin
        
            Exponent[ 7:0 ] = 8'hff;

        end

        Sign = A_sign ^ B_sign;
        
        P = { Sign, Exponent[ 7:0 ], Mantissa };
        
    end


endmodule
