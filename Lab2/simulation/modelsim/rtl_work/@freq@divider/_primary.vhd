library verilog;
use verilog.vl_types.all;
entity FreqDivider is
    port(
        clkin           : in     vl_logic;
        clkout          : out    vl_logic
    );
end FreqDivider;
