library verilog;
use verilog.vl_types.all;
entity pid_module is
    generic(
        kp              : integer := 1;
        ki              : integer := 1;
        kd              : integer := 1
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        adc_v           : in     vl_logic_vector(31 downto 0);
        adc_a           : in     vl_logic_vector(31 downto 0);
        expect_signal   : in     vl_logic_vector(31 downto 0);
        expect_pwm      : out    integer
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of kp : constant is 1;
    attribute mti_svvh_generic_type of ki : constant is 1;
    attribute mti_svvh_generic_type of kd : constant is 1;
end pid_module;
