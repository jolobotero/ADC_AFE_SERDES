----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2023 22:54:19
-- Design Name: 
-- Module Name: Dat_Iserdes_Out - Behavioral
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

entity Dat_Iserdes_Out is
  Port (  DatOutIn           : in  std_logic_vector(13 downto 0);
          DatClkDiv          : in  std_logic;
          IntDatEna          : in  std_logic;
          DatReSync          : in  std_logic;
          DatSwapMux         : in  std_logic;
          AdcData            : out std_logic_vector(13 downto 0) );
end Dat_Iserdes_Out;

architecture Behavioral of Dat_Iserdes_Out is

signal data                : std_logic_vector(13 downto 0);
signal IntDat              : std_logic_vector(13 downto 0);
signal IntDatMux           : std_logic_vector(13 downto 0);
begin

--data <=   not DatOutIn(13) & DatOutIn(12) 
--        & not DatOutIn(11) & DatOutIn(10)
--        & not DatOutIn(9) & DatOutIn(8)
--        & not DatOutIn(7) & DatOutIn(6)
--        & not DatOutIn(5) & DatOutIn(4)
--        & not DatOutIn(3) & DatOutIn(2)
--        & not DatOutIn(1) & DatOutIn(0);

data <= DatOutIn(0)  & not DatOutIn(1)  & 
        DatOutIn(2)  & not DatOutIn(3)  &
        DatOutIn(4)  & not DatOutIn(5)  &
        DatOutIn(6)  & not DatOutIn(7)  &
        DatOutIn(8)  & not DatOutIn(9)  &
        DatOutIn(10) & not DatOutIn(11) &
        DatOutIn(12) & not DatOutIn(13);  
---------------------------------------------------------------------
Dat_Reg_0 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(0), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(0) -- Data input
);

Dat_Reg_1 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(1), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(1) -- Data input
);

Dat_Reg_2 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(2), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(2) -- Data input
);

Dat_Reg_3 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(3), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(3) -- Data input
);

Dat_Reg_4 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(4), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(4) -- Data input
);

Dat_Reg_5 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(5), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(5) -- Data input
);

Dat_Reg_6 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(6), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(6) -- Data input
);

Dat_Reg_7 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(7), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(7) -- Data input
);

Dat_Reg_8 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(8), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(8) -- Data input
);

Dat_Reg_9 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(9), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(9) -- Data input
);

Dat_Reg_10 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(10), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(10) -- Data input
);

Dat_Reg_11 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(11), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(11) -- Data input
);

Dat_Reg_12 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(12), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(12) -- Data input
);

Dat_Reg_13 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => IntDat(13), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => data(13) -- Data input
);

IntDatMux(13) <= IntDat(12) when DatSwapMux = '1' else IntDat(13);
IntDatMux(12) <= IntDat(13) when DatSwapMux = '1' else IntDat(12);
IntDatMux(11) <= IntDat(10) when DatSwapMux = '1' else IntDat(11);
IntDatMux(10) <= IntDat(11) when DatSwapMux = '1' else IntDat(10);
IntDatMux(9)  <= IntDat(8)  when DatSwapMux = '1' else IntDat(9);
IntDatMux(8)  <= IntDat(9)  when DatSwapMux = '1' else IntDat(8);
IntDatMux(7)  <= IntDat(6)  when DatSwapMux = '1' else IntDat(7);
IntDatMux(6)  <= IntDat(7)  when DatSwapMux = '1' else IntDat(6);
IntDatMux(5)  <= IntDat(4)  when DatSwapMux = '1' else IntDat(5);
IntDatMux(4)  <= IntDat(5)  when DatSwapMux = '1' else IntDat(4);
IntDatMux(3)  <= IntDat(2)  when DatSwapMux = '1' else IntDat(3);
IntDatMux(2)  <= IntDat(3)  when DatSwapMux = '1' else IntDat(2);
IntDatMux(1)  <= IntDat(0)  when DatSwapMux = '1' else IntDat(1);
IntDatMux(0)  <= IntDat(1)  when DatSwapMux = '1' else IntDat(0);

adcData_IntDatMux_Reg0: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(0), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(0) -- Data input
);

adcData_IntDatMux_Reg1: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(1), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(1) -- Data input
);

adcData_IntDatMux_Reg2: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(2), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(2) -- Data input
);

adcData_IntDatMux_Reg3: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(3), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(3) -- Data input
);

adcData_IntDatMux_Reg4: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(4), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(4) -- Data input
);

adcData_IntDatMux_Reg5: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(5), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(5) -- Data input
);

adcData_IntDatMux_Reg6: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(6), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(6) -- Data input
);

adcData_IntDatMux_Reg7: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(7), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(7) -- Data input
);

adcData_IntDatMux_Reg8: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(8), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(8) -- Data input
);

adcData_IntDatMux_Reg9: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(9), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(9) -- Data input
);

adcData_IntDatMux_Reg10: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(10), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(10) -- Data input
);

adcData_IntDatMux_Reg11: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(11), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(11) -- Data input
);

adcData_IntDatMux_Reg12: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(12), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(12) -- Data input
);

adcData_IntDatMux_Reg13: FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => AdcData(13), -- Data output
C => DatClkDiv, -- Clock input
CE => IntDatEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatMux(13) -- Data input
);

       
end Behavioral;
