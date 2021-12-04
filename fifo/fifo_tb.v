`timescale 1ns / 1ps


module fifo_tb();


	reg rst, clk, okuma_cs, yazma_cs;
	reg  [7 : 0] data_in;
	wire [7 : 0] data_out;
	wire ready;
	wire overflow;
	
	fifo aktif(clk, rst, okuma_cs,yazma_cs, data_in, data_out, ready, overflow );
	initial begin
	
		clk      = 0;
		rst 	 = 0;
		okuma_cs = 0;
		yazma_cs = 0;
		
		#20  rst = 1;
		     data_in = 8'hc0;
			 yazma_cs = 1;
		#20 data_in = 8'hc1;
        #20 data_in = 8'hc2;
        #20 data_in = 8'hc3;
        #20 data_in = 8'hc4;
        #20 data_in = 8'hc5;
            okuma_cs    = 1;
        #20 data_in = 8'hc6;
        #20 data_in = 8'hc7;
        #20 data_in = 8'hc8;
            okuma_cs    = 0;
        #20 data_in = 8'hc9;
        #20 data_in = 8'hca;
        #20 data_in = 8'hcb;
        #20 data_in = 8'hcc;
        #20 data_in = 8'hcd;
        #20 data_in = 8'hce;
        #20 data_in = 8'hcf;
        #20 data_in = 8'hd0;
            okuma_cs    = 1;
        #20 data_in = 8'hd1;
        #20 data_in = 8'hd2;
            okuma_cs    = 0; 
        #20 data_in = 8'hd3;
            okuma_cs    = 1; 
        #20 data_in = 8'hd4;
            yazma_cs    = 0;
			
	end
	always #10 clk = !clk;  //clk olusturarak sisteme clk atadik
			 
endmodule
