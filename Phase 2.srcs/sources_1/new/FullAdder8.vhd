----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2020 04:53:45 PM
-- Design Name: 
-- Module Name: FullAdder8 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdder16 is
Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           Cout : out  STD_LOGIC);
end FullAdder16;

architecture Behavioral of FullAdder16 is
component FullAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

signal C : std_logic_vector(14 downto 0);

begin

FA7: FullAdder port map (A => A(15), B => B(15), Cin => C(14), S => S(15), Cout => Cout);
RIP: for I in 1 to 14 generate 
FAX: FullAdder port map (A => A(I), B => B(I), Cin => C(I-1), S => S(I), Cout => C(I));
end generate;
FA0: FullAdder port map (A => A(0), B => B(0), Cin => Cin, S => S(0), Cout => C(0));

end Behavioral;
