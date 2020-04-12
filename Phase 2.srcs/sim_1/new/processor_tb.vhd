library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity processor_tb is
end processor_tb;

architecture Behavioral of processor_tb is
component Processor is
Port ( numIn : in std_logic_vector(5 downto 0);
       numOut : out std_logic_vector(15 downto 0);
       cclk : in std_logic);
end component;

signal numIn: std_logic_vector (5 downto 0) := "000000";
signal numOut: std_logic_vector (15 downto 0);
signal cclk: std_logic := '0';
signal clk_period: time := 1ns;

begin
uut: Processor port map (numIn => numIn,
                         numOut => numOut,
                         cclk => cclk);

clk_process: process
    begin
        cclk <= '1';
        wait for clk_period / 2;
        cclk <= '0';
        wait for clk_period / 2;
    end process;

testbench: process
    begin    
    wait for clk_period;
    
    end process;
end Behavioral;
