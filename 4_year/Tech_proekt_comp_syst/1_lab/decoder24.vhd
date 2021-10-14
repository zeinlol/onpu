-- Listing 2.1
library ieee;
use ieee.std_logic_1164.all;
entity first_lab_ent is
port
(
X : in STD_LOGIC_VECTOR(1 downto 0);
en : in STD_LOGIC;
 Y : out STD_LOGIC_VECTOR(3 downto 0)
);
end entity;
architecture decoder24_arch of first_lab_ent is
 begin
 Y(0) <= not X(1) and not X(0) and en;
 Y(1) <= not X(1) and X(0) and en;
 Y(2) <= X(1) and not X(0) and en;
 Y(3) <= X(1) and X(0) and en;
 end architecture;