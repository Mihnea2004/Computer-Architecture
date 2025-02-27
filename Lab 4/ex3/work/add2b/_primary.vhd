library verilog;
use verilog.vl_types.all;
entity add2b is
    port(
        x               : in     vl_logic_vector(1 downto 0);
        y               : in     vl_logic_vector(1 downto 0);
        ci              : in     vl_logic;
        o               : out    vl_logic_vector(1 downto 0);
        co              : out    vl_logic
    );
end add2b;
