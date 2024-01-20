----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2023 10:56:39
-- Design Name: 
-- Module Name: FCLKSrdsReg - Behavioral
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
use IEEE.std_logic_UNSIGNED.all;
Library UNISIM;
use UNISIM.vcomponents.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FCLKSrdsReg is
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
end FCLKSrdsReg;

architecture Behavioral of FCLKSrdsReg is

component FCLK_GenPulse is
  Port (Clk   : in std_logic; 
        Ena   : in std_logic;
        SigIn      : In std_logic; 
        SigOut     : out std_logic  );
end component;

signal IntFrmSrdsDat                : std_logic_vector(7 downto 0);
signal IntFrmDat	                : std_logic_vector(7 downto 0);
signal IntFrmDatMux                 : std_logic_vector(7 downto 0);
signal IntFrmDatSwpBus              : std_logic_vector(15 downto 0);
signal IntFrmDatSwp			        : std_logic_vector(7 downto 0);
signal IntFrmCmp		            : std_logic_vector(3 downto 0);
signal IntFrmEquGte			        : std_logic;
signal IntFrmMsbAllZero_d_Ena       : std_logic;
signal IntFrmEqu_d                  : std_logic;
signal IntFrmSwapMux_d		        : std_logic;
signal IntFrmMsbAllZero_d     	    : std_logic;
signal IntFrmLsbMsb_d               : std_logic;
signal IntFrmRegEna_d		        : std_logic;
signal IntFrmMsbRegEna_d	        : std_logic;
signal IntFrmLsbRegEna_d	        : std_logic;
signal IntFrmEquSet_d		        : std_Logic;
signal IntFrmBitSlip		        : std_logic_vector(5 downto 0);
signal IntFrmEvntCnt		        : std_logic_vector(3 downto 0); -- count event counter
signal IntFrmEvntCntTc_d	        : std_logic;
signal IntFrmEvntCntTc		        : std_logic;
signal IntFrmSlipCnt		        : std_logic_vector(4 downto 0); 
signal IntFrmSlipCntTc_d	        : std_logic;
signal IntFrmSlipCntTc		        : std_logic;
signal IntFrmSlipCntTc_d1           : std_logic;
signal IntFrmSlipCntTc_d2Ena        : std_logic;
signal IntFrmSlipCntTc_d2           : std_logic;
signal IntFrmWarnCnt		        : std_logic_vector(2 downto 0);
signal IntFrmWarnCntTc		        : std_logic;
signal IntFrmWarnCntTc_d	        : std_logic;
signal IntFrmClkReSync              : std_logic;
signal IntFrmReSyncOut  		    : std_logic;
signal IntFrmDbleNibFnl		        : std_logic;
signal IntFrmReSyncOut_d		    : std_logic;
signal IntFrmClkRst			        : std_logic;
signal IntFrmEna			        : std_logic;




begin


IntFrmDbleNibFnl <= IntFrmDbleNibFnlOdd_d and IntFrmDbleNibFnlEvn_d;

IntFrmSrdsDat(1) <= IntFrmSrdsDatOdd_d(0);
IntFrmSrdsDat(3) <= IntFrmSrdsDatOdd_d(1);
IntFrmSrdsDat(5) <= IntFrmSrdsDatOdd_d(2);
IntFrmSrdsDat(7) <= IntFrmSrdsDatOdd_d(3);

IntFrmSrdsDat(0) <= IntFrmSrdsDatEvn_d(0);
IntFrmSrdsDat(2) <= IntFrmSrdsDatEvn_d(1);
IntFrmSrdsDat(4) <= IntFrmSrdsDatEvn_d(2);
IntFrmSrdsDat(6) <= IntFrmSrdsDatEvn_d(3);

FDCE_inst_reg0 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDat(0), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmSrdsDat(0) -- Data input
);

FDCE_inst_reg1 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDat(1), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmSrdsDat(1) -- Data input
);

FDCE_inst_reg2 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDat(2), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmSrdsDat(2) -- Data input
);

FDCE_inst_reg3 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDat(3), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmSrdsDat(3) -- Data input
);

FDCE_inst_reg4 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDat(4), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmSrdsDat(4) -- Data input
);

FDCE_inst_reg5 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDat(5), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmSrdsDat(5) -- Data input
);

FDCE_inst_reg6 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDat(6), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmSrdsDat(6) -- Data input
);

