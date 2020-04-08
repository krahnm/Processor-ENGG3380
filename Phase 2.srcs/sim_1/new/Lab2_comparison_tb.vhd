----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2020 02:49:22 PM
-- Design Name: 
-- Module Name: Lab2_comparison_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Lab2_comparison_tb is
--  Port ( );
end Lab2_comparison_tb;

architecture Behavioral of Lab2_comparison_tb is
component RegisterFile is
    generic (Dwidth : integer := 16; -- Data Width (i.e. each register is 16 bits)
         Awidth : integer := 3); -- Address Width (i.e. 2^4 = 16 registers)
    port (ReadA1, ReadA2, WriteA : in std_logic_vector(Awidth-1 downto 0):= "000";
          DataO1, DataO2 : out std_logic_vector(Dwidth-1 downto 0):= "0000000000000000";
          DataIn : in std_logic_vector(Dwidth-1 downto 0):= "0000000000000000";
          WE, CLK : in std_logic);
end component;

signal ReadA1, ReadA2, WriteA : std_logic_vector(3-1 downto 0):= "000";
signal  DataO1, DataO2 : std_logic_vector(16-1 downto 0);
signal DataIn : std_logic_vector(16-1 downto 0);
signal WE, CLK :  std_logic;


         
          
          
begin
   uut: RegisterFile port map 
     (ReadA1=>ReadA1, ReadA2=>ReadA2, WriteA=>WriteA, DataO1=>DataO1, DataO2=>DataO2, DataIn=>DataIn, WE=>WE, CLK=>CLK);

    test_bench: process
    begin
        clk <= '0';
        we <= '0';
        DataIn <= "XXXXXXXXXXXXXXXX";
        WriteA <= "001";
        wait for 100 ns;
        
        clk <= '1';
        we <= '0';
        DataIn <= "XXXXXXXXXXXXXXXX";
        WriteA <= "001";
        wait for 100 ns;        
        
        clk <= '0';
        we <= '1';
        DataIn <= "1111111000000000";
        WriteA <= "101";
        wait for 100 ns;
        
        clk <= '1';
        we <= '0';
        DataIn <= "1011110010010010";
        WriteA <= "101";
        wait for 100 ns;
        
        clk <= '0';
        we <= '0';
        DataIn <= "1111111111111111";
        ReadA1 <= "101";
        WriteA <= "011";
        wait for 100 ns;        
        
        clk <= '1';
        we <= '1';
        DataIn <= "0000000000111111";
        ReadA1 <= "101";
        WriteA <= "101";
        wait for 100 ns;
        
        clk <= '0';
        we <= '1';
        DataIn <= "1111000011110000";
        ReadA1 <= "101";
        WriteA <= "001";
        wait for 100 ns;
        
        clk <= '1';
        we <= '1';
        DataIn <= "1110001110001110";
        WriteA <= "111";
        wait for 100 ns;        
                
    end process;      
                        
end Behavioral;
