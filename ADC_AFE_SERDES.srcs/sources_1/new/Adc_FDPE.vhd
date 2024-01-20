----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2023 14:52:25
-- Design Name: 
-- Module Name: Adc_FDPE - Behavioral
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

entity Adc_FDPE is
  Port (AdcIntrfcRst        : in std_logic;
        FrmClkDiv           : in std_logic;
        AdcIntrfcEna        : in std_logic;
        FrmClkEna           : out std_logic;
        IntRst              : out std_logic
         );
end Adc_FDPE;

architecture Behavioral of Adc_FDPE is

signal IntRst_Int          : std_logic;
signal Q_out               : std_logic;

begin

IntRst <= IntRst_Int;

-- FDPE: Single Data Rate D Flip-Flop with Asynchronous Preset and
-- Clock Enable (posedge clk).
-- 7 Series
-- Xilinx HDL Libraries Guide, version 14.7
FDPE_inst1 : FDPE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRst_Int, -- Data output
C => FrmClkDiv, -- Clock input
CE => '1', -- Clock enable input
PRE => AdcIntrfcRst, -- Asynchronous preset input
D => '0' -- Data input
);

FDCE_inst2 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => Q_out, -- Data output
C => FrmClkDiv, -- Clock input
CE => AdcIntrfcEna, -- Clock enable input
CLR => IntRst_Int, -- Asynchronous clear input
D => '1' -- Data input
);


FDCE_inst3 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => FrmClkEna, -- Data output
C => FrmClkDiv, -- Clock input
CE => '1', -- Clock enable input
CLR => IntRst_Int, -- Asynchronous clear input
D => Q_out -- Data input
);
end Behavioral;
