
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Memory is
  Port (CLK, memWrite, memRead: in std_logic;
        addIn : in std_logic_vector(15 downto 0):= "0000000000000000";
        userVal : in std_logic_vector(5 downto 0);
        DataOut : out std_logic_vector(15 downto 0):= "0000000000000000";
        writeData : in std_logic_vector(15 downto 0):= "0000000000000000";
        finalfibbage: out std_logic_vector(15 downto 0):= "0000000000000000");
end Memory;

architecture Behavioral of Memory is
type memType is array(0 to 2**15) of std_logic_vector(15 downto 0);

--set everything to zero
signal memory: memType:= ("1011" & "000" & "100" & userVal,-- addi $t1, $zero, USERVALUE		0
"0101" & "100" & "000" & "001" & "000", -- add $a0,$t1,$zero		1
---- fibonacci:
"1011" & "000" & "011" & "000001", -- addi $t0,$zero,1				2
"1111" & "001" & "000" & "010010", -- beq $a0,$zero,return1			3
"1111" & "001" & "100" & "010100",  -- beq $a0,$t0,return2			4
"0101" & "000" & "000" & "100" & "000", -- add $t1,$zero,$zero		5
"1011" & "000" & "000" & "000001",-- addi $t2,$zero,1				6
"1011" & "000" & "110" & "000010", -- addi $t3,$zero,2				7
"1011" & "000" & "111" & "000001", -- addi $t4,$zero,1				8
---- loop:
"0111" & "111" & "001" & "010" & "000", -- slt $a1, $t4, $a0		9
"1111" & "010" & "000" & "010001",  -- beq $a1, $zero,endloop 		10
"0101" & "101" & "101" & "101" & "000",-- add $t2,$t2,$t2			11
"0101" & "101" & "110" & "100" & "000",-- add $t1,$t2,$t3			12
"0101" & "000" & "110" & "101" & "000", -- add $t2,$zero,$t3		13
"0101" & "000" & "100" & "110" & "000", -- add $t3,$zero,$t1		14
"1011" & "111" & "111" & "000001", -- addi $t4,$t4,1				15
"1110" & "000000001001", -- j loop									16
---- endloop:
"1110" & "000000000010", -- j fibonacci								17
---- return1:
"1011" & "000" & "100" & "000001", -- addi $t1,$zero,1				18
"1110" & "000000000010", -- j fibonacci								19
---- return2:
"1011" & "000" & "100" & "000010", -- addi $t1,$zero,2				20
"1110" & "000000000010", -- j fibonacci 							21
---- Save to output
"1000" & "000" & "100" & "010111", -- sw							22
others => "0000000000000000");
attribute ram_style: string;
attribute ram_style of memory : signal is "distributed";
 
begin


finalfibbage <= memory (23);

process (CLK, addIn)
  begin
  
    if (addIn = "0000000000000000") then
        memory(0) <= "1011" & "000" & "100" & userVal;
    end if;
  
    if falling_edge(CLK) then
      -- Read Data
      if(memRead = '1') then
        DataOut <= memory(conv_integer(addIn));
        end if;
      -- Write Data
      if(memWrite = '1')then
        memory(conv_integer(addIn)) <= writeData;  -- Write data to specified register
        end if;
    end if;
  end process;

end Behavioral;
