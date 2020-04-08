
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux3to1 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0):= "0000000000000000";
           b : in STD_LOGIC_VECTOR (15 downto 0):= "0000000000000000";
           c : in STD_LOGIC_VECTOR (15 downto 0):= "0000000000000000";
           g : out STD_LOGIC_VECTOR (15 downto 0):= "0000000000000000";
           sel : in STD_LOGIC_VECTOR (1 downto 0));
end Mux3to1;

architecture Behavioral of Mux3to1 is

begin

process (a,b,c,sel)
begin

if (sel = "00") then
    g <= a;
elsif (sel = "01") then
    g <= b;
elsif (sel = "10") then
    g <= c;
elsif (sel = "11") then
    g <= "0000000000000000";
end if;
end process;

end Behavioral;
