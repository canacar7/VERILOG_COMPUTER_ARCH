`timescale 1ns / 1ps



module odev_64_bit_tb();


	reg   clk,rst;
    reg   [31:0] a, b;                             
    wire  [63:0] z,z_1,z_2;     
	
	
	odev64_bit aktif_modul(a,b,z,z_1,z_2,clk,rst);
	initial begin
 
        clk <= 0;
        rst <= 1;
        #50;
        rst <= 0;
        #10
             
            a  = 32'hffffffff;
            b  = 32'hffffffff;
        #10 a  = 32'h7f000000;
            b  = 32'h7f000000;
        #10 a  = 32'h81000000;
            b  = 32'h81000000;
        #10 a  = 32'h7e000000;
            b  = 32'h7e000000;
        #10 a  = 32'h82000000;
            b  = 32'h82000000;
        #10 a  = 32'h7d000000;
            b  = 32'h7d000000;
        #10 a  = 32'h83000000;
            b  = 32'h83000000;
        #10 a  = 32'h7e000000;
            b  = 32'h81000000;
        #10 a  = 32'h82000000;
            b  = 32'h7d000000;
        #10 a  = 32'h00000000;
            b  = 32'h00000000;
        #10 a  = 32'h01000000;
            b  = 32'h01000000;
        #10 a  = 32'h02000000;
            b  = 32'h02000000;
        #10 a  = 32'h03000000;
            b  = 32'h03000000;
    
 end

 always #5 clk = !clk;
endmodule
