`timescale 1ns / 1ps

module tb( );

reg  [7 : 0] M;
reg  [7 : 0] Q;
wire [15 : 0] Z;

top test (M,Q,Z);

initial begin

         M = 8'd15; Q = 8'd15;
     #10 M = 8'd00; Q = 8'd01;
     #10 M = 8'd01; Q = 8'd02;
     #10 M = 8'd01; Q = 8'd03;
     #10 M = 8'd01; Q = 8'd04;
     #10 M = 8'd01; Q = 8'd05;
     #10 M = 8'd01; Q = 8'd06;
                        
     #10 M =  -1  ; Q = 8'd06;
     #10 M =  -1  ; Q = 8'd06;
     #10 M =  -2  ; Q = 8'd06;
     #10 M =  -3  ; Q = 8'd06;

    

end

endmodule
