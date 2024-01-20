----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.09.2023 22:08:57
-- Design Name: 
-- Module Name: FdceReg - Behavioral
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

entity FdceReg is
    Port ( IntDatMux : in STD_LOGIC_VECTOR (13 downto 0);
           DatClkDiv : in STD_LOGIC;
           IntDatEna : in STD_LOGIC;
           DatReSync : in STD_LOGIC;
           IntDatSwp : out STD_LOGIC_VECTOR (13 downto 0));
end FdceReg;

architecture Behavioral of FdceReg is

begin

FDCE_inst_reg00 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(0), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(0) -- Data input
);

FDCE_inst_reg01 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(1), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(1) -- Data input
);

FDCE_inst_reg02 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(2), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(2) -- Data input
);

FDCE_inst_reg03 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(3), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(3) -- Data input
);

FDCE_inst_reg04 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(4), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(4) -- Data input
);

FDCE_inst_reg05 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(5), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(5) -- Data input
);

FDCE_inst_reg06 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(6), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(6) -- Data input
);

FDCE_inst_reg07 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(7), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(7) -- Data input
);

FDCE_inst_reg10 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(8), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(8) -- Data input
);

FDCE_inst_reg11 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(9), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(9) -- Data input
);

FDCE_inst_reg12 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(10), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(10) -- Data input
);

FDCE_inst_reg13 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(11), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(11) -- Data input
);

FDCE_inst_reg14 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(12), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(12) -- Data input
);

FDCE_inst_reg15 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDatSwp(13), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(13) -- Data input
);

end Behavioral;
