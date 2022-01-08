`timescale 1ns/1ns
module alu_tb;
    reg  [31:0] a,b;
    reg  [3:0]  kontrol;
    wire [31:0] c;
    wire  z_flag;
  
    alu aktif (a,b,kontrol,c,z_flag);
    initial begin
            kontrol    = 4'b0000;       // ADD
            a          = 32'h2;
            b          = 32'h1;
        #10 kontrol    = 4'b0100;       // SUB
        
        #10 kontrol    = 4'b0001;       // AND
            a          = 32'hcccccccc;
            b          = 32'haaaaaaaa;
        #10 kontrol    = 4'b0101;       // OR
        
        #10 kontrol    = 4'b0010;       // XOR
            a          = 32'h33333333;
            b          = 32'hff005555;
        #10 kontrol    = 4'b0110;       // LUI
        
        #10 kontrol    = 4'b0011;       // SLL
            a          = 32'h0000000f;
            b          = 32'hffffffff;
        #10 kontrol    = 4'b0111;       // SRL
        
        #10 kontrol    = 4'b1111;       // SRA
            a          = 32'h00000010;
            b          = 32'h7f000000;
        #10 b          = 32'hffffff00; 
        #10 kontrol    = 4'b0100;       //SUB
            a          = 32'hffffffff;
            b          = 32'hffffffff;
        #10 kontrol    = 4'b0000;       // ADD 
          
        #10        $finish;
    end
endmodule