library verilog;
use verilog.vl_types.all;
entity verilog_yunfang is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clk_200m        : out    vl_logic;
        locked          : out    vl_logic;
        pwm1            : out    vl_logic;
        pwm2            : out    vl_logic;
        adc_q           : in     vl_logic_vector(9 downto 0);
        adc_i           : in     vl_logic_vector(9 downto 0);
        adc_oc          : out    vl_logic;
        adc_iq          : in     vl_logic;
        adc_clk         : out    vl_logic
    );
end verilog_yunfang;
