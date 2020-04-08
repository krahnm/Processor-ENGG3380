library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2to1 is
	port (a,b :in std_logic_vector(15 downto 0):= "0000000000000000";
	 S : in  STD_LOGIC;
	g: out std_logic_vector (15 downto 0):= "0000000000000000");
end MUX2to1;

architecture Behavioral of MUX2to1 is

begin
	process (a,b,S)
	begin
		if (S = '0') then
			g <= a;
		elsif (S = '1') then
			g <= b;
	   end if;
    end process;
end Behavioral;
