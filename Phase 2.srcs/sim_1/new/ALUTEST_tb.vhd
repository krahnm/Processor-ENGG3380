
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALUTEST_tb is
end ALUTEST_tb;

architecture Behavioral of ALUTEST_tb is
component ALU_Structural is
generic ( Dwidth : integer := 8 );
  port ( IN1, IN2  : in  std_logic_vector (15 downto 0);
        ALU_OUT   : out std_logic_vector (15 downto 0);
        SEL       : in  std_logic_vector (2 downto 0);
        Cin       : in  std_logic;
        Zero, OVF, NVE : out std_logic);
end component;

signal       IN1, IN2  :   std_logic_vector (15 downto 0);
signal       SEL       :   std_logic_vector (2 downto 0);
signal       Cin       :   std_logic;
signal       Zero, OVF :   std_logic;
signal       ALU_OUT   :   std_logic_vector (15 downto 0);
signal       NVE       :   std_logic;

begin

 uut: ALU_Structural port map (
   IN1 => IN1, 
   IN2 => IN2, 
   SEL => SEL, 
   Cin => Cin,
   Zero => Zero,
   OVF => OVF,
   NVE => NVE,
   ALU_OUT => ALU_OUT);

    test_bench: process
    begin
  
        IN1 <= "0000000000000000";--AND
        IN2 <= "0000000000000001";
        SEL <= "000"; 
        Cin <= '0';
        wait for 100 ns;
         
        IN1 <= "0000000001100000";--OR
        IN2 <= "0000000000000001";
        SEL <= "001"; 
        Cin <= '0';
        wait for 100 ns;
        
        IN1 <= "0000000011000000";--unsigned add
        IN2 <= "0000000011111101";
        SEL <= "010";
        Cin <= '0';
        wait for 100 ns;
        
        IN1 <= "0000000001100000"; --xor
        IN2 <= "0000000000001111";
        SEL <= "011";
        Cin <= '0';
        wait for 100 ns;
        
        IN1 <= "0000000010111111"; --signed add
        IN2 <= "0000000010000000";
        SEL <= "100";
        Cin <= '0';
        wait for 100 ns;
        
        IN1 <= "0000000000001111";--signed subtract
        IN2 <= "0000000001110011";
        SEL <= "101";
        Cin <= '0';
        wait for 100 ns;
        
        IN1 <= "0000000010011000";--set on less than
        IN2 <= "0000000001110000";
        SEL <= "110";
        Cin <= '0';
        wait for 100 ns;
        
        IN1 <= "0000000000000000";--set on less than
        IN2 <= "0000000000000001";
        SEL <= "110";
        Cin <= '0';
        wait for 100 ns;
       
       wait;
            
    end process;      
                        
END;

--end Behavioral;
