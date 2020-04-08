
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LogicMapping is
port (OPIn  : in  std_logic_vector (3 downto 0);
    AddOut  : out  std_logic_vector (7 downto 0));
end LogicMapping;

architecture Behavioral of LogicMapping is

begin

AddOut (7 downto 4) <= OPIn;
AddOut (3 downto 0) <= "0000";

end Behavioral;
