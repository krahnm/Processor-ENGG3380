
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ArithmeticUnit is
Port (     S : in  STD_LOGIC_VECTOR(2 downto 0);
           B : in  STD_LOGIC;
           A : in  STD_LOGIC;
           ASS : in STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ga : out  STD_LOGIC);
end ArithmeticUnit;

architecture Structural of ArithmeticUnit is

component FullAdder is
    port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
	end component;
	
    signal Bt: std_logic;
    signal Cint: std_logic;

begin

FA: FullAdder port map (A=>A, B=>Bt, Cin=>Cin, S=>Ga, Cout=>Cout);

Bt <= B xor ASS;

end Structural;
