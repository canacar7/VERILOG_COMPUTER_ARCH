`timescale 1ns / 1ps

module tb_deneme( );


reg  [31 : 0] x,y;
wire  [63 : 0] z;


        unsigned_int_mul16 modul_aktif( x,y,z);
        
        initial begin 
        
            #5 x = 32'h00000000; y = 32'h00000000;
            #5 x = 32'h00000001; y = 32'h00000001;
            #5 x = 32'h00000002; y = 32'h00000002;
            #5 x = 32'h00000003; y = 32'h00000003;
                             
        end
endmodule
