
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shiftLeftTop is
  Port (input : in std_logic_vector(9 downto 0):= "0000000000";
        PC : in std_logic_vector(3 downto 0):= "0000";
        output : out std_logic_vector(15 downto 0):= "0000000000000000");
end shiftLeftTop;


architecture Behavioral of shiftLeftTop is

begin

output<= "000000" & input;

end Behavioral;
