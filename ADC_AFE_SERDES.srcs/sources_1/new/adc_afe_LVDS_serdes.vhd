----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.09.2023 17:09:32
-- Design Name: 
-- Module Name: adc_afe_LVDS_serdes - Behavioral
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

entity adc_afe_LVDS_serdes is
  Port (--RST      :in std_logic;
        DatClk           :in std_logic;
  
        DatClkDiv        : in std_logic;
        DatRst           : in std_logic;
        DatDone          : in std_logic;
        DatEna           : in std_logic;
        DatReSync        : in STD_LOGIC;
        DatSwapMux	   	 : in std_logic;
        
        C_adcMsbOrLsbFst : in std_logic; -- 0 MSB firts, 1 -- LSB firts
        
        DatBitSlip_p     : in std_logic;
        DatBitSlip_n     : in std_logic;
        DatLsbRegEna     : in std_logic;
        DatMsbRegEna     : in std_logic;
        
        ADCDATAP : in std_logic;
        ADCDATAN : in std_logic;
        
        
                
        --DCLK_n   : in std_logic;
        --DCLK_p   : in std_logic;
        
        --DATARST  : in std_logic;
        DatOut        : out std_logic_vector(13 downto 0));
end adc_afe_LVDS_serdes;

architecture Behavioral of adc_afe_LVDS_serdes is

component  AdcDataDone is
    Port ( DatDone    : in std_logic;
           IntDatDone : out STD_LOGIC;
           DatRst : in STD_LOGIC;
           DatClkDiv : in STD_LOGIC;
           DatEna : in STD_LOGIC;
           IntDatEna : out STD_LOGIC);
end  component;

component   FDCE_ARRAYS is
  Port (IntDat         : out std_logic_vector(13 downto 0);
        DatClkDiv      : in std_logic;
        IntDatEna      : in std_logic;
        DatReSync      : in std_logic;
        IntDatSrds    : in std_logic_vector(13 downto 0)
        
         );
end  component;

component  DatBus is
    Port ( DatOut : in STD_LOGIC_VECTOR (13 downto 0);
           IntDatSrds : out STD_LOGIC_VECTOR (13 downto 0));
end  component;

component  DatMux is
    Port ( IntDatMux  : out STD_LOGIC_VECTOR (13 downto 0);
           DatSwapMux : in STD_LOGIC;
           IntDat     : in STD_LOGIC_VECTOR (13 downto 0));
end  component;

component  FdceReg is
    Port ( IntDatMux : in STD_LOGIC_VECTOR (13 downto 0);
           DatClkDiv : in STD_LOGIC;
           IntDatEna : in STD_LOGIC;
           DatReSync : in STD_LOGIC;
           IntDatSwp : out STD_LOGIC_VECTOR (13 downto 0));
end   component;

component  iserdes_adc is
  Port (DatBitSlip_p      : in std_logic;
        DatBitSlip_n      : in std_logic;
        IntDatDone        : in std_logic;
        DatClk            : in std_logic;
        DatClkDiv         : in std_logic;
        ADCDATAPInt       : in std_logic;
        DatRst            : in std_logic;
        ADCDATANInt       : in std_logic;
        DatOut            : out std_logic_vector(13 downto 0) );
end  component;


component GENERATE_OUT is
  Port (C_adcMsbOrLsbFst : in std_logic; 
        DatClkDiv        : in std_logic; 
        DatLsbRegEna     : in std_logic;  
        DatMsbRegEna     : in std_logic;  
        DatReSync        : in std_logic;
        IntDatSwp        : in std_logic_vector(13 downto 0);
        DatOut           : out std_logic_vector(13 downto 0)
      );
end component;


signal ADCDATAPInt       : std_logic;
signal ADCDATANInt       : std_logic;
signal DatOutInt         : std_logic_vector(13 downto 0);
signal IntDatSrds        : std_logic_vector(13 downto 0);
signal IntDat            : std_logic_vector(13 downto 0);
signal IntDatMux         : std_logic_vector(13 downto 0);
signal IntDatSwp         : std_logic_vector(13 downto 0);
signal IntDatDone        : std_logic; 
signal IntDatEna         : std_logic; 

