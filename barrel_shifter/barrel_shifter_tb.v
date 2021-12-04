`timescale 1ns / 1ps

module barrel_shifter_tb();

	reg [31 : 0] d;
	reg [4 : 0]  sa;
	reg right, arith;	
	
	wire [31 : 0] sh;
	
	barrel_shifter  barrel_aktif(d,sa,right,arith,sh);
	
	initial begin
		
		   right=0; arith=0; d=32'hff0000ff; sa=5'h8;  //sola 8 bit logic
        #1 right=0; arith=1; d=32'hff0000ff; sa=5'h8;  //sola 8 bit arith
        #1 right=1; arith=0; d=32'hff0000ff; sa=5'h8;  //saga 8 bit logic
        #1 right=1; arith=1; d=32'hff0000ff; sa=5'h8;  //saga 8 bit arith

		#1 right=0; arith=0; d=32'hff0000ff; sa=5'h4;  //sola 4 bit logic
        #1 right=0; arith=1; d=32'hff0000ff; sa=5'h4;  //sola 4 bit arith
        #1 right=1; arith=0; d=32'hff0000ff; sa=5'h4;  //saga 4 bit logic
        #1 right=1; arith=1; d=32'hff0000ff; sa=5'h4;  //saga 4 bit arith		

		#1 right=0; arith=0; d=32'hff0000ff; sa=5'h2;  //sola 2 bit logic
        #1 right=0; arith=1; d=32'hff0000ff; sa=5'h2;  //sola 2 bit arith
        #1 right=1; arith=0; d=32'hff0000ff; sa=5'h2;  //saga 2 bit logic
        #1 right=1; arith=1; d=32'hff0000ff; sa=5'h2;  //saga 2 bit arith	
        
        
		#1 right=0; arith=0; d=32'hff0000ff; sa=5'h1;  //sola 2 bit logic
        #1 right=0; arith=1; d=32'hff0000ff; sa=5'h1;  //sola 2 bit arith
        #1 right=1; arith=0; d=32'hff0000ff; sa=5'h1;  //saga 2 bit logic
        #1 right=1; arith=1; d=32'hff0000ff; sa=5'h1;  //saga 2 bit arith

		#1 right=0; arith=0; d=32'hff0000ff; sa=5'h0;  //sola 0 bit logic
        #1 right=0; arith=1; d=32'hff0000ff; sa=5'h0;  //sola 0 bit arith
        #1 right=1; arith=0; d=32'hff0000ff; sa=5'h0;  //saga 0 bit logic
        #1 right=1; arith=1; d=32'hff0000ff; sa=5'h0;  //saga 0 bit arith
		
        #1 $finish;
	
	end
	
endmodule
