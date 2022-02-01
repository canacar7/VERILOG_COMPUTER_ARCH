`timescale 1ns / 1ps



module tb( );

    reg  [07:00] a;
    reg  [07:00] b;
    wire [15:00] z;
    dadda test (a,b,z);
    initial begin
           a = 8'hff;
           b = 8'hff;
        #5 a = 8'h00;
           b = 8'h01;
        #5 a = 8'h01;
           b = 8'h01;
        #5 a = 8'h01;
           b = 8'h02;  
        #5 a = 8'h01;
           b = 8'h03;  
        #5 a = 8'h01;
           b = 8'h04;   
        #5 a = 8'h02;
           b = 8'h01;
        #5 a = 8'h03;
           b = 8'h02;  
        #5 a = 8'h04;
           b = 8'h03;  
        #5 a = 8'hff;
           b = 8'h04;   
        #5 $finish;
        #5 $finish;
    end
endmodule
