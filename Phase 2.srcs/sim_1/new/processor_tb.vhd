library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity processor_tb is
end processor_tb;

architecture Behavioral of processor_tb is

component ProcessorToDisplay is
Port ( numIn : in std_logic_vector(5 downto 0);
        numOut : out std_logic_vector(15 downto 0);
        C : out std_logic_vector(6 downto 0);
        AN : out std_logic_vector(7 downto 0);
        CLK100MHZ : in std_logic);
end component;

signal numIn: std_logic_vector (5 downto 0) := "000111";
signal numOut: std_logic_vector (15 downto 0);
signal CLK100MHZ: std_logic := '0';
signal clk_period: time := 10ps;
signal C : std_logic_vector(6 downto 0);
signal AN : std_logic_vector(7 downto 0);

begin
uut: ProcessorToDisplay port map (numIn => numIn,
                         numOut => numOut,
                         C => C,
                         AN => AN,
                         CLK100MHZ => CLK100MHZ);

clk_process: process
    begin
        CLK100MHZ <= '1';
        wait for clk_period / 2;
        CLK100MHZ <= '0';
        wait for clk_period / 2;
    end process;

testbench: process
    begin    
    wait for clk_period;
    
    end process;
end Behavioral;
