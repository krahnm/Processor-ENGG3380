library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RegisterFile is
    generic (Dwidth : integer := 16; -- Data Width (i.e. each register is 16 bits)
         Awidth : integer := 3); -- Address Width (i.e. 2^4 = 16 registers)
    port (ReadA1, ReadA2, WriteA : in std_logic_vector(Awidth-1 downto 0):= "000";
          DataO1, DataO2 : out std_logic_vector(Dwidth-1 downto 0):= "0000000000000000";
          DataIn : in std_logic_vector(Dwidth-1 downto 0):= "0000000000000000";
          WE, CLK : in std_logic);
end RegisterFile;

architecture Behavioral of RegisterFile is
type registerArray is array(0 to 7) of std_logic_vector(15 downto 0);
signal registers : registerArray := (others=> "0000000000000000" ); --initializes to xero
                    
begin
process (CLK)
  begin
    if falling_edge(CLK) then
      -- Read A and B
      DataO1 <= registers(conv_integer(ReadA1));--indexes register array
      DataO2 <= registers(conv_integer(ReadA2));
      -- Write
      if WE = '1' then
        registers(conv_integer(WriteA)) <= DataIn;  -- Write data to specified register

      end if;
      
    end if;
  end process;
end behavioral;