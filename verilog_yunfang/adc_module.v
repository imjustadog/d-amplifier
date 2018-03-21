module adc_module(
						clk,rst_n,adc_q,adc_i,adc_oc,adc_iq,adc_clk,adc_v,adc_a
);
/***************************************************************************************/
input clk; 
input rst_n; 

input[9:0] adc_q;
input[9:0] adc_i;
output adc_oc;
input adc_iq;
output adc_clk;

output[31:0] adc_v;
output[31:0] adc_a;
/***************************************************************************************/
reg[5:0] count_adc;
reg[2:0] count_data;

wire[9:0] adc_q;
wire[9:0] adc_i;

reg adc_oc;
wire adc_iq;
reg adc_clk;

reg[31:0] adc_vt;
reg[31:0] adc_at;

reg[31:0] adc_v;
reg[31:0] adc_a;
/***************************************************************************************/
always @(negedge clk or negedge rst_n)
begin
	if(!rst_n)   
		begin 
			adc_v <= 0;
			adc_a <= 0;
			adc_vt <= 0;
			adc_at <= 0; 
			count_adc <= 0;
			count_data <= 0;
			adc_clk <= 0;
		end
	else
		begin
		   adc_clk <= (count_adc < 5) ? 0 : 1;
			if(count_adc < 9) 
				count_adc <= count_adc + 1;
			else
				count_adc <= 0;
				
			if(count_adc == 0)
			begin
				count_data <= count_data + 1;
				adc_vt <= adc_vt + adc_i;
				adc_at <= adc_at + adc_q;
			end
			
			if(count_data > 1)
				begin
					adc_v <= ((adc_vt >> 6) - 16);
					adc_a <= ((adc_at >> 6) - 16);
					adc_vt <= 0;
					adc_at <= 0;
					count_data <= 0;
				end
		end
end

endmodule