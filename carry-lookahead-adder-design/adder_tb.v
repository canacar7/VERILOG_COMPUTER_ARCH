`timescale 1ns/1ns
module adder_tb;
    reg  [31:0] a,b;
    reg         c_in;
    wire g_out,pout;
    wire [31:0] s;

    add_32_bit deneme_1 (a,b,c_in,g_out,p_out,s);
    initial begin
            a  = 32'h00000001;
            b  = 32'h00000001;
            c_in = 0;
        #10 a  = 32'h00000001;
            b  = 32'h00000002;
        #10 a  = 32'h00000003;
            b  = 32'h00000004;
        #10 a  = 32'h00000005;
            b  = 32'h00000006;
        #10 a  = 32'h00000007;
            b  = 32'h00000008;            
         #10 a  = 32'h00000009;
            b  = 32'h0000000a;           
         #10 a  = 32'h0000000b;
            b  = 32'h0000000c;           
            
    end
    always #5 c_in = !c_in;
endmodule
