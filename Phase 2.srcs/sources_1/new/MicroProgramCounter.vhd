
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MicroProgramCounter is
  Port (AddIn   : in  std_logic_vector(7 downto 0);
        CLK     : in std_logic;
        AddOut  : out std_logic_vector(7 downto 0));
end MicroProgramCounter;

architecture Behavioral of MicroProgramCounter is

begin

process (CLK)
begin

    if(rising_edge(CLK))then
            AddOut <= AddIn;
    end if;
end process;

end Behavioral;
