----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2023 20:00:57
-- Design Name: 
-- Module Name: EquCntModule - Behavioral
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

entity EquCntModule is
  Port (Clock          : in std_logic; 
        IntEqu         : in std_logic;
        IntRstIn_d     : in std_logic;
        IntEquCnt_d    : out STD_LOGIC_VECTOR (3 downto 0)
        
         );
end EquCntModule;

architecture Behavioral of EquCntModule is


signal IntEquCnt_dInt     : STD_LOGIC_VECTOR (3 downto 0);
signal IntEquCnt          : STD_LOGIC_VECTOR (3 downto 0);
begin

IntEquCnt_d <= IntEquCnt_dInt;

EquCnt_0: FDRE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntEquCnt_dInt(0), -- Data output
C => Clock, -- Clock input
CE => IntEqu, -- Clock enable input
R => IntRstIn_d, -- Synchronous reset input
D => IntEquCnt(0) -- Data input
);

EquCnt_1: FDRE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntEquCnt_dInt(1), -- Data output
C => Clock, -- Clock input
CE => IntEqu, -- Clock enable input
R => IntRstIn_d, -- Synchronous reset input
D => IntEquCnt(1) -- Data input
);

EquCnt_2: FDRE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntEquCnt_dInt(2), -- Data output
C => Clock, -- Clock input
CE => IntEqu, -- Clock enable input
R => IntRstIn_d, -- Synchronous reset input
D => IntEquCnt(2) -- Data input
);

EquCnt_3: FDRE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntEquCnt_dInt(3), -- Data output
C => Clock, -- Clock input
CE => IntEqu, -- Clock enable input
R => IntRstIn_d, -- Synchronous reset input
D => IntEquCnt(3) -- Data input
);

process(IntEquCnt_dInt)
begin
    case IntEquCnt_dInt is 
        when "0000" => IntEquCnt <= "0001";
        when "0001" => IntEquCnt <= "0011";
        when "0011" => IntEquCnt <= "0010";
        when "0010" => IntEquCnt <= "0110";
        when "0110" => IntEquCnt <= "0111";
        when "0111" => IntEquCnt <= "0101";
        when "0101" => IntEquCnt <= "0100";
        when "0100" => IntEquCnt <= "1100";
        when "1100" => IntEquCnt <= "1101";
        when "1101" => IntEquCnt <= "1111";
        when "1111" => IntEquCnt <= "1110"; 
        when "1110" => IntEquCnt <= "1010";
        when "1010" => IntEquCnt <= "1011";
        when "1011" => IntEquCnt <= "1001";
        when "1001" => IntEquCnt <= "1000"; 
        when others => IntEquCnt <= "0000";
     end case;
end process; 


end Behavioral;
