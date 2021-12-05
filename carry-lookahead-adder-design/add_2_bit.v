`timescale 1ns / 1ps

module add_2_bit(a,b,c_in,g_out,p_out,s);
    input [1 : 0] a,b;
    input         c_in;
    output        g_out,p_out;
    output [1 : 0] s;
    wire   [1 : 0] g,p;
    wire           c_out;
    
    
    ADD aktif_toplama_0 (a[0], b[0],c_in,g[0],p[0],s[0]);
    ADD aktif_toplama_1 (a[1], b[1],c_out,g[1],p[1],s[1]);
    GP  aktif_gp_0      (g,p,c_in, c_out, g_out, p_out);

endmodule
