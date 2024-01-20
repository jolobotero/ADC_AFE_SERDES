----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2023 18:55:35
-- Design Name: 
-- Module Name: FCLK_ADC - Behavioral
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

entity FCLK_ADC is
  Port (FCLK_n                 : in std_logic; 
        FCLK_p                 : in std_logic;
        FrmClk                 : in std_logic;
        FrmClkEna		       : in std_logic;
        FrmClkRst		       : in std_logic;
        FrmClkReSync	       : in std_logic;
        FrmClkDone		       : in std_logic;
        FrmClkDiv              : in std_logic;
        FrmClkMsbRegEna	       : out std_logic;
        FrmClkLsbRegEna	       : out std_logic;
        FrmClkBitSlip_p	       : out std_logic;
        FrmClkSwapMux	       : out std_logic;
        FrmClkReSyncOut        : out std_logic;
		FrmClkDat		       : out std_logic_vector(15 downto 0);
		FrmClkSyncWarn	       : out std_logic;
        FrmClkBitSlip_n	       : out std_logic
         
        );
end FCLK_ADC;

architecture Behavioral of FCLK_ADC is


component FclkCntEqu is
    Port (clock         : in std_logic;
          RstIn         : in std_logic;
          DataIn        : in std_logic_vector(3 downto 0);
          DataOut       : out std_logic_vector(3 downto 0); 
          final         : out std_logic );
end component;

component  FCLKSrdsReg is
  Port (IntFrmSrdsDatOdd_d     : in std_logic_vector(3 downto 0);
        IntFrmSrdsDatEvn_d     : in std_logic_vector(3 downto 0);
        IntFrmDbleNibFnlOdd_d  : in std_logic;
        IntFrmDbleNibFnlEvn_d  : in std_logic;
        FrmClkEna		       : in std_logic;
        FrmClkDiv              : in std_logic;
        FrmClkRst              : in std_logic;
        FrmClkReSync	       : in std_logic;
        FrmClkDone	           : in std_logic;
        FrmClkBitSlip_p	       : out std_logic;
        FrmClkBitSlip_n	       : out std_logic;
        FrmClkMsbRegEna	       : out std_logic;
        FrmClkLsbRegEna	       : out std_logic;
        FrmClkSwapMux	       : out std_logic;
        FrmClkReSyncOut	       : out std_logic;
        FrmClkSyncWarn	       : out std_logic;
        IntFrmEnaOut           : out std_logic;
        FrmClkDat		       : out std_logic_vector(15 downto 0)  );
end component;


signal IntFCLK_p        : std_logic; 
signal IntFCLK_n        : std_logic; 
signal IntFrmSrdsDatEvn   : std_logic_vector(3 downto 0);
signal IntFrmSrdsDatOdd   : std_logic_vector(3 downto 0);

signal IntFrmBitSlip    : std_logic_vector(5 downto 0);
signal IntFrmEna        : std_logic;
signal IntFrmCLK        : std_logic;
signal IntFrmClkRst     : std_logic;

signal IntFrmSrdsDatOdd_d   : std_logic_vector(3 downto 0);
signal IntFrmSrdsDatEvn_d   : std_logic_vector(3 downto 0);

signal IntFrmDbleNibFnlEvn          : std_logic;
signal IntFrmDbleNibFnlEvn_d        : std_logic;
signal IntFrmDbleNibFnlOdd          : std_logic;
signal IntFrmDbleNibFnlOdd_d        : std_logic;

begin


IBUFDS_DIFF_OUT_FCLK : IBUFDS_DIFF_OUT
generic map (
DIFF_TERM => FALSE, -- Differential Termination
IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
IOSTANDARD => "DEFAULT" -- Specify the input I/O standard
)
port map (
O => IntFCLK_p, -- Buffer diff_p output
OB => IntFCLK_n, -- Buffer diff_n output
I => FCLK_p, -- Diff_p buffer input (connect directly to top-level port)
IB => FCLK_n -- Diff_n buffer input (connect directly to top-level port)
);

-------------------------------------------------------------------
-------------------------------------------------------------------
IntFrmClk <= FrmClk;


