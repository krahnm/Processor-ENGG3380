library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor is
Port ( numIn : in std_logic_vector(5 downto 0);
       numOut : out std_logic_vector(15 downto 0);
       cclk : in std_logic);
end Processor;

architecture Behavioral of Processor is

component ALU_Structural is
  port ( IN1, IN2  : in  std_logic_vector (15 downto 0);
        ALU_OUT   : out std_logic_vector (15 downto 0);
        SEL       : in  std_logic_vector (2 downto 0);
        Cin       : in  std_logic;
        Zero, OVF, NVE : out std_logic);
end component;

component RegisterFile is
  port (ReadA1, ReadA2, WriteA : in std_logic_vector(2 downto 0);
        DataO1, DataO2 : out std_logic_vector(15 downto 0);
        DataIn : in std_logic_vector(15 downto 0);
        WE, CLK : in std_logic);
end component;

component MPControl is
  Port (Opcode  :   in std_logic_vector(3 downto 0);
        CLK :   in std_logic;
        PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, RegDst, RegWrite, MDRWEn, AWEn,BWEn, ALUOutWEn : out std_logic; 
        PCSource, ALUSrcA,ALUSrcB : out std_logic_vector(1 downto 0);
        ALUOp : out std_logic_vector(1 downto 0));
end component;

component ProgramCounter is
  Port (AddIn   : in  std_logic_vector(15 downto 0);
        CLK, EN     : in std_logic;
        AddOut  : out std_logic_vector(15 downto 0));
end component;

component InstructionModule is
port ( DataIn  : in  std_logic_vector (15 downto 0);
       DataOut  : out  std_logic_vector (15 downto 0); 
       en : in std_logic;
       CLK  : in std_logic);
end component;

component MDR is
  Port ( DataIn  : in  std_logic_vector (15 downto 0);
       DataOut  : out  std_logic_vector (15 downto 0); 
       CLK,en  : in std_logic);
end component;

component MUX2to1 is
	port (a,b :in std_logic_vector(15 downto 0);
	 S : in  STD_LOGIC;
	g: out std_logic_vector (15 downto 0));
end component;

component Mux2to1_5bit is
	port (a,b :in std_logic_vector(2 downto 0);
	 S : in  STD_LOGIC;
	g: out std_logic_vector (2 downto 0));
end component;

component Mux2to1_8bit is
	port (a,b :in std_logic_vector(15 downto 0);
	 S : in  STD_LOGIC;
	g: out std_logic_vector (15 downto 0));
end component;

component Memory is
   Port (CLK, memWrite, memRead: in std_logic;
       addIn : in std_logic_vector(15 downto 0);
       userVal : in std_logic_vector(5 downto 0);
       DataOut : out std_logic_vector(15 downto 0);
       writeData : in std_logic_vector(15 downto 0);
       finalfibbage: out std_logic_vector(15 downto 0));
end component;

component AReg is
    Port ( DataIn : in STD_LOGIC_VECTOR (15 downto 0);
           DataOut : out STD_LOGIC_VECTOR (15 downto 0);
           en, CLK : in std_logic);
end component;

component BReg is
    Port ( DataIn : in STD_LOGIC_VECTOR (15 downto 0);
           DataOut : out STD_LOGIC_VECTOR (15 downto 0);
           en, CLK : in std_logic);
end component;

component ALUControl is
    Port ( FuncIn : in STD_LOGIC_VECTOR (3 downto 0);
           ALUOp : in STD_LOGIC_VECTOR (1 downto 0);
           SelOut : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux3to1 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           c : in STD_LOGIC_VECTOR (15 downto 0);
           g : out STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0));
end component;

component ALUReg is
    Port ( DataIn : in STD_LOGIC_VECTOR (15 downto 0);
           DataOut : out STD_LOGIC_VECTOR (15 downto 0);
           en, CLK : in std_logic);
end component;

component signExtend is
  Port (input : in std_logic_vector(5 downto 0);
        output : out std_logic_vector(15 downto 0) );
end component;

component shiftLeftTop is
  Port (input : in std_logic_vector(9 downto 0);
        PC : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(15 downto 0));
end component;

component shiftLeftBottom is
  Port (input : in std_logic_vector(15 downto 0);
        output : out std_logic_vector(15 downto 0) );
end component;

component FourToOneMux is
Port (a : in std_logic_vector(15 downto 0);
      c : in std_logic_vector(15 downto 0);
      d : in std_logic_vector(15 downto 0);
      sel : in std_logic_vector(1 downto 0);
      output : out std_logic_vector(15 downto 0));
end component;

component MuxSrcA is
  Port (a,b : in std_logic_vector(15 downto 0);
        s : in std_logic_vector(1 downto 0);
        g : out std_logic_vector(15 downto 0));
end component;


