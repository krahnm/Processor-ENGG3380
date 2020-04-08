
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity signExtend is
  Port (input : in std_logic_vector(5 downto 0):= "000000";
        output : out std_logic_vector(15 downto 0):= "0000000000000000" );
end signExtend;

architecture Behavioral of signExtend is

begin

output <=input(5) & input(5) &  input(5) & input(5) & input(5) & input(5) & input(5) & input(5) & input(5) & input(5) & input;

end Behavioral;
