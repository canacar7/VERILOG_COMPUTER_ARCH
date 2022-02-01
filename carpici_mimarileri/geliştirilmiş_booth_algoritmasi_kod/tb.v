`timescale 1ns / 1ps

module tb();

    reg   clk,rst;
    reg   [7 : 0] M;
	reg   [7 : 0] Q;
	wire  [15 : 0] Z;
	wire         [3:0] u; 
    
    booth  test (M,Q,Z,clk,rst,u);
   
    
 initial begin
 
        clk = 0;
        rst = 1;
        #15;
        rst = 0;
        
           M = 8'd15; Q = 8'd15;
     #110  M = 8'd00; Q = 8'd01;
     #110  M = 8'd01; Q = 8'd02;
     #110  M = 8'd01; Q = 8'd03;
     #110  M = 8'd01; Q = 8'd04;
     #110  M = 8'd01; Q = 8'd05;
     #110  M = 8'd01; Q = 8'd06;            
 
     #110  M =  -1  ; Q = 8'd06;
     #110  M =  -1  ; Q = 8'd06;
     #110  M =  -2  ; Q = 8'd07;
     #110  M =  -3   ; Q = 8'd06;
       
  end

 always #5 clk = !clk;
endmodule