library verilog;
use verilog.vl_types.all;
entity adc_module is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        adc_q           : in     vl_logic_vector(9 downto 0);
        adc_i           : in     vl_logic_vector(9 downto 0);
        adc_oc          : out    vl_logic;
        adc_iq          : in     vl_logic;
        adc_clk         : out    vl_logic;
        adc_v           : out    vl_logic_vector(31 downto 0);
        adc_a           : out    vl_logic_vector(31 downto 0)
    );
end adc_module;
