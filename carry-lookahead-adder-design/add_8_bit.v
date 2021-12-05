module add_8_bit(a,b,c_in,g_out,p_out,s);

    input [7 : 0] a,b;
    input         c_in;
    output        g_out,p_out;
    output [7 : 0] s;
    wire   [1 : 0] g,p;
    wire           c_out;
    
    add_4_bit aktif_toplama_0 (a[3 : 0], b[3 : 0],c_in,g[0],p[0],s[3 : 0]);
    add_4_bit aktif_toplama_1 (a[7 : 4], b[7 : 4],c_out,g[1],p[1],s[7 : 4]);
    GP        aktif_gp_0      (g,p,c_in,c_out,g_out, p_out);
    
endmodule
