----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2023 15:10:31
-- Design Name: 
-- Module Name: IntRegOutModule - Behavioral
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

entity IntRegOutModule is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           Clock   : in std_logic;
           IntRstIn_d: in std_logic;
           IntEqu    : out std_logic;
           IntRegOutIn: out std_logic_vector(3 downto 0));
end IntRegOutModule;

architecture Behavioral of IntRegOutModule is
signal IntRegOutIn_Int     :std_logic_vector(3 downto 0);
begin

IntRegOutIn <= IntRegOutIn_INT;
IntEqu <= '1' when (DataIn = IntRegOutIn_INT) else
          '0'; 

FDCE_instdata0 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRegOutIn_INT(0), -- Data output
C => Clock, -- Clock input
CE => '1', -- Clock enable input
CLR => IntRstIn_d, -- Asynchronous clear input
D => DataIn(0) -- Data input
);

FDCE_instdata1 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRegOutIn_INT(1), -- Data output
C => Clock, -- Clock input
CE => '1', -- Clock enable input
CLR => IntRstIn_d, -- Asynchronous clear input
D => DataIn(1) -- Data input
);

FDCE_instdata2 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRegOutIn_INT(2), -- Data output
C => Clock, -- Clock input
CE => '1', -- Clock enable input
CLR => IntRstIn_d, -- Asynchronous clear input
D => DataIn(2) -- Data input
);

FDCE_instdata3 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntRegOutIn_INT(3), -- Data output
C => Clock, -- Clock input
CE => '1', -- Clock enable input
CLR => IntRstIn_d, -- Asynchronous clear input
D => DataIn(3) -- Data input
);


end Behavioral;