FDCE_inst_reg7 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDat(7), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmSrdsDat(7) -- Data input
);

IntFrmDatMux(0) <= IntFrmDat(1) when IntFrmSwapMux_d = '1' else
                   IntFrmDat(0);
IntFrmDatMux(1) <= IntFrmDat(0) when IntFrmSwapMux_d = '1' else
                   IntFrmDat(1);
                   
IntFrmDatMux(2) <= IntFrmDat(3) when IntFrmSwapMux_d = '1' else
                   IntFrmDat(2);
IntFrmDatMux(3) <= IntFrmDat(2) when IntFrmSwapMux_d = '1' else
                   IntFrmDat(3);

IntFrmDatMux(4) <= IntFrmDat(5) when IntFrmSwapMux_d = '1' else
                   IntFrmDat(4);
IntFrmDatMux(5) <= IntFrmDat(4) when IntFrmSwapMux_d = '1' else
                   IntFrmDat(5);

IntFrmDatMux(6) <= IntFrmDat(7) when IntFrmSwapMux_d = '1' else
                   IntFrmDat(6);
IntFrmDatMux(7) <= IntFrmDat(6) when IntFrmSwapMux_d = '1' else
                   IntFrmDat(7);


FDCE_inst_reg2_0 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDatSwp(0), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatMux(0) -- Data input
);

FDCE_inst_reg2_1 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDatSwp(1), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatMux(1) -- Data input
);

FDCE_inst_reg2_2 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDatSwp(2), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatMux(2) -- Data input
);

FDCE_inst_reg2_3 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDatSwp(3), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatMux(3) -- Data input
);

FDCE_inst_reg2_4 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDatSwp(4), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatMux(4) -- Data input
);

FDCE_inst_reg2_5 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDatSwp(5), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatMux(5) -- Data input
);

FDCE_inst_reg2_6 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDatSwp(6), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatMux(6) -- Data input
);

FDCE_inst_reg2_7 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmDatSwp(7), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatMux(7) -- Data input
);


IntFrmDatSwpBus <= IntFrmDatSwp & IntFrmDatSwp;

---------------LSB-----------------------------------------------

FDCE_inst_FrmClkLsb0 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(0), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmLsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(0) -- Data input
);

FDCE_inst_FrmClkLsb1 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(1), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmLsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(1) -- Data input
);

FDCE_inst_FrmClkLsb2 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(2), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmLsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(2) -- Data input
);

FDCE_inst_FrmClkLsb3 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(3), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmLsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(3) -- Data input
);

FDCE_inst_FrmClkLsb4 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(4), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmLsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(4) -- Data input
);

FDCE_inst_FrmClkLsb5 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(5), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmLsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(5) -- Data input
);

FDCE_inst_FrmClkLsb6 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(6), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmLsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(6) -- Data input
);

FDCE_inst_FrmClkLsb7 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(7), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmLsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(7) -- Data input
);

------------------- MSB 

FDCE_inst_FrmClkMsb8 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(8), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(8) -- Data input
);

FDCE_inst_FrmClkMsb9 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(9), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(9) -- Data input
);

FDCE_inst_FrmClkMsb10 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(10), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(10) -- Data input
);

FDCE_inst_FrmClkMsb11 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(11), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(11) -- Data input
);

FDCE_inst_FrmClkMsb12 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(12), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(12) -- Data input
);

FDCE_inst_FrmClkMsb13 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(13), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(13) -- Data input
);

FDCE_inst_FrmClkMsb14 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(14), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(14) -- Data input
);

FDCE_inst_FrmClkMsb15 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkDat(15), -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbRegEna_d, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmDatSwpBus(15) -- Data input
);

IntFrmCmp <= "0101" when IntFrmSrdsDat = "11111110" else
             "0100" when IntFrmSrdsDat = "00000001" else
             "0111" when IntFrmSrdsDat = "11111101" else
             "0110" when IntFrmSrdsDat = "00000010" else
             "0000";


IntFrmEquGte <= IntFrmCmp(2) and IntFrmEna;
IntFrmMsbAllZero_d_Ena <= IntFrmCmp(2) and not IntFrmEqu_d;

FDCE_inst_FRMALLZERO : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmMsbAllZero_d, -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbAllZero_d_Ena, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmCmp(3) -- Data input
);


FDCE_inst_FrmEqu_d : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmEqu_d, -- Data output
C => FrmClkDiv, -- Clock input
CE => '1', -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmEquGte -- Data input
);

