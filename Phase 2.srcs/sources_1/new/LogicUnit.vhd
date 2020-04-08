----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2020 07:15:17 PM
-- Design Name: 
-- Module Name: LogicUnit - Structural
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

entity LogicUnit is
port (a,b : in std_logic; 
	s0,s1: in std_logic; 
	g : out std_logic); 
end LogicUnit;

architecture Structural of LogicUnit is

component MUX is
	port (a,b,c,d :in std_logic;
	s0, s1: in std_logic;
	g: out std_logic);
end component;

signal S: std_logic_vector(3 downto 0);

begin

MUX1: MUX port map (a => S(0), b => S(1), c => S(2), d => S(3), s0 => s0, s1 => s1, g => g);

S(0) <= a and b;
S(1) <= a or b;
S(2) <= '0';
S(3) <= a xor b;

end Structural;
