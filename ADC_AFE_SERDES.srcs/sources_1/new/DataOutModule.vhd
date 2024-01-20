----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2023 08:57:14
-- Design Name: 
-- Module Name: DataOutModule - Behavioral
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

entity DataOutModule is
  Port (clock         : in std_logic; 
        IntRstIn_d       : in std_logic;
        IntSrlOut        : in std_logic_vector(3 downto 0);
        DataOut       : out std_logic_vector(3 downto 0) );
end DataOutModule;

architecture Behavioral of DataOutModule is

begin

FDCE_instOut0 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DataOut(0), -- Data output
C => Clock, -- Clock input
CE => '1', -- Clock enable input
CLR => IntRstIn_d, -- Asynchronous clear input
D => IntSrlOut(0) -- Data input
);

FDCE_instOut1 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DataOut(1), -- Data output
C => Clock, -- Clock input
CE => '1', -- Clock enable input
CLR => IntRstIn_d, -- Asynchronous clear input
D => IntSrlOut(1) -- Data input
);

FDCE_instOut2 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DataOut(2), -- Data output
C => Clock, -- Clock input
CE => '1', -- Clock enable input
CLR => IntRstIn_d, -- Asynchronous clear input
D => IntSrlOut(2) -- Data input
);

FDCE_instOut3 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DataOut(3), -- Data output
C => Clock, -- Clock input
CE => '1', -- Clock enable input
CLR => IntRstIn_d, -- Asynchronous clear input
D => IntSrlOut(3) -- Data input
);
end Behavioral;