FDCE_inst_FrmSwapMux_d : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmSwapMux_d, -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbAllZero_d_Ena, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmCmp(1) -- Data input
);

FDCE_inst_FrmLsbMsb_d : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmLsbMsb_d, -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmMsbAllZero_d_Ena, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmCmp(0) -- Data input
);

FrmClkSwapMux <= IntFrmSwapMux_d;


process(FrmClkDiv, IntFrmMsbAllZero_d, IntFrmEqu_d)
subtype IntFrmRegEnaCase is std_logic_vector(4 downto 0);
begin
   if(IntFrmMsbAllZero_d = '1') then
      IntFrmRegEna_d <= '0';
      IntFrmMsbRegEna_d <= '1';
      IntFrmLsbRegEna_d <= '1';
   elsif(rising_edge(FrmClkDiv)) then
      case IntFrmregEnaCase'(IntFrmLsbMsb_d, IntFrmEqu_d, IntFrmRegEna_d, IntFrmMsbRegEna_d, IntFrmLsbRegEna_d) is 
      
      when "00001" =>
          IntFrmRegEna_d <= '0';
          IntFrmMsbRegEna_d <= '0';
          IntFrmLsbRegEna_d <= '1';
          
      when "01001" =>
          IntFrmRegEna_d <= '1';
          IntFrmMsbRegEna_d <= '0';
          IntFrmLsbRegEna_d <= '1';
          
      when "01101" =>
          IntFrmRegEna_d <= '1';
          IntFrmMsbRegEna_d <= '1';
          IntFrmLsbRegEna_d <= '0';
          
      when "01110" =>
          IntFrmRegEna_d <= '1';
          IntFrmMsbRegEna_d <= '0';
          IntFrmLsbRegEna_d <= '1';
          
      when "11001" =>
          IntFrmRegEna_d <= '1';
          IntFrmMsbRegEna_d <= '1';
          IntFrmLsbRegEna_d <= '0';
          
      when "11110" =>
          IntFrmRegEna_d <= '1';
          IntFrmMsbRegEna_d <= '0';
          IntFrmLsbRegEna_d <= '1';
          
      when "11101" =>
          IntFrmRegEna_d <= '1';
          IntFrmMsbRegEna_d <= '1';
          IntFrmLsbRegEna_d <= '0';
          
      when others =>
          IntFrmRegEna_d <= '0';
          IntFrmMsbRegEna_d <= '0';
          IntFrmLsbRegEna_d <= '1';
       
      end case;
  end if;
end process;          

FrmClkMsbRegEna <= IntFrmMsbRegEna_d;
FrmClkLsbRegEna <= IntFrmLsbRegEna_d; 

IntFrmEquSet_d <= IntFrmBitSlip(4);      
IntFrmEvntCntTc <= '1' when (IntFrmEvntCnt = "1110") else
                   '0';

process(FrmClkDiv, IntFrmClkRst, IntFrmEquSet_d, IntFrmEna) 
begin
    if (IntFrmClkRst = '1') then 
       IntFrmEvntCnt <= (others => '0');
       IntFrmEvntCntTc_d <= '0';
    elsif(rising_edge(FrmClkDiv)) then
       if(IntFrmEquSet_d = '0' and IntFrmEna = '1') then
          IntFrmEvntCnt <= IntFrmEvntCnt + "01";
          IntFrmEvntCntTc_d <= IntFrmEvntCntTc;
       end if;
    end if;
end process;                       

process(FrmClkDiv, IntFrmClkRst, IntFrmEvntCntTc_d, IntFrmSlipCntTc)
begin
   if(IntFrmClkRst = '1' ) then
      IntFrmSlipCnt <= (others => '0');
      IntFrmSlipCntTc_d <= '0';
   elsif (rising_edge(FrmClkDiv)) then
      if(IntFrmEvntCntTc_d = '1') then
         IntFrmSlipCnt <= IntFrmSlipCnt + "01";
      end if;
      IntFrmSlipCntTc_d <= IntFrmSlipCntTc;
   end if;
end process;

IntFrmSlipCntTc <= '1' when (IntFrmSlipCnt = "10000") else
                 '0';

