module signal_module(
						clk,rst_n,expect_signal
);
/***************************************************************************************/
input clk; 
input rst_n;
output expect_signal;
/***************************************************************************************/
reg[9:0] count_signal; 
reg[3:0] count_10;                      
reg signal_clk;
reg[1:0] state;
integer expect_signal;
/***************************************************************************************/
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		count_10 <= 1'b0;
	else
		begin
			signal_clk <= (count_10 < 5) ? 0 : 1;
			if(count_10 < 9) 
				count_10 <= count_10 + 1'b1;
			else
			   count_10 <= 1'b0;
	end		   
end

parameter   Up   = 2'b00,               
            Hold = 2'b01,            
				Down = 2'b10,            
				Low  = 2'b11;            
				
always @(posedge signal_clk or negedge rst_n)
begin
	if(!rst_n)   
		begin 
			expect_signal <= 0;
			state <= Up;
			count_signal <= 0;
	   end
	else
		begin
			if(count_signal < 79) 
				count_signal <= count_signal + 1;
			else
				count_signal <= 0;
			
			case(state)
				Up:
					if(count_signal < 19)
						expect_signal <= expect_signal+1;
					else
						state <= Hold;
				Hold: 
					if(count_signal < 39)
						expect_signal <= 20;
					else
						state <= Down;
				Down: 
					if(count_signal < 59)
						expect_signal <= expect_signal-1;
					else
						state <= Low;
				Low:  
					if(count_signal < 79)
						expect_signal <= 0;
					else
						state <= Up;
				default:
					state <= Up;
			endcase
		end
end


endmodule