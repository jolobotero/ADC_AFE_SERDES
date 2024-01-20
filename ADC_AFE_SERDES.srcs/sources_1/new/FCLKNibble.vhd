----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.11.2023 11:28:21
-- Design Name: 
-- Module Name: FCLKNibble - Behavioral
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

entity FCLKNibble is
  Port (FrmClkDiv		: in std_logic;
        IntFrmSrdsOut   : in std_logic_vector(7 downto 0);
        IntFrmClkRst    : in std_logic );
end FCLKNibble;

architecture Behavioral of FCLKNibble is

component FclkCntEqu is
    Port (clock         : in std_logic;
          RstIn         : in std_logic;
          DataIn        : in std_logic_vector(3 downto 0);
          DataOut       : out std_logic_vector(3 downto 0); 
          final         : out std_logic );
end component;


signal IntFrmDbleNibFnlOdd          : std_logic;
signal IntFrmDbleNibFnlEvn          : std_logic;
signal IntFrmSrdsDatOdd             : std_logic_vector(3 downto 0);
signal IntFrmSrdsDatEvn             : std_logic_vector(3 downto 0);
signal IntFrmSrdsDatEvn_d           : std_logic_vector(3 downto 0);
signal IntFrmSrdsDatOdd_d           : std_logic_vector(3 downto 0);
signal IntFrmDbleNibFnl		        : std_logic;
signal IntFrmSrdsDat                : std_logic_vector(3 downto 0);


begin

IntFrmSrdsDatEvn <= IntFrmSrdsOut(6) & IntFrmSrdsOut(4) & IntFrmSrdsOut(2) & IntFrmSrdsOut(0);
IntFrmSrdsDatOdd <=  not IntFrmSrdsOut(7) & not IntFrmSrdsOut(5) & 
                     not IntFrmSrdsOut(3) & not IntFrmSrdsOut(1);
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
    if(IntFrmClkRst = '1') then
       IntFrmDbleNibFnl <= '0';
    elsif rising_edge(FrmClkDiv) then
       IntFrmDbleNibFnl <= IntFrmDbleNibFnlOdd and IntFrmDbleNibFnlEvn;
    end if;
end process;                

IntFrmSrdsDat(1) <= IntFrmSrdsDatOdd_d(0);
IntFrmSrdsDat(3) <= IntFrmSrdsDatOdd_d(1);
IntFrmSrdsDat(5) <= IntFrmSrdsDatOdd_d(2);
IntFrmSrdsDat(7) <= IntFrmSrdsDatOdd_d(3);

IntFrmSrdsDat(0) <= IntFrmSrdsDatEvn_d(0);
IntFrmSrdsDat(2) <= IntFrmSrdsDatEvn_d(1);
IntFrmSrdsDat(4) <= IntFrmSrdsDatEvn_d(2);
IntFrmSrdsDat(6) <= IntFrmSrdsDatEvn_d(3);

end Behavioral;
