
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_Structural_OneBit is
 port ( IN1, IN2  : in  std_logic;
        ALU_OUT   : out std_logic;
        AO        : out std_logic; 
        SEL       : in  std_logic_vector (2 downto 0);
        ASS       : in std_logic;
        Cin       : in  std_logic;
        Less      : in std_logic;
        OVF : out std_logic);
end ALU_Structural_OneBit;

architecture Structural of ALU_Structural_OneBit is

component ArithmeticUnit is
Port (     S : in  STD_LOGIC_VECTOR(2 downto 0);
           B : in  STD_LOGIC;
           A : in  STD_LOGIC;
           ASS : in STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ga : out  STD_LOGIC);
end component;

component MUX is
	port (a,b,c,d,e,f,h,i :in std_logic;
	 S : in  STD_LOGIC_VECTOR(2 downto 0);
	g: out std_logic);
end component;

signal Gat: std_logic;
signal func: std_logic_vector (7 downto 0);

begin

func(0) <= IN1 and IN2;
func(1) <= IN1 or IN2;
func(2) <= Gat;
func(3) <= IN1 xor IN2;
func(4) <= Gat;
func(5) <= Gat;
func(6) <= Less;
func(7) <= '0';
AO <= Gat;
BigMUX: MUX port map (a => func(0),b => func(1),c => func(2),d => func(3),e => func(4),f => func(5),h => func(6),i => func(7), s => SEL, g => ALU_OUT);
Arth: ArithmeticUnit port map (S => SEL, B => IN2, A => IN1, ASS => ASS, Cin => Cin, Cout => OVF, Ga => Gat);

end Structural;
