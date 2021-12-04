`timescale 1ns / 1ps

//logic ve aritmatik kaydirma durumlarinin analizi 
//sa ile kac bitlik oteleme yapilmasi gerektigi bulunur 32 bit --- 2^5
module barrel_shifter(d,sa,right,arith,sh);
	
	input [31 : 0] d;
	input [4 : 0]  sa;
	input right, arith;	
	
	output [31 : 0] sh;
	reg    [31 : 0] sh;
	
	always @* begin
		//sola kaydirma durumlarinin analizi
		if(!(right) && !(arith)) begin  	      //sola ve logical oteleme
			sh = d << sa; 
		end else if(!(right) && (arith)) begin    //sola ve aritmatik oteleme
			sh = $signed(d) <<< sa;
		end else if((right) && !(arith)) begin	  //saga ve logical oteleme 
			sh = d >> sa;
		end else if((right) && (arith)) begin    //saga ve aritmatik oteleme
			sh = $signed(d) >>> sa;
		end
	end
			
endmodule
