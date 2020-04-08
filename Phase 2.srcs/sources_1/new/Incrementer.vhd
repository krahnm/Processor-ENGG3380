
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Incrementer is
  Port ( AddIn  : in std_logic_vector(7 downto 0);
         AddOut : out std_logic_vector(7 downto 0));
end Incrementer;

architecture Behavioral of Incrementer is

begin

AddOut <= unsigned(AddIn) + '1';

end Behavioral;
