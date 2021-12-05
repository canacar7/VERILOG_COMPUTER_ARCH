module add_4_bit(a,b,c_in,g_out,p_out,s);

    input [3 : 0] a,b;
    input         c_in;
    output        g_out,p_out;
    output [3 : 0] s;
    wire   [1 : 0] g,p;
    wire           c_out;
    
    add_2_bit aktif_toplama_0 (a[1 : 0], b[1 : 0],c_in,g[0],p[0],s[1 : 0]);
    add_2_bit aktif_toplama_1 (a[3 : 2], b[3 : 2],c_out,g[1],p[1],s[3 : 2]);
    GP        aktif_gp_0      (g,p,c_in,c_out,g_out, p_out);

endmodule
