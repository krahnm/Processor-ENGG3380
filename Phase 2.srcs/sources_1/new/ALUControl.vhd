
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUControl is
    Port ( FuncIn : in STD_LOGIC_VECTOR (3 downto 0);
           ALUOp : in STD_LOGIC_VECTOR (1 downto 0);
           SelOut : out STD_LOGIC_VECTOR (2 downto 0));
end ALUControl;

architecture Behavioral of ALUControl is

begin

process (FuncIn, ALUOp)
begin


if (ALUOp = "00") then
    case FuncIn is
    when "0001" => SelOut <= "000"; -- and
    when "0010" => SelOut <= "001"; -- or
    when "0011" => SelOut <= "010"; -- uAddReg
    when "0100" => SelOut <= "011"; -- xor
    when "0101" => SelOut <= "100"; -- sAddReg
    when "0110" => SelOut <= "101"; -- sSubReg
    when "0111" => SelOut <= "110"; -- sltReg
    when "1010" => SelOut <= "010"; -- uAddImm
    when "1011" => SelOut <= "100"; -- sAddImm
    when "1100" => SelOut <= "101"; -- sSubImm
    when "1101" => SelOut <= "110"; -- sltImm
    when "1111" => SelOut <= "101"; -- beq
    when others => SelOut <= "111";
    end case;

else
SelOut <= "010"; -- uAddImm

end if;


end process;


end Behavioral;
