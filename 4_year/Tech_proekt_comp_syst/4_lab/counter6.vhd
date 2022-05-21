library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter6 is
	port 
	(
		clock	: in std_logic;
		reset : in std_logic;
		Q		: out std_logic_vector(3 downto 0)
	);
	
end entity;

architecture counter6 of counter6 is	

	signal mem: std_logic_vector(3 downto 0);

begin
	process(clock, reset)
	begin
		if(reset = '1') then mem <= "0000";
		elsif(rising_edge(clock)) then
			if(mem = 5) then mem <= "0000";
			else mem <= mem + 1;
			end if;
		end if;
	end process;

	Q <= mem;

end architecture;