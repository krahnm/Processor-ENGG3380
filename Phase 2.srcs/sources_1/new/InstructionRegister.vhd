
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity InstructionModule is
port ( DataIn  : in  std_logic_vector (15 downto 0):= "0000000000000000";
       DataOut  : out  std_logic_vector (15 downto 0):= "0000000000000000"; 
       CLK,en  : in std_logic);
end InstructionModule;

architecture Behavioral of InstructionModule is
type registerArray is array(0 to 0) of std_logic_vector(15 downto 0);
signal registers : registerArray:= (others=> "0000000000000000" ); --initializes to xero
begin

-- Read Data
DataOut <= registers(0);
process (clk)
  begin
    if falling_edge(clk)and en = '1' then
     -- Write Data
        registers(0) <= DataIn;         
    end if;
  end process;


end Behavioral;
