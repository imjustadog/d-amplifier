library verilog;
use verilog.vl_types.all;
entity pll_400M is
    port(
        areset          : in     vl_logic;
        inclk0          : in     vl_logic;
        c0              : out    vl_logic;
        locked          : out    vl_logic
    );
end pll_400M;
