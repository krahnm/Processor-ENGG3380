library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MDR is
  Port ( DataIn  : in  std_logic_vector (15 downto 0):= "0000000000000000";
       DataOut  : out  std_logic_vector (15 downto 0):= "0000000000000000"; 
       CLK,en  : in std_logic);
end MDR;

architecture Behavioral of MDR is
type registerArray is array(0 to 0) of std_logic_vector(15 downto 0);
signal registers : registerArray := (others=> "0000000000000000" ); --initializes to xero
begin
process (CLK)
  begin
    if falling_edge(CLK) then
      -- Read Data
        DataOut <= registers(0);
      -- Write Data
      if(en = '1') then
        registers(0) <= DataIn;  -- Write data to specified register
        end if;
    end if;
  end process;


end Behavioral;
