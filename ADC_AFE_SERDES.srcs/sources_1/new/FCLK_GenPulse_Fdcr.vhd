----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2023 21:19:41
-- Design Name: 
-- Module Name: FCLK_GenPulse_Fdcr - Behavioral
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
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_UNSIGNED.all;
library UNISIM;
	use UNISIM.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FCLK_GenPulse_Fdcr is
  Port (D        : in std_logic;
        CE       : in std_logic; 
        C        : in std_logic; 
        R        : in std_logic;
        Q        : out std_logic);
end FCLK_GenPulse_Fdcr;

architecture Behavioral of FCLK_GenPulse_Fdcr is
signal IntQ         : std_logic;
signal IntDceR      : std_logic;

begin

process(IntQ, R ,CE,D)
subtype LutOut is std_logic_vector(3 downto 0);
begin
    case LutOut'(IntQ & R & CE & D) is
    when "0011" => IntDceR <= '1';
    when "1000" => IntDceR <= '1';
    when "1001" => IntDceR <= '1';
    when "1011" => IntDceR <= '1';
    when others => IntDceR <= '0';
    end case;
end process;

Q <= IntQ; 
    
FDCE_inst_genPulse : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntQ, -- Data output
C => C, -- Clock input
CE => '1', -- Clock enable input
CLR => '0', -- Asynchronous clear input
D => IntDceR -- Data input
);
end Behavioral;
