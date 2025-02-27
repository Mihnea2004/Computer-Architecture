library verilog;
use verilog.vl_types.all;
entity msd is
    port(
        i               : in     vl_logic_vector(4 downto 0);
        o               : out    vl_logic_vector(3 downto 0)
    );
end msd;
