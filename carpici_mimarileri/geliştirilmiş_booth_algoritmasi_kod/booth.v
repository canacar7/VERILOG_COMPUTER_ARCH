`timescale 1ns / 1ps

module booth(M,Q,Z,clk,rst,u);

input   [7 : 0] M;
input   [7 : 0] Q;
output reg [15 : 0] Z;
reg kontrol;

input                 clk, rst;              
output   reg          [3:0] u;     

	
reg       [2 : 0] state;

parameter [2 : 0]     S100   = 3'b100,
					  S101   = 3'b101,
					  S110   = 3'b110,
					  S111   = 3'b111,
					  IDLE   = 3'b000,
					  SONUC  = 3'b001;
			
 
reg      [7 : 0] A_temp;
reg      [ 7: 0] Q_temp;


reg      [7 : 0] A_out;
reg      [ 7: 0] Q_out;





always @(posedge clk or negedge rst) begin

if(rst == 1'b1) begin
         state <= IDLE;
         Z = 16'd0;
		 u = 4'b0000;
		 A_temp = 8'b00000000;
		 kontrol = 1'b0;
end

else if(clk)	begin

	case(state)
		
		IDLE        : begin
		                if(rst == 1'b1) begin
		                  
		                end
		                else begin 
                            Z = 16'd0;
                            u = 4'b0000;
                            A_temp = 8'b00000000;
                            Q_temp = Q;
                            kontrol = 1'b0;
                            state = {1'b1,Q_temp[0], kontrol};
						end
					  end
		
		S100, S111  : begin

						if(u >= 8) begin
						           u = 4'b0000;
						           state = SONUC;
						           end
						else       begin
								   kontrol = Q_temp[0];
						           Q_temp = {A_temp[0] , Q_temp[7 : 1]};
						           A_temp = {A_temp[7] , A_temp[7 : 1]};				           
						           u = u + 4'b0001;					
						           state = {1'b1,Q_temp[0],kontrol};
						           end
				    end	
				   
        S101       : begin

						if(u >= 8) begin
						           u = 4'b0000;
						           state = SONUC;
						           end
						else       begin
						           A_temp = A_temp + M;
						           kontrol = Q_temp[0];
						           Q_temp = {A_temp[0] , Q_temp[7 : 1]}; 
						           A_temp = {A_temp[7] , A_temp[7 : 1]};
  	
						           u = u + 4'b0001;				
						           state = {1'b1,Q_temp[0],kontrol};
						           end
                    end   
					
        S110       : begin

						if(u >= 8) begin
						           u = 4'b0000;
						           state = SONUC;
						           end
						else       begin
								   A_temp = A_temp + ~M + 1;
								   kontrol = Q_temp[0];
								   Q_temp = {A_temp[0] , Q_temp[7 : 1]};
						           A_temp = {A_temp[7] , A_temp[7 : 1]};
						           u = u + 4'b0001;						
						           state = {1'b1,Q_temp[0],kontrol};
						           end
						           
                    end 
                    
         SONUC     : begin
                     A_out = A_temp;
                     Q_out = Q_temp;
                     Z = {A_out, Q_out};
                     u = 4'b0000;
                     state = IDLE; 
                     end  
                     
                            
             
    endcase 
    end       	
end


endmodule
