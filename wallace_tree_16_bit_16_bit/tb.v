`timescale 1ns/1ns
module deneme_tb;
    reg  [15:00] a;
    reg  [15:00] b;
    reg  [31:00] y;
    wire [31:00] z;
    wallace_32x32 test (a,b,z);
    initial begin
            a = 16'hffff;
            b = 16'hffff;
            y = a * b;
            
     #10    a = 16'h0001;
            b = 16'h0001;
            y = a * b;   
            
                  
     #10    a = 16'h1001;
            b = 16'h1001;
            y = a * b; 
            
        #10 $finish;
    end
endmodule