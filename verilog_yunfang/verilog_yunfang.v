module verilog_yunfang(
                  clk,locked,
						pwm1,pwm2,
						adc_q,adc_i,adc_oc,adc_iq,adc_clk
);
/***************************************************************************************/ 
input clk;                      

output pwm1;
output pwm2;
output locked;

input[9:0] adc_q;
input[9:0] adc_i;
output adc_oc;
input adc_iq;
output adc_clk;
/***************************************************************************************/
wire[31:0] adc_v;
wire[31:0] adc_a;
wire clk_200m;
wire locked;
wire[31:0] expect_pwm;
wire[31:0] expect_signal;
wire rst_n;
/***************************************************************************************/
pll_400M	pll_400M_inst (
	.inclk0 ( clk ),
	.c0 (clk_200m),
	.locked (locked)
	);
	
reset_module U0
	(
		 .clk(clk),
       .rst_n(rst_n),
		 .locked(locked)
	);
	
signal_module U1
	(
		 .clk(clk_200m),
       .rst_n(rst_n),
		 .expect_signal(expect_signal)
	);
	
adc_module U2
	 (
       .clk(clk_200m),
       .rst_n(rst_n),
		 .adc_q(adc_q),
	    .adc_i(adc_i),
	    .adc_oc(adc_oc),
	    .adc_iq(adc_iq),
	    .adc_clk(adc_clk),
		 .adc_v(adc_v),
		 .adc_a(adc_a)
    );
	 
pid_module U3
	(
		 .clk(clk_200m),
       .rst_n(rst_n),
		 .adc_v(adc_v),
		 .adc_a(adc_a),
		 .expect_signal(expect_signal),
		 .expect_pwm(expect_pwm)
	);
	
pwm_module U4
	 (
       .clk(clk_200m),
       .rst_n(rst_n),
		 .pwm1(pwm1),
		 .pwm2(pwm2),
		 .expect_pwm(expect_pwm)
    );
	 
endmodule