----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2023 09:05:56
-- Design Name: 
-- Module Name: RSTSetModule - Behavioral
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

entity RSTSetModule is
  Port (clock      : in std_logic;
        IntEqu           : in std_logic;
        IntRstIn_d       : in std_logic;
        IntSlipCnt_d     : in STD_LOGIC_VECTOR (3 downto 0);
        IntEquCnt_d      : in STD_LOGIC_VECTOR (3 downto 0);
        IntPulse         : out std_logic;
        IntSlipCntRst    : out std_logic;
        IntRstSet        : out std_logic;
        Final            : out std_logic );
end RSTSetModule;

architecture Behavioral of RSTSetModule is
signal IntRstSetInt        : std_logic;
signal IntPulseInt         : std_logic;
signal IntEqu_d            : std_logic;
signal IntSlipCntRstInt    : std_logic;
begin

IntRstSetInt <= '1' when (IntEquCnt_d = "0110" and IntSlipCnt_d = "0000" and IntPulseInt = '1') else
             '0';

IntPulseInt <= IntEqu or IntEqu_d; 

IntSlipCntRstInt <= '1' when (IntRstIn_d = '1' or IntSlipCnt_d = "0101") else
                 '0';      
                 
Final <= IntRstSetInt; 
IntRstSet  <= IntRstSetInt;
IntPulse <= IntPulseInt; 
IntSlipCntRst <= IntSlipCntRstInt;                   

FDCE_instIntEqu : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntEqu_d, -- Data output
C => Clock, -- Clock input
CE => IntEqu, -- Clock enable input
CLR => IntSlipCntRstInt, -- Asynchronous clear input
D => '1' -- Data input
);

end Behavioral;
