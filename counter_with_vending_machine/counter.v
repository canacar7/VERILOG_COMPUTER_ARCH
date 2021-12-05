`timescale 1ns / 1ps



module counter(u,clk,rst,q);

    input        clk, rst;              // clk, clear (active low)
    input        u;                      // u==1: count up; u==0: count down
    output reg   [2:0] q;                      // 3-bit counter output
                                        // register type
	
	
	reg     [2 : 0] state, next_state;
	parameter [2 : 0] S0 = 3'b000,
					  S1 = 3'B001,
					  S2 = 3'B010,
					  S3 = 3'B011,
					  S4 = 3'B100,
					  S5 = 3'B101;
					  
					  
	always @(posedge clk or negedge rst) begin
		 if (rst) begin
			q <= 0;
			state <= S0;
		 end else 
			state <= next_state;
	end
	
	
	always @(*) begin
		case(state)
			
			S0 : begin 
				if(u == 1) begin
                    next_state <= S1;
                     q <=3'd0 ;
				end
				else if(u == 0) begin
                     next_state <= S5; 
                     q <=3'd0;
			     end
			end                                       
													  
			S1 : begin	                              
				if(u == 1) begin
                    next_state <= S2;
                    q <=3'd1 ;
				end
				else if(u == 0) begin
                     next_state <= S0; 
                     q <=3'd1;
			     end
			end	                                      
													
			S2 : begin	                             
				if(u == 1) begin
                    next_state <= S3;
                    q <=3'd2 ;
				end
				else if(u == 0) begin
                     next_state <= S1; 
                     q <=3'd2;
			     end
			end	                                      
													  
			S3 : begin	                              
				if(u == 1) begin
                    next_state <= S4;
                    q <=3'd3 ;
				end
				else if(u == 0) begin
                     next_state <= S2; 
                     q <=3'd3;
                end
			end	                                      
													  
			S4 : begin	                              
				if(u == 1) begin
                    next_state <= S5;
                    q <= 3'd4 ;
				end
				else if(u == 0) begin
                     next_state <= S3; 
                     q <= 3'd4;
                end
			end	                                  
												  
			S5 : begin	                          
				if(u == 1) begin
                    next_state <= S0;
                    q <= 3'd5 ;
				end
				else if(u == 0) begin
                     next_state <= S4; 
                     q <= 3'd5;
                end
			end	
			
			default : begin
				next_state <= S0;
			end
				
			
		endcase
end

endmodule
