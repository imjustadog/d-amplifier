library verilog;
use verilog.vl_types.all;
entity pwm_module is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        pwm1            : out    vl_logic;
        pwm2            : out    vl_logic;
        expect_pwm      : in     vl_logic_vector(32 downto 1)
    );
end pwm_module;
