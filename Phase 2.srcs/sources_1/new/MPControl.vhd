

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MPControl is
  Port (Opcode  :   in std_logic_vector(3 downto 0);
        CLK :   in std_logic;
        PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, RegDst, RegWrite, MDRWEn, AWEn, BWEn,  ALUOutWEn : out std_logic; 
        PCSource, ALUSrcA,ALUSrcB : out std_logic_vector(1 downto 0);
        ALUOp: out std_logic_vector(1 downto 0));
end MPControl;

architecture Behavioral of MPControl is

component Incrementer is
  Port ( AddIn  : in std_logic_vector(7 downto 0);
         AddOut : out std_logic_vector(7 downto 0));
end component;


component IncrMUX is
port (AddIn  : in  std_logic_vector (7 downto 0);
    INC : in std_logic_vector (7 downto 0);
    SEL : in std_logic_vector (1 downto 0);
    AddOut  : out  std_logic_vector (7 downto 0));
end component;

component MicrocodeStore is
Port (  Address : in STD_LOGIC_VECTOR (7 downto 0);
        CLK    : in    std_logic;
        PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, RegDst, RegWrite, MDRWEn, AWEn, BWEn,  ALUOutWEn: out std_logic; 
        PCSource, ALUSrcA, ALUSrcB : out std_logic_vector(1 downto 0);
        ALUOp, microFetchSel : out std_logic_vector(1 downto 0)); 
end component;

component MicroProgramCounter is
  Port (AddIn   : in  std_logic_vector(7 downto 0);
        CLK   : in std_logic;
        AddOut  : out std_logic_vector(7 downto 0));
end component;

component LogicMapping is
port (OPIn  : in  std_logic_vector (3 downto 0);
    AddOut  : out  std_logic_vector (7 downto 0));
end component;

signal INCM       :   std_logic_vector(7 downto 0);
signal AddOutM    :   std_logic_vector(7 downto 0);
signal AddInM     :   std_logic_vector(7 downto 0);

signal AddInMS    :   std_logic_vector(7 downto 0);
signal SELMS      :   std_logic_vector(1 downto 0);

signal Cin : std_logic;




begin
LM : LogicMapping port map(OPIn=>Opcode, AddOut=>AddInM);
Incr : Incrementer port map(AddIn=>AddInMS, AddOut=>INCM);
M : IncrMUX port map (AddIn => AddInM, INC=> INCM, SEL => SELMS, AddOut => AddOutM); 
MS : MicrocodeStore port map(Address => AddInMS, CLK=>CLK,  PCWriteCond=>PCWriteCond, PCWrite=>PCWrite, IorD=>IorD, MemRead=>MemRead, MemWrite=>MemWrite, MemtoReg=>MemtoReg, IRWrite=>IRWrite, RegDst=>RegDst, RegWrite=>RegWrite, ALUSrcA=>ALUSrcA, ALUSrcB=>ALUSrcB, MDRWEn=>MDRWEn, AWEn=>AWEn, BWEn=>BWEn, ALUOutWEn=>ALUOutWEn,PCSource=>PCSource, ALUOp=>ALUOp, microFetchSel=>SELMS);
PC : MicroProgramCounter port map(AddIn=>AddOutM, CLK=>CLK, AddOut=>AddInMS);

--Address : in STD_LOGIC_VECTOR (7 downto 0);
--        CLK    : in    std_logic;
--        PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, RegDst, RegWrite, ALUSrcA, ALUSrcB, MDRWEn, AWEn, BWEn,  ALUOutWEn: out std_logic; 
--        PCSource : out std_logic_vector(2 downto 0);
--        ALUOp, microFetchSel : out std_logic_vector(1 downto 0);
--        Cin

end Behavioral;
