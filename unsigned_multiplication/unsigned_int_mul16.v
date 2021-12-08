module unsigned_int_mul16( x,y,z);

input  [31 : 0] x,y;
output [63 : 0] z;
reg    [31 : 0] a,b;
reg    [63 : 0] z;
integer       i;


  
always @(*) begin
  a = x;
  b = y;
  z = 0;

  for (i = 0; i < 32; i = i + 1)   begin
        if((b & 1) == 1) begin
            z = z + a; 
        end
   a = a << 1;
   b = b >> 1;
          
    end	
end

endmodule
