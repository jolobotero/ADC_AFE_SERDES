----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2023 16:07:06
-- Design Name: 
-- Module Name: iserdes_adc - Behavioral
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

entity iserdes_adc is
  Port (DatBitSlip_p      : in std_logic;
        DatBitSlip_n      : in std_logic;
        IntDatDone        : in std_logic;
        DatClk            : in std_logic;
        DatClkDiv         : in std_logic;
        ADCDATAPInt       : in std_logic;
        DatRst            : in std_logic;
        ADCDATANInt       : in std_logic;
        DatOut            : out std_logic_vector(13 downto 0) );
end iserdes_adc;

architecture Behavioral of iserdes_adc is
signal DatClk_not        : std_logic;
signal DatClkDiv_not        : std_logic;

begin

DatClk_not <= DatClk;
DatClkDiv_not <= DatClkDiv;


ISERDESE2_inst_D0_P : ISERDESE2
generic map (
DATA_RATE => "SDR", -- DDR, SDR
DATA_WIDTH => 7, -- Parallel data width (2-8,10,14)
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
Q1 => DatOut(12),
Q2 => DatOut(10),
Q3 => DatOut(8),
Q4 => DatOut(6),
Q5 => DatOut(4),
Q6 => DatOut(2),
Q7 => DatOut(0),
Q8 => open,
-- SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
SHIFTOUT1 => open,
SHIFTOUT2 => open,
BITSLIP => DatBitSlip_p, -- 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
-- CLKDIV when asserted (active High). Subsequently, the data seen on the
-- Q1 to Q8 output ports will shift, as in a barrel-shifter operation, one
-- position every time Bitslip is invoked (DDR operation is different from
-- SDR).
-- CE1, CE2: 1-bit (each) input: Data register clock enable inputs
CE1 => IntDatDone,
CE2 => '0',
CLKDIVP => '0', -- 1-bit input: TBD
-- Clocks: 1-bit (each) input: ISERDESE2 clock input ports
CLK => DatClk, -- 1-bit input: High-speed clock
CLKB => '0', -- 1-bit input: High-speed secondary clock
CLKDIV => DatClkDiv, -- 1-bit input: Divided clock
OCLK => '0', -- 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
-- Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
DYNCLKDIVSEL => '0', -- 1-bit input: Dynamic CLKDIV inversion
DYNCLKSEL => '0', -- 1-bit input: Dynamic CLK/CLKB inversion
-- Input Data: 1-bit (each) input: ISERDESE2 data input ports
D => ADCDATAPInt, -- 1-bit input: Data input
DDLY => '0', -- 1-bit input: Serial data from IDELAYE2
OFB => '0', -- 1-bit input: Data feedback from OSERDESE2
OCLKB => '0', -- 1-bit input: High speed negative edge output clock
RST => DatRst, -- 1-bit input: Active high asynchronous reset
-- SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
SHIFTIN1 => '0',
SHIFTIN2 => '0'
);


ISERDESE2_inst_D0_n : ISERDESE2
generic map (
DATA_RATE => "SDR", -- DDR, SDR
DATA_WIDTH => 7, -- Parallel data width (2-8,10,14)
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
SRVAL_Q4 => '0',
IS_CLK_INVERTED => '1'
)
port map (
O => open, -- 1-bit output: Combinatorial output
-- Q1 - Q8: 1-bit (each) output: Registered data outputs
Q1 => DatOut(13),
Q2 => DatOut(11),
Q3 => DatOut(9),
Q4 => DatOut(7),
Q5 => DatOut(5),
Q6 => DatOut(3),
Q7 => DatOut(1),
Q8 => open,
-- SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
SHIFTOUT1 => open,
SHIFTOUT2 => open,
BITSLIP => DatBitSlip_n, -- 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
-- CLKDIV when asserted (active High). Subsequently, the data seen on the
-- Q1 to Q8 output ports will shift, as in a barrel-shifter operation, one
-- position every time Bitslip is invoked (DDR operation is different from
-- SDR).
-- CE1, CE2: 1-bit (each) input: Data register clock enable inputs
CE1 => IntDatDone,
CE2 => '0',
CLKDIVP => '0',
-- Clocks: 1-bit (each) input: ISERDESE2 clock input ports
CLK => DatClk_not, -- 1-bit input: High-speed clock
CLKB => '0', -- 1-bit input: High-speed secondary clock
CLKDIV => DatClkDiv_not, -- 1-bit input: Divided clock
OCLK => '0', -- 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
-- Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
DYNCLKDIVSEL => '0', -- 1-bit input: Dynamic CLKDIV inversion
DYNCLKSEL => '0', -- 1-bit input: Dynamic CLK/CLKB inversion
-- Input Data: 1-bit (each) input: ISERDESE2 data input ports
D => ADCDATANInt , -- 1-bit input: Data input
DDLY => '0', -- 1-bit input: Serial data from IDELAYE2
OFB => '0', -- 1-bit input: Data feedback from OSERDESE2
OCLKB => '0', -- 1-bit input: High speed negative edge output clock
RST => DatRST, -- 1-bit input: Active high asynchronous reset
-- SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
SHIFTIN1 => '0',
SHIFTIN2 => '0'
);



end Behavioral;
