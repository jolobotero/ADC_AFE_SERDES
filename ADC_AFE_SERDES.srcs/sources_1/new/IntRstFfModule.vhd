----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2023 15:33:49
-- Design Name: 
-- Module Name: IntRstFfModule - Behavioral
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

entity IntRstFfModule is
  Port (clock      : in std_logic;
        IntRstSet  : in std_logic;
        RstIn      : in std_logic;
        IntRstIn_d : out std_logic );
end IntRstFfModule;

architecture Behavioral of IntRstFfModule is
signal IntRstFf_d     : std_logic_vector(6 downto 0);
signal IntRstIn         : std_logic;

begin

IntRstIn <= RstIn or IntRstSet;

FDSE_instrstIn0 : FDSE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRstFf_d(0), -- Data output
C => clock, -- Clock input
CE => '1', -- Clock enable input
S => IntRstSet, -- Synchronous Set input
D => '0' -- Data input
);

FDSE_instrstIn1 : FDSE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRstFf_d(1), -- Data output
C => clock, -- Clock input
CE => '1', -- Clock enable input
S => IntRstSet, -- Synchronous Set input
D => IntRstFf_d(0) -- Data input
);

FDSE_instrstIn2 : FDSE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRstFf_d(2), -- Data output
C => clock, -- Clock input
CE => '1', -- Clock enable input
S => IntRstSet, -- Synchronous Set input
D => IntRstFf_d(1) -- Data input
);

FDSE_instrstIn3 : FDSE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRstFf_d(3), -- Data output
C => clock, -- Clock input
CE => '1', -- Clock enable input
S => IntRstSet, -- Synchronous Set input
D => IntRstFf_d(2) -- Data input
);

FDSE_instrstIn4 : FDSE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRstFf_d(4), -- Data output
C => clock, -- Clock input
CE => '1', -- Clock enable input
S => IntRstSet, -- Synchronous Set input
D => IntRstFf_d(3) -- Data input
);

FDSE_instrstIn5 : FDSE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRstFf_d(5), -- Data output
C => clock, -- Clock input
CE => '1', -- Clock enable input
S => IntRstSet, -- Synchronous Set input
D => IntRstFf_d(4) -- Data input
);

FDSE_instrstIn6 : FDSE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRstFf_d(6), -- Data output
C => clock, -- Clock input
CE => '1', -- Clock enable input
S => IntRstIn, -- Synchronous Set input
D => IntRstFf_d(5) -- Data input
);

FDSE_instrstIn7 : FDSE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRstIn_d, -- Data output
C => clock, -- Clock input
CE => '1', -- Clock enable input
S => IntRstIn, -- Synchronous Set input
D => IntRstFf_d(6) -- Data input
);
------------------------------------------------------------
------------------------------------------------------------


end Behavioral;
