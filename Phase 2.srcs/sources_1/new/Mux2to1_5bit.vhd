library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2to1_5bit is
	port (a,b :in std_logic_vector(2 downto 0):= "000";
	 S : in  STD_LOGIC;
	g: out std_logic_vector (2 downto 0):= "000");
end Mux2to1_5bit;

architecture Behavioral of Mux2to1_5bit is

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
