
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity IncrMUX is
port (AddIn  : in  std_logic_vector (7 downto 0);
    INC : in std_logic_vector (7 downto 0);
    SEL : in std_logic_vector (1 downto 0);
    AddOut  : out  std_logic_vector (7 downto 0));
end IncrMUX;

architecture Behavioral of IncrMUX is

begin

AddOut <=   "00000000" when SEL = "00" else
            INC when SEL = "01" else
            AddIn when SEL = "11" else 
            "00000000";

end Behavioral;
