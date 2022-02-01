`timescale 1ns / 1ps
module ha_structural(a,b,s,co);


    input  a, b;                              // inputs:  a, b
    output s, co;                            // outputs: sum, carry_out
    
     and i1 (co, a,  b);
     xor i2 (s, a,  b);

endmodule

