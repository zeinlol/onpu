-- Listing 4.1
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
entity counter16 is
 port(
 CLK : in STD_LOGIC;
 Res : in STD_LOGIC;
 Q : out STD_LOGIC_VECTOR(3 downto 0)
 );
end counter16;
architecture counter16 of counter16 is
signal mem: STD_LOGIC_VECTOR(3 downto 0);
begin
 process (CLK, Res, mem)
 begin
 if Res = '1' then mem <= "0000";
 elsif (rising_edge(CLK)) then
 mem <= mem + 1;
 end if;
 end process;
Q <= mem;
end counter16;