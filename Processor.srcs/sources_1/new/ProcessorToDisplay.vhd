library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;

entity ProcessorToDisplay is
Port ( numIn : in std_logic_vector(5 downto 0);
        numOutOverall : out std_logic_vector(15 downto 0);
        C : out std_logic_vector(6 downto 0);
        AN : out std_logic_vector(7 downto 0);
        CLK100MHZ : in std_logic);
end ProcessorToDisplay;

architecture Behavioral of ProcessorToDisplay is

component Processor is
Port(numIn : in std_logic_vector(5 downto 0);
     numOut : out std_logic_vector(15 downto 0);
     cclk : in std_logic);
end component;
    
component SevenSegmentDecoder_vhdl is
    Port ( 	S : in std_logic_vector (3 downto 0);
		    D : out std_logic_vector (6 downto 0));
end component;

<<<<<<< HEAD
signal clkdiv : std_logic_vector(10 downto 0):= "00000000000";
signal anIn: std_logic_vector(7 downto 0):= "00000000";
=======
signal clkdiv : std_logic_vector(14 downto 0):="000000000000000";
signal anIn: std_logic_vector(7 downto 0) := "00000000";
>>>>>>> master
signal displayFull : std_logic_vector(15 downto 0);
signal display1, display2,display3, display4: std_logic_vector(3 downto 0);
signal DISP1,DISP2,DISP3,DISP4: std_logic_vector(6 downto 0);
signal Pclk: std_logic;
signal numOutTo7Seg: std_logic_vector(15 downto 0);
begin

<<<<<<< HEAD
Proc: Processor port map(numIn => numIn, numOut=>displayFull,cclk=>clkdiv(2));
=======
Proc: Processor port map(numIn => numIn, numOut=>numOutTo7Seg,cclk=>clkdiv(14));
>>>>>>> master

SEG1: SevenSegmentDecoder_vhdl port map(S => display1, D => DISP1);
SEG2: SevenSegmentDecoder_vhdl port map(S=> display2, D=> DISP2);
SEG3: SevenSegmentDecoder_vhdl port map(S=> display3, D=> DISP3);
SEG4: SevenSegmentDecoder_vhdl port map(S=> display4, D=> DISP4);

display1 <= numOutTo7Seg(15 downto 12);
display2 <= numOutTo7Seg (11 downto 8);
display3 <= numOutTo7Seg(7 downto 4);
display4 <= numOutTo7Seg(3 downto 0);

<<<<<<< HEAD
numOut <= displayFull;
=======
numOutOverall <= numOutTo7Seg;
>>>>>>> master
clock_divider: process (CLK100MHZ)
    begin
    
        if (rising_edge(CLK100MHZ)) then
<<<<<<< HEAD
            clkdiv <=  clkdiv + 1;
        end if;        
    end process clock_divider;

process(clkdiv(2),anIn)
begin
if (rising_edge(clkdiv(2))) then
=======
            clkdiv <=  std_logic_vector(unsigned(clkdiv(14 downto 0)) + 1);
        end if;        
    end process clock_divider;

process(clkdiv(14),anIn)
begin
Pclk <= clkdiv(14);
if (rising_edge(clkdiv(14))) then
>>>>>>> master
    case anIn is
                when "11110111" =>
                C <= DISP2;
                anIn <= "11111011";
                when "11111011" =>
                C <= DISP3;
                anIn <= "11111101";
                when "11111101" =>
                C <= DISP4;
                anIn <= "11111110";
                when "11111110" =>
                C <= DISP1;
                anIn <= "11110111";
                when others =>
                anIn <= "11110111";
            end case;
end if;
end process;
<<<<<<< HEAD
AN <= anIn;
=======
AN<=anIn;

>>>>>>> master
end Behavioral;