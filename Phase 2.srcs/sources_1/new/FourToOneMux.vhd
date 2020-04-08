
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FourToOneMux is
Port (a : in std_logic_vector(15 downto 0):= "0000000000000000";
      c : in std_logic_vector(15 downto 0):= "0000000000000000";
      d : in std_logic_vector(15 downto 0):= "0000000000000000";
      sel : in std_logic_vector(1 downto 0);
      output : out std_logic_vector(15 downto 0):= "0000000000000000");
end FourToOneMux;

architecture Behavioral of FourToOneMux is

begin
process (a,c,d,sel)
begin
if (sel = "00") then
    output <= a;
elsif (sel = "01") then
    output <= "0000000000000001";
elsif (sel = "10") then
    output <= c;
elsif (sel = "11") then
    output <= d;
end if;
end process;


end Behavioral;
