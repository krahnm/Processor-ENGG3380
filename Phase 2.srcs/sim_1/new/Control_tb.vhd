
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Control_tb is
end Control_tb;

architecture Behavioral of Control_tb is
component MPControl is
  Port (Opcode  :   in std_logic_vector(3 downto 0);
        CLK :   in std_logic;
        PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, RegDst, RegWrite, MDRWEn, AWEn, BWEn,  ALUOutWEn : out std_logic; 
        PCSource, ALUSrcA, ALUSrcB : out std_logic_vector(1 downto 0);
        ALUOp : out std_logic_vector(1 downto 0));
end component;



signal Opcode  :    std_logic_vector(3 downto 0);
signal clk :    std_logic;
signal PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, RegDst, RegWrite, MDRWEn, AWEn, BWEn,  ALUOutWEn :  std_logic; 
signal PCSource, ALUSrcA, ALUSrcB :  std_logic_vector(1 downto 0);
signal ALUOp :  std_logic_vector(1 downto 0);

begin

uut: MPControl port map(Opcode => opcode, 
                         CLK=>clk,
                         PCWriteCond=>PCWriteCond,
                         PCWrite=>PCWrite,
                         IorD=>IorD,
                         MemRead=>MemRead,
                         MemWrite=>MemWrite,
                         MemtoReg=>MemtoReg,
                         IRWrite=>IRWrite,
                         RegDst=>RegDst,
                         RegWrite=>RegWrite,
                         ALUSrcA=>ALUSrcA,
                         ALUSrcB=>ALUSrcB,
                         PCSource=>PCSource,
                         ALUOp=>ALUOp,
                         MDRWEn=>MDRWEn,
                         AWEn=>AWEn, 
                         BWEn=>BWEn,
                         ALUOutWEn=>ALUOutWEn);
                         

test_bench: process
    begin
    --register
        CLK <= '0';
        Opcode <= "0000";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "0000";
        wait for 1 ns;
                
         CLK <= '0';
         Opcode <= "0001";
         wait for 1 ns;
         
         CLK <= '1';
         Opcode <= "0001";
         wait for 1 ns;
        
        CLK <= '0';
        Opcode <= "0001";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "0001";
        wait for 1 ns;
                
         CLK <= '0';
         Opcode <= "0001";
         wait for 1 ns;
         
         CLK <= '1';
         Opcode <= "0001";
         wait for 1 ns;
         
         CLK <= '0';
         Opcode <= "0001";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "0001";
        wait for 1 ns;
        
        -------------------------
        --immediate
        CLK <= '0';
        Opcode <= "0000";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "0000";
        wait for 1 ns;
                
         CLK <= '0';
         Opcode <= "1010";
         wait for 1 ns;
         
         CLK <= '1';
         Opcode <= "1010";
         wait for 1 ns;
        
        CLK <= '0';
        Opcode <= "1010";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "1010";
        wait for 1 ns;
                
         CLK <= '0';
         Opcode <= "1010";
         wait for 1 ns;
         
         CLK <= '1';
         Opcode <= "1010";
         wait for 1 ns;
         
         CLK <= '0';
         Opcode <= "1010";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "1010";
        wait for 1 ns;
        
        ----------------------
        --lw
        CLK <= '0';
        Opcode <= "0000";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "0000";
        wait for 1 ns;
                
         CLK <= '0';
         Opcode <= "1001";
         wait for 1 ns;
         
         CLK <= '1';
         Opcode <= "1001";
         wait for 1 ns;
        
        CLK <= '0';
        Opcode <= "1001";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "1001";
        wait for 1 ns;
                
         CLK <= '0';
         Opcode <= "1001";
         wait for 1 ns;
         
         CLK <= '1';
         Opcode <= "1001";
         wait for 1 ns;
         
         CLK <= '0';
         Opcode <= "1001";
        wait for 10 ns;
        
        CLK <= '1';
        Opcode <= "1001";
        wait for 1 ns;
        
        ----------------------
        --sw
        CLK <= '0';
        Opcode <= "0000";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "0000";
        wait for 1 ns;
                
         CLK <= '0';
         Opcode <= "1000";
         wait for 1 ns;
         
         CLK <= '1';
         Opcode <= "1000";
         wait for 1 ns;
        
        CLK <= '0';
        Opcode <= "1000";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "1000";
        wait for 1 ns;
                
         CLK <= '0';
         Opcode <= "1000";
         wait for 1 ns;
         
         CLK <= '1';
         Opcode <= "1000";
         wait for 1 ns;
         
         CLK <= '0';
         Opcode <= "1000";
        wait for 1 ns;
        
        CLK <= '1';
        Opcode <= "1000";
        wait for 1 ns;
        
         
         wait;
         
         
         end process;
end;