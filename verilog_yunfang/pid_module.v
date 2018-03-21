module pid_module(
						clk,rst_n,adc_v,adc_a,expect_signal,expect_pwm
);
/***************************************************************************************/
input clk; 
input rst_n; 
input[31:0] adc_v;
input[31:0] adc_a;
output[31:0] expect_pwm;
input[31:0] expect_signal;
/***************************************************************************************/
wire[31:0] adc_v;
wire[31:0] adc_a;   

integer expect_pwm;

reg[5:0] count_pid;
reg pid_clk;

integer P;
integer I;

parameter kp = 1;
parameter ki = 1;
parameter kd = 1;				
/***************************************************************************************/
always @(negedge clk or negedge rst_n)
begin
	if(!rst_n)   
		begin 
			count_pid <= 0;
			pid_clk <= 0;
		end
	else
		begin
			pid_clk <= (count_pid < 13) ? 0 : 1;
			if(count_pid < 19) 
				count_pid <= count_pid + 1;
			else
				count_pid <= 0;
		end
end
/*
always @(posedge pid_clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			P <= 0;
			I <= 0;
			expect_pwm <= 0;
		end
	else
		begin
			P <= expect_signal - adc_v;

			if(I + expect_signal - adc_v < -5)
				begin 
					I <= -5;
					expect_pwm <= (expect_signal - adc_v - P) * kd + (expect_signal - adc_v) * kp + (-5) * ki;
				end
			else if(I + expect_signal - adc_v > 5)
				begin
					I <= 5;
					expect_pwm <= (expect_signal - adc_v - P) * kd + (expect_signal - adc_v) * kp + 5 * ki;
				end
			else
				begin
					I <= I + expect_signal - adc_v;
					expect_pwm <= (expect_signal - adc_v - P) * kd + (expect_signal - adc_v) * kp + (I + expect_signal - adc_v) * ki;
				end
		end		   
end
*/

always @(posedge pid_clk or negedge rst_n)
begin
	if(!rst_n)
		expect_pwm <= 0;
	else	 
      expect_pwm <= expect_signal;	
end

endmodule