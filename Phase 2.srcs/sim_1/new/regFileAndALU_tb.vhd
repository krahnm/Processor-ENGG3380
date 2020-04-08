library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regFileAndALU_tb is
end regFileAndALU_tb;

architecture Behavioral of regFileAndALU_tb is
component ALU_REGFILE_OVERALL is
  Port ( MemDataIn : in std_logic_vector(15 downto 0);
         ALUDataOut : out std_logic_vector(15 downto 0);
         MemToReg,RegDst,RegWrite,cclk, IRWrite, MDREn : in std_logic;
         ALUOp, ALUSrcA, ALUSrcB : in std_logic_vector(1 downto 0);
         Zero : out std_logic );
end component;

signal MemDataIn : std_logic_vector(15 downto 0);
signal ALUDataOut : std_logic_vector(15 downto 0);
 signal MemToReg, RegDst, RegWrite, cclk, IRWrite, MDREn : std_logic;
signal ALUOp, ALUSrcA, ALUSrcB : std_logic_vector(1 downto 0);
signal Zero : std_logic;
signal clk_period: time := 1ns;

begin
uut: ALU_REGFILE_OVERALL port map(MemDataIn=>MemDataIn,
         ALUDataOut=>ALUDataOut,
         MemToReg=>MemToReg,
         RegDst=>RegDst,
         RegWrite=>RegWrite,
         cclk=>cclk,
         IRWrite=>IRWrite,
         MDREn=>MDREn,
         ALUOp=>ALUOp,
         ALUSrcA=>ALUSrcA,
         ALUSrcB=>ALUSrcB,
         Zero=>Zero);


clk_process: process
    begin
        cclk <= '1';
        wait for clk_period / 2;
        cclk <= '0';
        wait for clk_period / 2;
    end process;

testbench: process
    begin 
    --"1011" & "000" & "100" & userVal; -- addi $t1, $zero, USERVALUE
           MemDataIn <= "1011" & "000" & "100" & "000111";--userVal   
           IRWrite <= '1';
           MDREn <= '0';
           MemtoReg<= '0';
           RegWrite <= '1';
           RegDst <= '1';
           ALUOp <= "00";
           ALUSrcA <= "01";
           ALUSrcB <= "10";
           wait for clk_period;
    
     MemDataIn <= "1011" & "000" & "100" & "000111";--userVal   
                      IRWrite <= '1';
                      MDREn <= '0';
                      MemtoReg<= '0';
                      RegWrite <= '1';
                      RegDst <= '1';
                      ALUOp <= "00";
                      ALUSrcA <= "01";
                      ALUSrcB <= "10";
                      wait for clk_period;
    
   MemDataIn <= "1011" & "000" & "100" & "000111";--userVal   
                                 IRWrite <= '1';
                                 MDREn <= '0';
                                 MemtoReg<= '0';
                                 RegWrite <= '1';
                                 RegDst <= '1';
                                 ALUOp <= "00";
                                 ALUSrcA <= "01";
                                 ALUSrcB <= "10";
                                 wait for clk_period;
    wait;
    end process;
end Behavioral;

