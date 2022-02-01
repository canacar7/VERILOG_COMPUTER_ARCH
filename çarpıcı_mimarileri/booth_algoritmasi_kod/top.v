`timescale 1ns / 1ps
module top(M,Q,Z);

input   [7 : 0] M;
input   [8 : 0] Q;
output  [15 : 0] Z;

wire [7 : 0] A_out_1,A_out_2,A_out_3,A_out_4,A_out_5,A_out_6,A_out_7,A_out_8;   
wire [8 : 0] Q_out_1,Q_out_2,Q_out_3,Q_out_4,Q_out_5,Q_out_6,Q_out_7,Q_out_8;
            
booth i_001 (8'b00000000,M,{Q,1'b0} ,A_out_1,Q_out_1 );
booth i_002 (A_out_1,M,Q_out_1      ,A_out_2,Q_out_2 );
booth i_003 (A_out_2,M,Q_out_2      ,A_out_3,Q_out_3 );
booth i_004 (A_out_3,M,Q_out_3      ,A_out_4,Q_out_4 );
booth i_005 (A_out_4,M,Q_out_4      ,A_out_5,Q_out_5 );
booth i_006 (A_out_5,M,Q_out_5      ,A_out_6,Q_out_6 );
booth i_007 (A_out_6,M,Q_out_6      ,A_out_7,Q_out_7 );
booth i_008 (A_out_7,M,Q_out_7      ,A_out_8,Q_out_8 );

assign Z = {A_out_8, Q_out_8[8:1]};

endmodule
