`timescale 1ns / 1ps

module counter_tb();

    reg clk,rst,u;
    wire [2 : 0] q;
    
    counter  aktif(u,clk,rst,q);
   
    
 initial begin
 
        clk <= 0;
        u   <= 0;
        rst <= 1;
        #50;
        rst <= 0;
        #10
        
        
        u <= 1; #10;
        u <= 1; #10;
        u <= 1; #10;
        u <= 1; #10;
        u <= 0; #10;
        u <= 1; #10;
        u <= 0; #10;
        u <= 0; #10;
        u <= 0; #10;
        u <= 1; #10;
        u <= 0; #10;
    
  end

 always #5 clk = !clk;
endmodule




