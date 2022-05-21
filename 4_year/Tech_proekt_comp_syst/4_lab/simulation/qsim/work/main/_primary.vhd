library verilog;
use verilog.vl_types.all;
entity main is
    port(
        overflow        : out    vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        Q               : out    vl_logic_vector(3 downto 0);
        clock17         : in     vl_logic;
        reset18         : in     vl_logic;
        Q13             : out    vl_logic_vector(3 downto 0);
        clock11         : in     vl_logic;
        reset12         : in     vl_logic;
        Q16             : out    vl_logic_vector(3 downto 0);
        clock19         : in     vl_logic;
        reset20         : in     vl_logic;
        sseg            : out    vl_logic_vector(6 downto 0);
        bin             : in     vl_logic_vector(3 downto 0)
    );
end main;
