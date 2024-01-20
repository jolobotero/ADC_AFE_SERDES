----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2023 10:56:31
-- Design Name: 
-- Module Name: iserdes_1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity iserdes_1 is
--  Port ( );
end iserdes_1;

architecture Behavioral of iserdes_1 is

component adcClock_FclkFrm is
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
end component;

signal FCLK_n                  : std_logic := '0'; 
signal FCLK_p                  : std_logic := '1';
signal DClk_p                  : std_logic := '1';
signal DCLK_n                  : std_logic := '0';
signal Data_n                  : std_logic := '1';
signal Data_p                  : std_logic := '0';
signal AdcReSync     	       : std_logic := '0';
signal AdcIntrfcRst            : std_logic := '1';
signal AdcIntrfcEna            : std_logic := '0';
signal IntRst                  : std_logic;
signal FrmClkEna_out           : std_logic;
signal FrmClkMsbRegEna	       : std_logic;
signal FrmClkLsbRegEna	       : std_logic;
signal FrmClkSwapMux	       : std_logic;
signal FrmClkReSyncOut         : std_logic;
signal FrmClkSyncWarn	       : std_logic;
signal AdcBitClkAlgnWrn        : std_logic;
signal AdcBitClkInvrld         : std_logic;
signal FrmClkDat		       : std_logic_vector(15 downto 0);
signal dataOut                 : std_logic_vector(13 downto 0):= "00000000000000";
signal BitClkDone              : std_logic;


begin

d:adcClock_FclkFrm 
  Port map(FCLK_n         => FCLK_n, 
        FCLK_p            => FCLK_p,             
        DClk_p            => DClk_p,             
        DCLK_n            => DCLK_n,             
        Data_n            => Data_n,             
        Data_p            => Data_p,            
        AdcReSync         => AdcReSync,   	    
        AdcIntrfcRst      => AdcIntrfcRst,      
        AdcIntrfcEna      => AdcIntrfcEna,      
        IntRst            => IntRst,            
        FrmClkEna_out     => FrmClkEna_out,     
        FrmClkMsbRegEna	  => FrmClkMsbRegEna,   
        FrmClkLsbRegEna   => FrmClkLsbRegEna,	
        FrmClkSwapMux     => FrmClkSwapMux,	    
        FrmClkReSyncOut   => FrmClkReSyncOut,   
        FrmClkSyncWarn    => FrmClkSyncWarn,	
        AdcBitClkAlgnWrn  => AdcBitClkAlgnWrn,
        AdcBitClkInvrld   => AdcBitClkInvrld,
        FrmClkDat		  => FrmClkDat,
        dataOut           => dataOut,  
        BitClkDone        => BitClkDone
         );
FCLK_p <= not FCLK_p after 7 ns;
FCLK_n <= not FCLK_p;

DCLK_p <= not DCLK_p after 1 ns;
DCLK_n <= not DCLK_p;

estimulos:process
begin
AdcReSync <= '0';
AdcIntrfcRst <= '1';
AdcIntrfcEna <= '0';
DATA_P <= '1';
DATA_n <= '0';

wait for 28 ns;

AdcIntrfcRst <= '0';
AdcIntrfcEna <= '1';

while(BitClkDone= '0') loop
 
      wait for 14 ns;
  end loop;    

wait for 280 ns;

data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 13 ns;
wait for 140 ns;

------------------------------------------------- 1
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 2
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 3
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 4
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 5
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 6
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 7
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 8
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 9
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 10
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 11
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 12
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 13
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;


------------------------------------------------- 14
data_p <= '0';
data_n <= '1';

wait for 1 ns;

data_p <= '1';
data_n <= '0';

wait for 14 ns;
wait for 1 ns;

wait for 139 ns;


END PROCESS;





end Behavioral;
