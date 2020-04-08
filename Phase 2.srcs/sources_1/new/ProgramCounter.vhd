
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ProgramCounter is
  Port (AddIn   : in  std_logic_vector(15 downto 0):= "0000000000000000";
        CLK, EN     : in std_logic;
        AddOut  : out std_logic_vector(15 downto 0):= "0000000000000000");
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

process (CLK)
begin

    if(rising_edge(CLK) and (EN = '1')) then
       
            AddOut <= AddIn;--"0000000000000000";
       
    end if;
end process;

end Behavioral;
