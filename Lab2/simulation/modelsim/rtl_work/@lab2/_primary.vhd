library verilog;
use verilog.vl_types.all;
entity Lab2 is
    port(
        clk             : in     vl_logic;
        sw1             : in     vl_logic;
        sw0             : in     vl_logic;
        onesPlace       : out    vl_logic_vector(6 downto 0);
        tensPlace       : out    vl_logic_vector(6 downto 0)
    );
end Lab2;
