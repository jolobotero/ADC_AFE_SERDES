----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2023 20:49:30
-- Design Name: 
-- Module Name: FDCE_ARRAYS - Behavioral
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

entity FDCE_ARRAYS is
  Port (IntDat         : out std_logic_vector(13 downto 0);
        DatClkDiv      : in std_logic;
        IntDatEna      : in std_logic;
        DatReSync      : in std_logic;
        IntDatSrds     : in std_logic_vector(13 downto 0)
        
         );
end FDCE_ARRAYS;

architecture Behavioral of FDCE_ARRAYS is

begin

FDCE_inst_P0 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(0), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(0) -- Data input
);               

FDCE_inst_P1 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(1), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(1) -- Data input
);               
FDCE_inst_P2 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(2), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(2) -- Data input
);               
FDCE_inst_P3 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(3), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(3) -- Data input
);               
FDCE_inst_P4 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(4), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(4) -- Data input
);               
FDCE_inst_P5 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(5), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(5) -- Data input
);               
FDCE_inst_P6 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(6), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(6) -- Data input
);               

FDCE_inst_P7 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(7), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(7) -- Data input
); 

FDCE_inst_P8 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(8), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(8) -- Data input
);               

FDCE_inst_P9 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(9), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(9) -- Data input
);               
FDCE_inst_P10 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(10), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(10) -- Data input
);               
FDCE_inst_P11 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(11), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(11) -- Data input
);               
FDCE_inst_P12 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(12), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(12) -- Data input
);               
FDCE_inst_P13 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(13), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSrds(13) -- Data input
);               

end Behavioral;
