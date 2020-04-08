library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Compliment2s is
  Port (IN1 : in std_logic_vector (15 downto 0);
        MSB : in std_logic;
        OVFIN : in std_logic;
        SEL : in std_logic;
        NVE : out std_logic;
        OUT1: out std_logic_vector (15 downto 0));
end Compliment2s;

architecture Behavioral of Compliment2s is
component MUX2to1 is
	port (a,b :in std_logic_vector(15 downto 0);
	 S : in  STD_LOGIC;
	g: out std_logic_vector (15 downto 0));
end component;

component FullAdder16 is
Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           Cout : out  STD_LOGIC);
end component;
signal MUXIN: std_logic_vector (15 downto 0);
signal ONE: std_logic_vector (15 downto 0);
signal XORED: std_logic_vector (15 downto 0);
signal ZERO: std_logic;
signal Cout: std_logic;
signal EXMSB: std_logic_vector (15 downto 0);
signal EXOVF: std_logic_vector (15 downto 0);
signal MUXSEL: std_logic;

begin
FA: FullAdder16 port map (A => ONE, B => XORED, Cin => ZERO, S=> MUXIN, Cout => Cout);
MUX: MUX2to1 port map (a => IN1, b => MUXIN, S => MUXSEL, g => OUT1);

ONE <= "0000000000000001";
ZERO <= '0';

EXTEND: for I in 0 to 15 generate
            EXMSB (I) <= MSB;
            EXOVF (I) <= OVFIN;
        end generate; 

XORED <= IN1 xor (EXMSB or EXOVF);
MUXSEL <= SEL and (OVFIN or MSB);
NVE <= MUXSEL;

end Behavioral;
