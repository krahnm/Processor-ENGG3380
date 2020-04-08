
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX is
	port (a,b,c,d,e,f,h,i :in std_logic;
	 S : in  STD_LOGIC_VECTOR(2 downto 0);
	g: out std_logic);
end MUX;

architecture Behavioral of MUX is

begin
	process (a,b,c,d,e,f,h,i,S)
	begin
		if (S = "000") then
			g <= a;
		elsif (S = "001") then
			g <= b;
		elsif (S = "010") then
			g <= c;
		elsif (S = "011") then
			g <= d;
	    elsif (S = "100") then
	        g <= e;
	    elsif (S = "101") then
	        g <= f;
		elsif (S = "110") then
		    g <= h;
	    elsif (S = "111") then 
	        g <= i;
		end if;
	end process;
end Behavioral;

