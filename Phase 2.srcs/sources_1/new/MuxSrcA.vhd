----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2020 04:13:49 PM
-- Design Name: 
-- Module Name: MuxSrcA - Behavioral
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

entity MuxSrcA is
  Port (a,b : in std_logic_vector(15 downto 0):= "0000000000000000";
        s : in std_logic_vector(1 downto 0);
        g : out std_logic_vector(15 downto 0):= "0000000000000000");
end MuxSrcA;

architecture Behavioral of MuxSrcA is

begin

process(a,b,s)
begin

if (s = "00") then
    g <= a;
elsif (s = "01") then
    g <= b;
elsif(s = "10") then
    g <= "0000000000000000";
elsif(s="11") then
    g <= "0000000000000000";
end if;
end process;

end Behavioral;
