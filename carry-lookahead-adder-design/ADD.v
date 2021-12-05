module ADD(a,b,c,g,p,s);

input a,b,c;
output g,p,s;

assign s = a ^ b ^ c; //s =  a xor (b xor c)
assign g = a & b;       //g = ab
assign p = a | b;       //p = a + b
endmodule
