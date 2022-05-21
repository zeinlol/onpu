library verilog;
use verilog.vl_types.all;
entity main_vlg_check_tst is
    port(
        overflow        : in     vl_logic;
        Q               : in     vl_logic_vector(3 downto 0);
        Q13             : in     vl_logic_vector(3 downto 0);
        Q16             : in     vl_logic_vector(3 downto 0);
        sseg            : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end main_vlg_check_tst;
