module pwm_module(
                  clk,rst_n,pwm1,pwm2,expect_pwm
);
/***************************************************************************************/
input clk; 
input rst_n; 
output pwm1;
output pwm2;
input[32:1] expect_pwm;
/***************************************************************************************/
reg[7:0] count_pwm;        //200M时钟，5M pwm，一个pwm波计数40次            
integer duty1;
integer duty2;
reg pwm1;
wire pwm2;
/***************************************************************************************/

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			duty1 <= 0;
			duty2 <= 0;
			pwm1 <= 0;
			count_pwm <= 0;
		end
	else
		begin
			if(count_pwm == 39)
				begin
					if(expect_pwm[32]  == 1) duty1 <= 20;
					else if(expect_pwm > 20) duty1 <= 0;
					else duty1 <= 20 - expect_pwm; 
				end
			if(count_pwm == 19)
				begin 
					if(expect_pwm[32]  == 1) duty2 <= 20;
					else if(expect_pwm > 20) duty2 <= 40;
					else duty2 <= 20 + expect_pwm;
				end
				
			if(count_pwm < 39) 
				count_pwm <= count_pwm + 1;
			else
				count_pwm <= 0;
			
			if(count_pwm < duty1 || count_pwm >= duty2) 
				pwm1 <= 0;
			else pwm1 <= 1;
		end
end
assign pwm2 = 0;

endmodule