ISERDESE2_inst_FCLK_P : ISERDESE2
generic map (
DATA_RATE => "SDR", -- DDR, SDR
DATA_WIDTH => 4, -- Parallel data width (2-8,10,14)
DYN_CLKDIV_INV_EN => "FALSE", -- Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
DYN_CLK_INV_EN => "FALSE", -- Enable DYNCLKINVSEL inversion (FALSE, TRUE)
-- INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
INIT_Q1 => '0',
INIT_Q2 => '0',
INIT_Q3 => '0',
INIT_Q4 => '0',
INTERFACE_TYPE => "NETWORKING", -- MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
IOBDELAY => "NONE", -- NONE, BOTH, IBUF, IFD
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
O => open, -- 1-bit output: Combinatorial output
-- Q1 - Q8: 1-bit (each) output: Registered data outputs
Q1 => IntFrmSrdsDatEvn(3),
Q2 => IntFrmSrdsDatEvn(2),
Q3 => IntFrmSrdsDatEvn(1),
Q4 => IntFrmSrdsDatEvn(0),
Q5 => open,
Q6 => open,
Q7 => open,
Q8 => open,
-- SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
SHIFTOUT1 => open,
SHIFTOUT2 => open,
BITSLIP => IntFrmBitSlip(0), -- 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
-- CLKDIV when asserted (active High). Subsequently, the data seen on the
-- Q1 to Q8 output ports will shift, as in a barrel-shifter operation, one
-- position every time Bitslip is invoked (DDR operation is different from
-- SDR).
-- CE1, CE2: 1-bit (each) input: Data register clock enable inputs
CE1 => IntFrmEna,
CE2 => '0',
CLKDIVP => '0', -- 1-bit input: TBD
-- Clocks: 1-bit (each) input: ISERDESE2 clock input ports
CLK => IntFrmClk, -- 1-bit input: High-speed clock
CLKB => '0', -- 1-bit input: High-speed secondary clock
CLKDIV => FrmClkDiv, -- 1-bit input: Divided clock
OCLK => '0', -- 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
-- Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
DYNCLKDIVSEL => '0', -- 1-bit input: Dynamic CLKDIV inversion
DYNCLKSEL => '0', -- 1-bit input: Dynamic CLK/CLKB inversion
-- Input Data: 1-bit (each) input: ISERDESE2 data input ports
D => IntFCLK_p, -- 1-bit input: Data input
DDLY => '0', -- 1-bit input: Serial data from IDELAYE2
OFB => '0', -- 1-bit input: Data feedback from OSERDESE2
OCLKB => '0', -- 1-bit input: High speed negative edge output clock
RST => IntFrmClkRst, -- 1-bit input: Active high asynchronous reset
-- SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
SHIFTIN1 => '0',
SHIFTIN2 => '0'
);


