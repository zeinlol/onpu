library verilog;
use verilog.vl_types.all;
entity main_vlg_sample_tst is
    port(
        bin             : in     vl_logic_vector(3 downto 0);
        clock           : in     vl_logic;
        clock11         : in     vl_logic;
        clock17         : in     vl_logic;
        clock19         : in     vl_logic;
        reset           : in     vl_logic;
        reset12         : in     vl_logic;
        reset18         : in     vl_logic;
        reset20         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end main_vlg_sample_tst;
