library verilog;
use verilog.vl_types.all;
entity LED is
    port(
        clk             : in     vl_logic;
        LEDPin          : out    vl_logic_vector(6 downto 0);
        Number          : in     vl_logic_vector(3 downto 0)
    );
end LED;
