library verilog;
use verilog.vl_types.all;
entity cnt1s is
    port(
        i               : in     vl_logic_vector(5 downto 0);
        o               : out    vl_logic_vector(2 downto 0)
    );
end cnt1s;
