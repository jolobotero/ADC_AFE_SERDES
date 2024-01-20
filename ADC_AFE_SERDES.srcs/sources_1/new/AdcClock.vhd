----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2023 11:13:10
-- Design Name: 
-- Module Name: AdcClock - Behavioral
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
Library UNISIM;
use UNISIM.vcomponents.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AdcClock is
  Port (BitClk                 : in std_logic;
        BitClkRst              : in std_logic;
        BitClkEna              : in std_logic; 
        BitClkReSync           : in std_logic;
        BitClk_MonClkIn        : in std_logic;
        BitClk_RefClkIn        : in std_logic;
        BitClkAlignWarn        : out std_logic;
        BitClk_MonClkOut       : out std_logic;
        BitClk_RefClkOut       : out std_logic;
        BitClkInvrtd           : out std_logic;
        BitClkDone             : out std_logic
   );
end AdcClock;

architecture Behavioral of AdcClock is

signal IntBitClk_Ddly             : std_logic;
signal IntClkCtrlDlyCe            : std_logic;  
signal IntClkCtrlDlyInc           : std_logic; 
signal IntClkCtrlDlyRst           : std_logic;
signal IntBitClk                  : std_logic;
signal IntClkCtrlOut              : std_logic_vector(7 downto 0);
signal IntBitClkRst               : std_logic;



component  AdcClockProcess is
  Port (IntBitClkRst         : in  std_logic;
        BitClkEna            : in  std_logic;
        IntClkCtrlOut        : in  std_logic_vector(7 downto 0);
        BitClk_RefClkIn      : in  std_logic;
        BitClkAlignWarn      : out std_logic;
        BitClkInvrtd         : out std_logic;
        IntClkCtrlDlyInc     : out std_logic;
        IntClkCtrlDlyCe      : out std_logic;
        BitClkDone           : out std_logic  
   );
end  component;

begin

IDELAYCTRL_inst : IDELAYCTRL
port map (
RDY => open, -- 1-bit output: Ready output
REFCLK => BitClk_RefClkIn, -- 1-bit input: Reference clock input
RST => IntClkCtrlDlyRst -- 1-bit input: Active high reset input
);

IDELAYE2_inst_ClkDiv : IDELAYE2
generic map (
CINVCTRL_SEL => "FALSE", -- Enable dynamic clock inversion (FALSE, TRUE)
DELAY_SRC => "IDATAIN", -- Delay input (IDATAIN, DATAIN)
HIGH_PERFORMANCE_MODE => "TRUE", -- Reduced jitter ("TRUE"), Reduced power ("FALSE")
IDELAY_TYPE => "VARIABLE", -- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
IDELAY_VALUE => 16, -- Input delay tap setting (0-31)
PIPE_SEL => "FALSE", -- Select pipelined mode, FALSE, TRUE
REFCLK_FREQUENCY => 200.0, -- IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
IS_IDATAIN_INVERTED     => '1',
SIGNAL_PATTERN => "CLOCK" -- DATA, CLOCK input signal
)
port map (
CNTVALUEOUT => open, -- 5-bit output: Counter value output
DATAOUT => IntBitClk_Ddly, -- 1-bit output: Delayed data output
C => BitClk_RefClkIn, -- 1-bit input: Clock input
CE => IntClkCtrlDlyCe, -- 1-bit input: Active high enable increment/decrement input
CINVCTRL => '0', -- 1-bit input: Dynamic clock inversion input
CNTVALUEIN =>"00000", -- 5-bit input: Counter value input
DATAIN => '0', -- 1-bit input: Internal delay data input
IDATAIN => BitClk, -- 1-bit input: Data input from the I/O
INC => IntClkCtrlDlyInc, -- 1-bit input: Increment / Decrement tap delay input
LD => IntClkCtrlDlyRst, -- 1-bit input: Load IDELAY_VALUE input
LDPIPEEN => '0', -- 1-bit input: Enable PIPELINE register to load data input
REGRST => IntClkCtrlDlyRst -- 1-bit input: Active-high reset tap-delay input
);

IntClkCtrlDlyRst <= BitClkRst;