ISERDESE2_inst_FCLK_N : ISERDESE2
generic map (
DATA_RATE => "SDR", -- DDR, SDR
DATA_WIDTH => 4, -- Parallel data width (2-8,10,14)
DYN_CLKDIV_INV_EN => "FALSE", -- Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
DYN_CLK_INV_EN => "FALSE", -- Enable DYNCLKINVSEL inversion (FALSE, TRUE)
-- INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
INIT_Q1 => '0',
INIT_Q2 => '0',
INIT_Q3 => '0',
INIT_Q4 => '0',
INTERFACE_TYPE => "NETWORKING", -- MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
IOBDELAY => "NONE", -- NONE, BOTH, IBUF, IFD
NUM_CE => 1, -- Number of clock enables (1,2)
OFB_USED => "FALSE", -- Select OFB path (FALSE, TRUE)
SERDES_MODE => "MASTER", -- MASTER, SLAVE
-- SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
IS_CLK_INVERTED     => '1',
SRVAL_Q1 => '0',
SRVAL_Q2 => '0',
SRVAL_Q3 => '0',
SRVAL_Q4 => '0'
)
port map (
O => open, -- 1-bit output: Combinatorial output
-- Q1 - Q8: 1-bit (each) output: Registered data outputs
Q1 => IntFrmSrdsDatOdd(3),
Q2 => IntFrmSrdsDatOdd(2),
Q3 => IntFrmSrdsDatOdd(1),
Q4 => IntFrmSrdsDatOdd(0),
Q5 => open,
Q6 => open,
Q7 => open,
Q8 => open,
-- SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
SHIFTOUT1 => open,
SHIFTOUT2 => open,
BITSLIP => IntFrmBitSlip(1), -- 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
-- CLKDIV when asserted (active High). Subsequently, the data seen on the
-- Q1 to Q8 output ports will shift, as in a barrel-shifter operation, one
-- position every time Bitslip is invoked (DDR operation is different from
-- SDR).
-- CE1, CE2: 1-bit (each) input: Data register clock enable inputs
CE1 => IntFrmEna,
CE2 => '0',
CLKDIVP => '0', -- 1-bit input: TBD
-- Clocks: 1-bit (each) input: ISERDESE2 clock input ports
CLK => IntFrmClk, -- 1-bit input: High-speed clock
CLKB => '0', -- 1-bit input: High-speed secondary clock
CLKDIV => FrmClkDiv, -- 1-bit input: Divided clock
OCLK => '0', -- 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
-- Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
DYNCLKDIVSEL => '0', -- 1-bit input: Dynamic CLKDIV inversion
DYNCLKSEL => '0', -- 1-bit input: Dynamic CLK/CLKB inversion
-- Input Data: 1-bit (each) input: ISERDESE2 data input ports
D => IntFCLK_n, -- 1-bit input: Data input
DDLY => '0', -- 1-bit input: Serial data from IDELAYE2
OFB => '0', -- 1-bit input: Data feedback from OSERDESE2
OCLKB => '0', -- 1-bit input: High speed negative edge output clock
RST => IntFrmClkRst, -- 1-bit input: Active high asynchronous reset
-- SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
SHIFTIN1 => '0',
SHIFTIN2 => '0'
);
-- End of ISERDESE2_inst instantiation

FCLK_EVN: FclkCntEqu 
    Port map (clock => FrmClkDiv,
          RstIn     => IntFrmClkRst,
          DataIn    => IntFrmSrdsDatEvn,
          DataOut   => IntFrmSrdsDatEvn_d, 
          final     => IntFrmDbleNibFnlEvn );

FCLK_ODD: FclkCntEqu 
    Port map (clock => FrmClkDiv,
          RstIn     => IntFrmClkRst,
          DataIn    => IntFrmSrdsDatOdd,
          DataOut   => IntFrmSrdsDatOdd_d, 
          final     => IntFrmDbleNibFnlOdd );
          
process(FrmClkDiv, IntFrmClkRst)
begin
   if (IntFrmClkRst = '1') then  
      IntFrmDbleNibFnlOdd_d <= '0';
      IntFrmDbleNibFnlEvn_d <= '0';
   elsif (rising_edge(FrmClkDiv)) then
      IntFrmDbleNibFnlOdd_d <= IntFrmDbleNibFnlOdd;
      IntFrmDbleNibFnlEvn_d <= IntFrmDbleNibFnlEvn;
   end if;   
end process;   
                   

ADCFrame: FCLKSrdsReg 
  Port map(IntFrmSrdsDatOdd_d    => IntFrmSrdsDatOdd_d,
        IntFrmSrdsDatEvn_d       => IntFrmSrdsDatEvn_d,
        IntFrmDbleNibFnlOdd_d    => IntFrmDbleNibFnlOdd_d,
        IntFrmDbleNibFnlEvn_d    => IntFrmDbleNibFnlEvn_d,
        FrmClkEna		         => FrmClkEna,
        FrmClkDiv                => FrmClkDiv,
        FrmClkRst                => FrmClkRst,
        FrmClkReSync	         => FrmClkReSync,
        FrmClkDone	             => FrmClkDone,
        FrmClkBitSlip_p	         => FrmClkBitSlip_p,
        FrmClkBitSlip_n	         => FrmClkBitSlip_n,
        FrmClkMsbRegEna	         => FrmClkMsbRegEna,
        FrmClkLsbRegEna	         => FrmClkLsbRegEna,
        FrmClkSwapMux	         => FrmClkSwapMux,
        FrmClkReSyncOut	         => FrmClkReSyncOut,
        FrmClkSyncWarn	         => FrmClkSyncWarn,
        IntFrmEnaOut             => IntFrmEna,
        FrmClkDat		         => FrmClkDat );




end Behavioral;
