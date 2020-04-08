

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shiftLeftBottom is
  Port (input : in std_logic_vector(15 downto 0):= "0000000000000000";
        output : out std_logic_vector(15 downto 0):= "0000000000000000" );
end shiftLeftBottom;

architecture Behavioral of shiftLeftBottom is

begin

output <= input(13 downto 0) & "00";

end Behavioral;