--2to1MUX (MemoryMux)
signal memAddr : std_logic_vector(15 downto 0);
signal memMuxIn1 : std_logic_vector(15 downto 0);
signal memMuxIn2 : std_logic_vector(15 downto 0);
--Memory
signal readMemData : std_logic_vector(15 downto 0);
--InstructionModule
signal instOut : std_logic_vector(15 downto 0);
--RegisterFile
signal RFO1 : std_logic_vector(15 downto 0);
signal RFO2 : std_logic_vector(15 downto 0);
signal RFwriteDataIn : std_logic_vector(15 downto 0);
signal RFwriteAddr : std_logic_vector(2 downto 0);
--5bit mux for register file
signal regDst : std_logic;
--8bit mux for reg file
signal MemtoReg :std_logic;
--MDR
signal dataOutMDR : std_logic_vector(15 downto 0);
signal ALUOut : std_logic_vector(15 downto 0);
--A-Register
signal ARegEn : std_logic;
signal ARegOut : std_logic_vector(15 downto 0);
--B-Register
signal BRegEn : std_logic;
signal BRegOut : std_logic_vector(15 downto 0);
--ALU
signal ALUin1 : std_logic_vector(15 downto 0);
signal ALUSrcA : std_logic_vector(1 downto 0);
signal ALUSel : std_logic_vector(2 downto 0);
signal Cin : std_logic;
signal Zero : std_logic;
signal OVF : std_logic;
signal NVE : std_logic;
--ALUControl
signal ALUOp : std_logic_vector(1 downto 0);
--ALURegister
signal ALUREGOUT : std_logic_vector(15 downto 0);

signal shiftLeft : std_logic_vector(15 downto 0);
signal PCIn : std_logic_vector(15 downto 0);
signal PCSource,ALUSrcB : std_logic_vector(1 downto 0);
--Control unit
signal RegWrite : std_logic;
signal PCWriteCond : std_logic;
signal PCWrite : std_logic;
signal IorD : std_logic;
signal MemRead : std_logic;
signal MemWrite: std_logic;
signal IRWrite : std_logic;

--sign extend
signal signEx : std_logic_vector(15 downto 0);

--4 to 1 mux
signal d : std_logic_vector(15 downto 0);
signal ALUin2 : std_logic_vector(15 downto 0);

--Register A, B and MDR and ALUOut Enables
signal MDREn : std_logic;
signal ALUOutEn : std_logic;

--signals for the and gate and or gate from control unit
signal PCEn : std_logic;
begin

MUXPC : MUX2to1 port map(a=>memMuxIn1, b=>ALUREGOUT, S=>IorD, g=>memAddr);
Mem : Memory port map(CLK =>cclk, memWrite => MemWrite, memRead => MemRead, addIn=>memAddr, userVal => numIn, DataOut=>readMemData, writeData=>BRegOut, finalfibbage => numOut);
InstrMod : InstructionModule port map (DataIn=>readMemData, DataOut=>instOut, CLK=>cclk,en=>IRWrite);
MemDataReg : MDR port map(DataIn=>readMemData, DataOut=>dataOutMDR,en=>MDREn, CLK=>cclk);
RegFile : RegisterFile port map(ReadA1=>instOut(11 downto 9), ReadA2=>instOut(8 downto 6), WriteA=>RFwriteAddr, DataO1=>RFO1, DataO2=>RFO2, DataIn=>RFwriteDataIn, WE=>RegWrite, CLK=>cclk);
RFAddrMux : Mux2to1_5bit port map(a=>instOut(8 downto 6),b=>instOut(5 downto 3), g=>RFwriteAddr, S=>regDst);
RFWriteDataMux : Mux2to1_8bit port map(a=>ALUOut, b=>dataOutMDR,g=>RFwriteDataIn,S=>MemtoReg);
ARegister : AReg port map(DataIn=>RFO1, DataOut=>ARegOut,en=>ARegEn,CLK=>cclk);
BRegister : BReg port map(DataIn=>RFO2, DataOut=>BRegOut,en=>BRegEn,CLK=>cclk);
ARegALUMux : MuxSrcA port map(a=>memMuxIn1, b=>ARegOut,g=>ALUin1,S=>ALUSrcA);
ALU : ALU_Structural port map(IN1=>ALUin1,IN2=>ALUin2,ALU_OUT=>ALUOut,SEL=>ALUSel,Cin=>Cin,Zero=>Zero,OVF=>OVF,NVE=>NVE);
ALUController : ALUControl port map(FuncIn=>instOut(15 downto 12),ALUOp=>ALUOp,SelOut=>ALUSel);
ALURegister : ALUReg port map(DataIn=>ALUOut,DataOut=>ALUREGOUT,CLK=>cclk, en=>ALUOutEn);
Mux3to130Bit : Mux3to1 port map (a=>ALUOut, b=>ALUREGOUT,c=>shiftLeft, g=>PCIn, sel=>PCSource);
Control : MPControl port map (MDRWEn=>MDREn,AWEn=>ARegEn,BWEn=>BRegEn,ALUOutWEn=>ALUOutEn,Opcode=>instOut(15 downto 12), CLK=>cclk,PCWriteCond=>PCWriteCond, PCWrite=>PCWrite, IorD=>IorD, MemRead=>MemRead, MemWrite=>MemWrite, MemtoReg=>MemtoReg, IRWrite=>IRWrite, RegDst=>RegDst, RegWrite=>RegWrite, ALUSrcA=>ALUSrcA, PCSource=>PCSource,ALUSrcB=>ALUSrcB, ALUOp=>ALUOp);
PC : ProgramCounter port map(AddIn=>PCIn, CLK=>cclk, EN=>PCEn, AddOut=>memMuxIn1);
ShiftTop : shiftLeftTop port map(input=>InstOut(9 downto 0),PC=>memMuxIn1(15 downto 12),output=>shiftLeft);
ExtendSign : signExtend port map(input=>InstOut(5 downto 0), output=>signEx);
ShiftBottom : shiftLeftBottom port map(input=>signEx,output=>d);
Mux4to1 : FourToOneMux port map(a=>BRegOut,c=>signEx,d=>"0000000000000000", sel=>ALUSrcB,output=>ALUin2);

PCEn <= (Zero and PCWriteCond) or PCWrite;

end Behavioral;