ISERDESE2_inst_DIVCLK : ISERDESE2
generic map (
DATA_RATE => "SDR", -- DDR, SDR
DATA_WIDTH => 8, -- Parallel data width (2-8,10,14)
DYN_CLKDIV_INV_EN => "FALSE", -- Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
DYN_CLK_INV_EN => "FALSE", -- Enable DYNCLKINVSEL inversion (FALSE, TRUE)
-- INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
INIT_Q1 => '0',
INIT_Q2 => '0',
INIT_Q3 => '0',
INIT_Q4 => '0',
INTERFACE_TYPE => "NETWORKING", -- MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
IOBDELAY => "IBUF", -- NONE, BOTH, IBUF, IFD
NUM_CE => 1, -- Number of clock enables (1,2)
OFB_USED => "FALSE", -- Select OFB path (FALSE, TRUE)
SERDES_MODE => "MASTER", -- MASTER, SLAVE
-- SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
SRVAL_Q1 => '0',
SRVAL_Q2 => '0',
SRVAL_Q3 => '0',
SRVAL_Q4 => '0'
)
port map (
O => IntBitClk, -- 1-bit output: Combinatorial output
-- Q1 - Q8: 1-bit (each) output: Registered data outputs
Q1 => IntClkCtrlOut(0),
Q2 => IntClkCtrlOut(1),
Q3 => IntClkCtrlOut(2),
Q4 => IntClkCtrlOut(3),
Q5 => IntClkCtrlOut(4),
Q6 => IntClkCtrlOut(5),
Q7 => IntClkCtrlOut(6),
Q8 => IntClkCtrlOut(7),
-- SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
SHIFTOUT1 => open,
SHIFTOUT2 => open,
BITSLIP => '0', -- 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
-- CLKDIV when asserted (active High). Subsequently, the data seen on the
-- Q1 to Q8 output ports will shift, as in a barrel-shifter operation, one
-- position every time Bitslip is invoked (DDR operation is different from
-- SDR).
-- CE1, CE2: 1-bit (each) input: Data register clock enable inputs
CE1 => BitClkEna,
CE2 => '0',
CLKDIVP => '0', -- 1-bit input: TBD
-- Clocks: 1-bit (each) input: ISERDESE2 clock input ports
CLK => BitClk_MonClkIn, -- 1-bit input: High-speed clock
CLKB => '0', -- 1-bit input: High-speed secondary clock
CLKDIV => BitClk_RefClkIn, -- 1-bit input: Divided clock
OCLK => '0', -- 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
-- Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
DYNCLKDIVSEL => '0', -- 1-bit input: Dynamic CLKDIV inversion
DYNCLKSEL => '0', -- 1-bit input: Dynamic CLK/CLKB inversion
-- Input Data: 1-bit (each) input: ISERDESE2 data input ports
D => BitClk, -- 1-bit input: Data input
DDLY => IntBitClk_Ddly, -- 1-bit input: Serial data from IDELAYE2
OFB => '0', -- 1-bit input: Data feedback from OSERDESE2
OCLKB => '0', -- 1-bit input: High speed negative edge output clock
RST => IntBitClkRst, -- 1-bit input: Active high asynchronous reset
-- SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
SHIFTIN1 => '0',
SHIFTIN2 => '0'
);

BUFIO_inst_AdcClock : BUFIO
port map (
O => BitClk_MonClkOut, -- 1-bit output: Clock output (connect to I/O clock loads).
I => IntBitClk -- 1-bit input: Clock input (connect to an IBUF or BUFMR).
);

BUFR_inst_IntBitClk : BUFR
generic map (
BUFR_DIVIDE => "7", -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
SIM_DEVICE => "7SERIES" -- Must be set to "7SERIES"
)
port map (
O => BitClk_RefClkOut, -- 1-bit output: Clock output port
CE => '1', -- 1-bit input: Active high, clock enable (Divided modes only)
CLR => '0', -- 1-bit input: Active high, asynchronous clear (Divided modes only)
I => IntBitClk -- 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
);

IntBitClkRst <= BitClkRst or BitClkReSync;

adcclkp: AdcClockProcess 
  Port map(IntBitClkRst => IntBitClkRst,
        BitClkEna => BitClkEna,
        IntClkCtrlOut       => IntClkCtrlOut,
        BitClk_RefClkIn      => BitClk_RefClkIn,
        BitClkAlignWarn      => BitClkAlignWarn,
        BitClkInvrtd         => BitClkInvrtd,
        IntClkCtrlDlyInc     => IntClkCtrlDlyInc,
        IntClkCtrlDlyCe      => IntClkCtrlDlyCe,
        BitClkDone           => BitClkDone  
   );
             
end Behavioral;
