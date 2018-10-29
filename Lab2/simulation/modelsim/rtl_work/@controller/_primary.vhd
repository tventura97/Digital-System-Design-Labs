library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk             : in     vl_logic;
        sw0             : in     vl_logic;
        sw1             : in     vl_logic;
        tens            : out    vl_logic_vector(3 downto 0);
        ones            : out    vl_logic_vector(3 downto 0)
    );
end Controller;
