----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.11.2023 22:52:00
-- Design Name: 
-- Module Name: adcClock_FclkFrm - Behavioral
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

entity adcClock_FclkFrm is
  Port (FCLK_n                 : in std_logic; 
        FCLK_p                 : in std_logic;
        DClk_p                 : in std_logic;
        DCLK_n                 : in std_logic;
        Data_n                 : in std_logic;
        Data_p                 : in std_logic;
        AdcReSync   	       : in std_logic;
        AdcIntrfcRst           : in std_logic;
        AdcIntrfcEna           : in std_logic;
        IntRst                 : out std_logic;
        FrmClkEna_out          : out std_logic;
        FrmClkMsbRegEna	       : out std_logic;
        FrmClkLsbRegEna	       : out std_logic;
        FrmClkSwapMux	       : out std_logic;
        FrmClkReSyncOut        : out std_logic;
        FrmClkSyncWarn	       : out std_logic;
        AdcBitClkAlgnWrn       : out std_logic;
        AdcBitClkInvrld        : out std_logic;
        FrmClkDat		       : out std_logic_vector(15 downto 0);
        dataOut                : out std_logic_vector(13 downto 0);
        BitClkDone             : out std_logic
         );
end adcClock_FclkFrm;

architecture Behavioral of adcClock_FclkFrm is

component Adc_FDPE is
  Port (AdcIntrfcRst        : in std_logic;
        FrmClkDiv           : in std_logic;
        AdcIntrfcEna        : in std_logic;
        FrmClkEna           : out std_logic;
        IntRst              : out std_logic
         );
end component;


component AdcClock is
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
end  component;

component  FCLK_ADC is
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
end component;

component  AdcDataDone is
    Port ( DatDone    : in std_logic;
           IntDatDone : out STD_LOGIC;
           DatRst : in STD_LOGIC;
           DatClkDiv : in STD_LOGIC;
           DatEna : in STD_LOGIC;
           IntDatEna : out STD_LOGIC);
end  component;

component iserdes_adc is
  Port (DatBitSlip_p      : in std_logic;
        DatBitSlip_n      : in std_logic;
        IntDatDone        : in std_logic;
        DatClk            : in std_logic;
        DatClkDiv         : in std_logic;
        ADCDATAPInt       : in std_logic;
        DatRst            : in std_logic;
        ADCDATANInt       : in std_logic;
        DatOut            : out std_logic_vector(13 downto 0) );
end component;

component Dat_Iserdes_Out is
  Port (  DatOutIn           : in  std_logic_vector(13 downto 0);
          DatClkDiv          : in  std_logic;
          IntDatEna          : in  std_logic;
          DatReSync          : in  std_logic;
          DatSwapMux         : in  std_logic;
          AdcData            : out std_logic_vector(13 downto 0) );
end component;

signal BitClk_MonClkIn            : std_logic;
signal BitClk_RefClkIn            : std_logic;
signal BitClkDone_int             : std_logic;
signal FrmClkEna_int              : std_logic;
signal IntRst_Int                 : std_logic;
signal FrmClkBitSlip_n	          : std_logic;
signal FrmClkBitSlip_p	          : std_logic;
signal IntDatDone                 : std_logic;          

signal DCLK_p_Int                 : std_logic;
signal IntDatEna                  : std_logic;
signal dataOutIn                  : std_logic_vector(13 downto 0);
signal FrmClkReSyncOutInt         : std_logic;
signal FrmClkSwapMuxInt           : std_logic; 
begin

FrmClkReSyncOut <= FrmClkReSyncOutInt;
FrmClkSwapMux   <= FrmClkSwapMuxInt;
BitClkDone     <= BitClkDone_int;
FrmClkEna_out  <= FrmClkEna_int; 
IntRst         <= IntRst_Int;

IBUFGDS_inst : IBUFGDS
generic map (
DIFF_TERM => FALSE, -- Differential Termination
IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
IOSTANDARD => "DEFAULT")
port map (
O => Dclk_p_int, -- Clock buffer output
I => Dclk_p, -- Diff_p clock buffer input (connect directly to top-level port)
IB => Dclk_n -- Diff_n clock buffer input (connect directly to top-level port)
);


adc_F: Adc_FDPE 
  Port map(AdcIntrfcRst        => AdcIntrfcRst,
        FrmClkDiv              => BitClk_RefClkIn,
        AdcIntrfcEna           => AdcIntrfcEna,
        FrmClkEna              => FrmClkEna_int,
        IntRst                 => IntRst_Int
         );
         

adc: AdcClock 
  Port map(BitClk              => DClk_p_int,
        BitClkRst              => IntRst_Int,
        BitClkEna              => FrmClkEna_int, 
        BitClkReSync           => AdcReSync,
        BitClk_MonClkIn        => BitClk_MonClkIn,
        BitClk_RefClkIn        => BitClk_RefClkIn,
        BitClkAlignWarn        => AdcBitClkAlgnWrn,
        BitClk_MonClkOut       => BitClk_MonClkIn,
        BitClk_RefClkOut       => BitClk_RefClkIn,
        BitClkInvrtd           => AdcBitClkInvrld,
        BitClkDone             => BitclkDone_int
   );


fclk: FCLK_ADC 
  Port map (FCLK_n             => FCLK_n, 
        FCLK_p                 => FCLK_p,
        FrmClk                 => BitClk_MonClkIn,
        FrmClkEna		       => FrmClkEna_int,
        FrmClkRst		       => IntRst_Int,
        FrmClkReSync	       => AdcReSync,
        FrmClkDone		       => BitClkDone_int,
        FrmClkDiv              => BitClk_RefClkIn,
        FrmClkMsbRegEna	       => FrmClkMsbRegEna,
        FrmClkLsbRegEna	       => FrmClkLsbRegEna,
        FrmClkBitSlip_p	       => FrmClkBitSlip_p,
        FrmClkSwapMux	       => FrmClkSwapMuxInt,
        FrmClkReSyncOut        => FrmClkReSyncOutInt,
		FrmClkDat		       => FrmClkDat,
		FrmClkSyncWarn	       => FrmClkSyncWarn,
        FrmClkBitSlip_n	       => FrmClkBitSlip_n
         
        );
        
adcdone: AdcDataDone 
    Port map( DatDone    => BitClkDone_int,
           IntDatDone    => IntDatDone,
           DatRst        => IntRst_Int,
           DatClkDiv     => BitClk_RefClkIn,
           DatEna        => FrmClkEna_int,
           IntDatEna     => IntDatEna);
       
        
 iserdes_dat_in:       iserdes_adc 
  Port map(DatBitSlip_p      => FrmClkBitSlip_n,
        DatBitSlip_n         => FrmClkBitSlip_p,
        IntDatDone           => IntDatDone,
        DatClk               => BitClk_MonClkIn,
        DatClkDiv            => BitClk_RefClkIn,
        ADCDATAPInt          => data_p,
        DatRst               => IntRst_Int,
        ADCDATANInt          => data_n,
        DatOut               => dataOutIn );

D:Dat_Iserdes_Out 
  Port map(  DatOutIn        => dataOutIn,
          DatClkDiv          => BitClk_RefClkIn,
          IntDatEna          => IntDatEna,
          DatReSync          => FrmClkReSyncOutInt,
          DatSwapMux         => FrmClkSwapMuxInt,
          AdcData            => dataOut );

        
end Behavioral;
