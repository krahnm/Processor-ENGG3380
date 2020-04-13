
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenSegmentDecoder_vhdl is
    Port ( 	S : in std_logic_vector (3 downto 0);
		    D : out std_logic_vector (6 downto 0));
end SevenSegmentDecoder_vhdl;

architecture Behavioral of SevenSegmentDecoder_vhdl is

begin

    process (S)
    begin
                case S is          --gfedcba
                when "0000" => D <= "1000000"; --0
                when "0001" => D <= "1111001"; --1
                when "0010" => D <= "0100100"; --2
                when "0011" => D <= "0110000"; --3
                when "0100" => D <= "0011001"; --4
                when "0101" => D <= "0010010"; --5
                when "0110" => D <= "0000010"; --6
                when "0111" => D <= "1111000"; --7
                when "1000" => D <= "0000000"; --8
                when "1001" => D <= "0011000"; --9
                when "1010" => D <= "0001000"; --A
                when "1011" => D <= "0000011"; --B
                when "1100" => D <= "1000110"; --C
                when "1101" => D <= "0100001"; --D
                when "1110" => D <= "0000110"; --E
                when "1111" => D <= "0001110"; --F
                when others => D <= "0000000";
            end case;

end process;

end Behavioral;

