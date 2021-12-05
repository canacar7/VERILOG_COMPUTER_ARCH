//cary lookahead icin son katmani
//c_out = g0 + p0c0 
//g_out = g1 + p1g0
//p_out = p1p0
module GP (g,p,c_in,c_out,g_out, p_out );

input  [1 : 0] g,p;
input          c_in;
output         c_out,p_out,g_out;

assign  c_out = g[1] | p[0] & c_in;
assign  g_out = g[1] | p[1] & g[0];
assign  p_out = p[1] & p[0];
endmodule
