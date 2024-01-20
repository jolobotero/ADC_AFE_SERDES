----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2023 20:46:21
-- Design Name: 
-- Module Name: IntSlipCntModule - Behavioral
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

entity IntSlipCntModule is
  Port (clock            : in std_logic;
        IntPulse         : in std_logic;
        IntSlipCntRst    : in std_logic;
        IntSlipCnt_d     : out STD_LOGIC_VECTOR (3 downto 0) );
end IntSlipCntModule;

architecture Behavioral of IntSlipCntModule is
signal IntSlipCnt          : std_logic_vector(3 downto 0);
signal IntSlipCnt_dInt     : STD_LOGIC_VECTOR (3 downto 0);

begin

IntSlipCnt_d <= IntSlipCnt_dInt;

IntSlipCnt_0: FDRE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntSlipCnt_dInt(0), -- Data output
C => Clock, -- Clock input
CE => IntPulse, -- Clock enable input
R => IntSlipCntRst, -- Synchronous reset input
D => IntSlipCnt(0) -- Data input
);

IntSlipCnt_1: FDRE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntSlipCnt_dInt(1), -- Data output
C => Clock, -- Clock input
CE => IntPulse, -- Clock enable input
R => IntSlipCntRst, -- Synchronous reset input
D => IntSlipCnt(1) -- Data input
);

IntSlipCnt_2: FDRE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntSlipCnt_dInt(2), -- Data output
C => Clock, -- Clock input
CE => IntPulse, -- Clock enable input
R => IntSlipCntRst, -- Synchronous reset input
D => IntSlipCnt(2) -- Data input
);

IntSlipCnt_3: FDRE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntSlipCnt_dInt(3), -- Data output
C => Clock, -- Clock input
CE => IntPulse, -- Clock enable input
R => IntSlipCntRst, -- Synchronous reset input
D => IntSlipCnt(3) -- Data input
);

process(IntSlipCnt_dInt)
begin
    case IntSlipCnt_dInt is 
        when "0000" => IntSlipCnt <= "0001";
        when "0001" => IntSlipCnt <= "0011";
        when "0011" => IntSlipCnt <= "0010";
        when "0010" => IntSlipCnt <= "0110";
        when "0110" => IntSlipCnt <= "0111";
        when "0111" => IntSlipCnt <= "0101";
        when others => IntSlipCnt <= "0000";
     end case;
end process; 
end Behavioral;
