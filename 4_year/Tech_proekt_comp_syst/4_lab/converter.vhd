library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity converter is
port(
      bin  : in std_logic_vector(3 downto 0); 
		sseg : out std_logic_vector(6 downto 0)
     );
end entity;

architecture converter of converter is
begin
	with bin select
		sseg <= "1000000" when "0000",
		        "1111001" when "0001",
				  "0100100" when "0010",
				  "0110000" when "0011",
				  "0011001" when "0100",
				  "0010010" when "0101",
				  "0000010" when "0110",
				  "1111000" when "0111",
				  "0000000" when "1000",
				  "0010000" when "1001",
				  "0000000" when others;
end architecture;