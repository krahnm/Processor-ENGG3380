
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU_Structural is
generic ( Dwidth : integer := 15 );
  port ( IN1, IN2  : in  std_logic_vector (15 downto 0):= "0000000000000000";
        ALU_OUT   : out std_logic_vector (15 downto 0):= "0000000000000000";
        SEL       : in  std_logic_vector (2 downto 0);
        Cin       : in  std_logic;
        Zero, OVF, NVE : out std_logic);
end ALU_Structural;

architecture Structural of ALU_Structural is

component ALU_Structural_OneBit is
 port ( IN1, IN2  : in  std_logic;
       ALU_OUT   : out std_logic;
       AO        : out std_logic;
       SEL       : in  std_logic_vector (2 downto 0);
       ASS       : in std_logic;
       Cin       : in  std_logic;
       Less      : in std_logic;
       OVF : out std_logic);
end component;

component Compliment2s is
  Port (IN1 : in std_logic_vector (15 downto 0);
        MSB : in std_logic;
        OVFIN : in std_logic;
        SEL : in std_logic;
        NVE : out std_logic;
        OUT1: out std_logic_vector (15 downto 0));
end component;

signal Ct : std_logic_vector(15 downto 1);
signal NO : std_logic_vector (14 downto 0);
signal Z : std_logic;

signal less : std_logic;

signal ALUO : std_logic_vector (15 downto 0);
signal MSBLOGIC : std_logic;
signal OVFT: std_logic;
signal CinT: std_logic;
signal ASST: std_logic;
signal cmpSEL : std_logic;

begin

ALU1: ALU_Structural_OneBit port map(IN1 => IN1(0), IN2 => IN2(0), ALU_OUT => ALUO(0), AO => NO(0), SEL => SEL, ASS => ASST, Cin => CinT, less => less, OVF => Ct(1));
RIP: for I in 1 to 14 generate
ALUX: ALU_Structural_OneBit port map(IN1 => IN1(I), IN2 => IN2(I), ALU_OUT => ALUO(I), AO => NO(I), SEL => SEL, ASS => ASST, Cin => Ct(I), less => Z,OVF => Ct(I+1));    
end generate;
ALU16: ALU_Structural_OneBit port map(IN1 => IN1(15), IN2 => IN2(15), ALU_OUT => ALUO(15), AO => less, SEL => SEL, ASS => ASST, Cin => Ct(15), less => Z, OVF => OVFT);

CMP: Compliment2s port map (IN1 => ALUO, MSB => ALUO(15), OVFIN => OVFT, SEL => cmpSEL, NVE => NVE, OUT1 => ALU_OUT);


cmpSEL <= SEL(2) AND (not (SEL(2) and SEL(1) and (not(SEL(0)))));
Z <= '0';
ASST <= not(SEL(0) xor SEL(1) xor SEL(2));
OVF <= OVFT;
CinT <= ASST;
Zero <= not(ALUO(0) or ALUO(1) or ALUO(2) or ALUO(3) or ALUO(4) or ALUO(5) or ALUO(6) or ALUO(7) or ALUO(8) or ALUO(9) or ALUO(10) or ALUO(11) or ALUO(12) or ALUO(13) or ALUO(14) or ALUO(15));
end Structural;
