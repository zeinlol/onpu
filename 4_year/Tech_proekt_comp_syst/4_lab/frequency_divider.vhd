library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity frequency_divider is
	port 
	(
		clock	: in std_logic;
		reset : in std_logic;
		overflow : out std_logic
	);
	
end entity;

architecture frequency_divider of frequency_divider is	

	signal mem: std_logic_vector(24 downto 0); -- 25 разрядов (24 downto 0)

begin
	process(clock, reset)
	begin
		if(reset = '1') then mem <= "0000000000000000000000000"; overflow <= '0';
		elsif(rising_edge(clock)) then
			if(mem = 26999999) then mem <= "0000000000000000000000000"; overflow <= '1'; -- 27 000 000 Hz и изменить 4 разряда "0000" на 25 разрядов 
			else mem <= mem + 1; overflow <= '0';
			end if;
		end if;
	end process;
	
end architecture;