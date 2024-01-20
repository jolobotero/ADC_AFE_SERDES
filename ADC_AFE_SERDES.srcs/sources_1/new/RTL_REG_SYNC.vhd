----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.09.2023 18:41:39
-- Design Name: 
-- Module Name: RTL_REG_SYNC - Behavioral
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

entity RTL_REG_SYNC is
  Port (FrmClkDiv   : in std_logic;
        FrmRst      : in std_logic; 
        BitClkDone  : in std_logic;
        wFrmPattern : in std_logic_vector(13 downto 0);
        FrmPattern  : in std_logic_vector(13 downto 0);
        
        
        FrmBitslip : out std_logic;
        FrmAlignDone : out std_logic
        );
end RTL_REG_SYNC;

architecture Behavioral of RTL_REG_SYNC is

signal rBitslipCnt : integer;

begin

process(FrmClkDiv)
begin
   if rising_edge(FrmClkDiv) then
      if( (FrmRst = '1') or (BitClkDone = '0' ) ) then
         FrmBitSlip <= '0';
         rBitslipCnt <= 0;
         FrmAlignDone <= '0';
      elsif (rBitslipCnt = 31) then
         rBitslipCnt <= 0;
         FrmBitslip <= '0';
      elsif (rBitslipCnt = 0) then
         rBitslipCnt <= rBitslipCnt + 1;
         if (wFrmPattern = FrmPattern) then
            FrmAlignDone <= '1';
            FrmBitslip   <= '0';
         else
            FrmAlignDone <= '0';
            FrmBitslip   <= '1';
         end if;
     else
         rBitslipCnt <= rBitslipCnt + 1;
         FrmBitslip <= '0';
     end if;
  end if;
end process;                                         

end Behavioral;