FDCE_inst_SlipCntTc_1 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmSlipCntTc_d1, -- Data output
C => FrmClkDiv, -- Clock input
CE => IntFrmSlipCntTc_d, -- Clock enable input
CLR => IntFrmSlipCntTc_d2, -- Asynchronous clear input
D => '1' -- Data input
);                 
  
IntFrmSlipCntTc_d2Ena <= IntFrmSlipCntTc_d and IntFrmslipCntTc_d1; 

 FDCE_inst_SlipCntTc_2 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmslipCntTc_d2, -- Data output
C => FrmClkDiv, -- Clock input
CE => '1', -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => IntFrmSlipCntTc_d2Ena -- Data input
);


process(FrmClkDiv, IntFrmClkRst)
begin
    if(IntFrmClkRst = '1') then
       IntFrmWarnCnt <= (others => '0');
       IntFrmWarnCntTc_d <= '0';
    elsif (rising_edge(FrmClkDiv)) then
       if (IntFrmSlipCntTc_d = '1') then
           IntFrmWarnCnt <= IntFrmWarnCnt + "01";
           IntFrmWarnCntTc_d <= IntFrmWarnCntTc;
       end if;
    end if;
end process;  

IntFrmWarnCntTc <= '1' when IntFrmWarnCnt = "110" else
                   '0';            
FrmClkSyncWarn <= IntFrmWarnCntTc_d; 

genpulse1: FCLK_GenPulse 
  Port map(Clk => FrmClkDiv, 
        Ena   => '1',
        SigIn   => FrmClkReSync, 
        SigOut  => IntFrmClkReSync  );

IntFrmReSyncOut <= IntFrmSlipCntTc_d2 or IntFrmDbleNibFnl or IntFrmClkReSync;


FDCE_inst_ReSync : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmReSyncOut_d, -- Data output
C => FrmClkDiv, -- Clock input
CE => '1', -- Clock enable input
CLR => '0', -- Asynchronous clear input
D => IntFrmReSyncOut -- Data input
); 

IntFrmClkRst <= FrmClkRst or IntFrmReSyncOut_d;
FrmClkReSyncOut <= IntFrmReSyncOut_d;

FDCE_inst_done : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntFrmEna, -- Data output
C => FrmClkDiv, -- Clock input
CE => FrmClkEna, -- Clock enable input
CLR => IntFrmClkRst, -- Asynchronous clear input
D => FrmClkDone -- Data input
);

process(IntFrmClkRst, FrmClkDiv)
subtype IntFrmBitSlipCase is std_logic_vector(5 downto 0);
begin
   if (IntFrmClkRst = '1') then
       IntFrmBitSlip <= (others => '0');
   elsif( rising_edge(FrmClkDiv)) then
       if (IntFrmEna = '1' and IntFrmEquSet_d = '0') then
          case IntFrmBitSlipCase'(IntFrmEqu_d, IntFrmEvntCntTc_d, IntFrmBitSlip(5), IntFrmBitSlip(4), IntFrmBitSlip(3), IntFrmBitSlip(2)) is
          
          when "000000" => IntFrmBitSlip <= "000000" ;
          when "010000" => IntFrmBitSlip <= "000101" ;
          when "000001" => IntFrmBitSlip <= "000100" ;
          when "010001" => IntFrmBitSlip <= "001010" ;
          when "000010" => IntFrmBitSlip <= "001000" ;
          when "010010" => IntFrmBitSlip <= "000101" ;
          
          when "100000" => IntFrmBitSlip <= "000000" ;
          when "110000" => IntFrmBitSlip <= "100101" ;
          when "101001" => IntFrmBitSlip <= "110000" ;
          when "101100" => IntFrmBitSlip <= "110000" ;
          
          when "100001" => IntFrmBitSlip <= "000100" ;
          when "110001" => IntFrmBitSlip <= "101010" ;
          when "101010" => IntFrmBitSlip <= "110000" ;
          
          when "100010" => IntFrmBitSlip <= "001000" ;
          
          when "110010" => IntFrmBitSlip <= "1001" & IntFrmSwapMux_d & not IntFrmSwapMux_d ;
          
          when others  => IntFrmBitSlip <= "110000";
         end case;
       end if;
   end if;
end process;

FrmClkBitSlip_p <= IntFrmBitSlip(0);
FrmClkBitSlip_n <= IntFrmBitSlip(1);
IntFrmEquSet_d <= IntFrmBitSlip(4);
IntFrmEnaOut   <= IntFrmEna;          
          
              
                      
end Behavioral;
