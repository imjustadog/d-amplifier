library verilog;
use verilog.vl_types.all;
entity signal_module is
    generic(
        Up              : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        Hold            : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        Down            : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        Low             : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        expect_signal   : out    integer
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Up : constant is 1;
    attribute mti_svvh_generic_type of Hold : constant is 1;
    attribute mti_svvh_generic_type of Down : constant is 1;
    attribute mti_svvh_generic_type of Low : constant is 1;
end signal_module;
