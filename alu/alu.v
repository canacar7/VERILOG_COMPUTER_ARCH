module alu(a,b,kontrol,c,z_flag);
  input      [31 : 0] a, b;              // inputs: a, b
  input      [3  : 0] kontrol;           // durumları belirlicek
  output reg [31 : 0] c;                 // outputs: c
  output reg          z_flag;

  parameter [3 : 0] S0 = 4'b0000,    //ADD
                    S1 = 4'B0100,    //SUB
                    S2 = 4'B0001,    //AND
                    S3 = 4'B0101,    //OR
                    S4 = 4'B0010,    //XOR
                    S5 = 4'B0110,    //LUI
                    S6 = 4'B0011,    //SLL
                    S7 = 4'B0111,    //SRL
                    S8 = 4'B1111;    //SRA
  
  always @(*) begin                 
    case(kontrol)
   
        S0 : begin                      //add
             c <= a + b;
             z_flag = ~| c;
             end
        
        S1 : begin                              //sub
             c <= a - b;
             z_flag = ~| c;
             end      
             
        S2 : begin                              //and
             c <= a & b;
             z_flag = ~| c;
             end
             
        S3 : begin                              //or
             c <= a | b;
             z_flag = ~| c;
             end
             
        S4 : begin                              //xor
             c <= a ^ b;
             z_flag = ~| c;
             end
        
        S5 : begin                              //lui
             c <= {b[15:0],16'h0};
             z_flag = ~| c;
             end    
             
        S6 : begin                              //sll
             c <= b << a[4 : 0]; 
             z_flag = ~| c;
             end      
        
        S7 : begin                              //srl
             c <= b >>  a[4 : 0];
             z_flag = ~| c;
             end
             
        S8 : begin                              //sra
             c <= $signed(b) >>> a[4 : 0];
             z_flag = ~| c;
             end
    endcase
    
  end
 
endmodule