--signal SHIFTOUT1S1       : std_logic;
--signal SHIFTOUT2S1       : std_logic;

--signal BitslipInt        : std_logic;
--signal DCLK_in1          : std_logic;

--signal CLKOUT0           : std_logic;
--signal CLK_1             : std_logic;  
--signal CLKB_int          : std_logic; 

--signal CLKOUT1_int      :  std_logic;
--signal DIVCLKOUT1_int      :  std_logic;






begin
-----------------------------------------------------------------------------------------------------------

IBUFDS_DIFF_OUT_inst : IBUFDS_DIFF_OUT
generic map (
DIFF_TERM => TRUE, -- Differential Termination
IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
IOSTANDARD => "DEFAULT") -- Specify the input I/O standard
--USE_IBUFDISABLE => "TRUE"
port map (
O => ADCDATAPInt, -- Buffer diff_p output
OB => open, -- Buffer diff_n output
I => ADCDATAP, -- Diff_p buffer input (connect directly to top-level port)
IB => ADCDATAN -- Diff_n buffer input (connect directly to top-level port)
);

IBUFDS_DIFF_OUT_inst_INV : IBUFDS_DIFF_OUT
generic map (
DIFF_TERM => TRUE, -- Differential Termination
IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
IOSTANDARD => "DEFAULT") -- Specify the input I/O standard
--USE_IBUFDISABLE => "TRUE"
port map (
O => ADCDATANInt, -- Buffer diff_p output
OB => open, -- Buffer diff_n output
I => ADCDATAN, -- Diff_p buffer input (connect directly to top-level port)
IB => ADCDATAP -- Diff_n buffer input (connect directly to top-level port)
);
--------------------------------------------------------------------------------------------------------------

adcDDOne: AdcDataDone 
    Port map( DatDone => DatDone,
           IntDatDone => IntDatDone,
           DatRst => DatRst,
           DatClkDiv => DatClkDiv,
           DatEna =>    DatEna,
           IntDatEna => IntDatEna);


iserdesadc: iserdes_adc 
  Port map(DatBitSlip_p => DatBitSlip_p,
        DatBitSlip_n    => DatBitSlip_n, 
        IntDatDone      => IntDatDone,
        DatClk          => DatClk,
        DatClkDiv       => DatClkDiv,
        ADCDATAPInt     => ADCDATAPInt,
        DatRst          => DatRst,
        ADCDATANInt     => ADCDATANInt,
        DatOut          => DatOutInt );




Mod_DatBus:DatBus 
    Port map( DatOut => DatOutInt,
           IntDatSrds => IntDatSrds
           );

               
sub_FDCE: FDCE_ARRAYS 
  Port map(IntDat => IntDat,
        DatClkDiv  => DatClkDiv,
        IntDatEna  => IntDatEna,
        DatReSync  => DatReSync,
        IntDatSrds => IntDatSrds
         );


MOdDatMux: DatMux 
    Port map ( IntDatMux => IntDatMux,
           DatSwapMux => DatSwapMux,
           IntDat => IntDat 
           );

mod_FDCE_REG: FdceReg 
    Port map( IntDatMux => IntDatMux,
           DatClkDiv => DatClkDiv,
           IntDatEna => IntDatEna,
           DatReSync => DatReSync,
           IntDatSwp => IntDatSwp
           );

Gen_output: GENERATE_OUT 
  Port map(C_adcMsbOrLsbFst => C_adcMsbOrLsbFst, 
        DatClkDiv           => DatClkDiv, 
        DatLsbRegEna        => DatLsbRegEna,  
        DatMsbRegEna        => DatMsbRegEna,  
        DatReSync           => DatReSync,
        IntDatSwp           => IntDatSwp,
        DatOut              => DatOut
      );

end Behavioral;
