`timescale 1ns / 1ps

module fifo(clk, rst, okuma_cs,yazma_cs, data_in, data_out, ready, overflow );

	input rst, clk, okuma_cs, yazma_cs;
	input  [7 : 0] data_in;
	output [7 : 0] data_out;
	output  ready;
	output reg overflow;
	
	//fifo buffer depth
	reg [7 : 0] fifo_buff [7 : 0]; //yazma_ptr ve okuma_ptr [2 : 0] -----> derinlik 2^n
	reg  [2 : 0] yazma_ptr;
	reg  [2 : 0] okuma_ptr;
	
	always @(posedge clk or negedge rst) begin
		if(!rst) begin              //rst 0 iken butun degerler 0 landi
			yazma_ptr <= 0;
			okuma_ptr <= 0;
			overflow  <= 0;
			
		end else begin
			if(yazma_cs) begin   //fifo ya yazma aktifse
				if((yazma_ptr + 3'b1) != (okuma_ptr)) begin  //
					fifo_buff[yazma_ptr] <= data_in;
					yazma_ptr <= yazma_ptr + 3'd1;
			     end else begin
					overflow <= 1;
				end
			end
			if(okuma_cs && ready) begin
				okuma_ptr <= okuma_ptr + 3'd1;
				overflow <= 0;
			end
		end
	end

	assign ready    = (yazma_ptr != okuma_ptr);
	assign data_out = fifo_buff[okuma_ptr];
		
endmodule
