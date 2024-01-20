----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.09.2023 20:08:51
-- Design Name: 
-- Module Name: DatMux - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DatMux is
    Port ( IntDatMux : out STD_LOGIC_VECTOR (13 downto 0);
           DatSwapMux : in STD_LOGIC;
           IntDat : in STD_LOGIC_VECTOR (13 downto 0)
           );
end DatMux;

architecture Behavioral of DatMux is

begin

IntDatMux(0) <= IntDat(1) when (DatSwapMux = '1') else IntDat(0);
IntDatMux(1) <= IntDat(0) when (DatSwapMux = '1') else IntDat(1);
IntDatMux(2) <= IntDat(3) when (DatSwapMux = '1') else IntDat(2);
IntDatMux(3) <= IntDat(2) when (DatSwapMux = '1') else IntDat(3);
IntDatMux(4) <= IntDat(5) when (DatSwapMux = '1') else IntDat(4);
IntDatMux(5) <= IntDat(4) when (DatSwapMux = '1') else IntDat(5);
IntDatMux(6) <= IntDat(7) when (DatSwapMux = '1') else IntDat(6);
IntDatMux(7) <= IntDat(6) when (DatSwapMux = '1') else IntDat(7);
IntDatMux(0) <= IntDat(9) when (DatSwapMux = '1') else IntDat(8);
IntDatMux(1) <= IntDat(8) when (DatSwapMux = '1') else IntDat(9);
IntDatMux(2) <= IntDat(11) when (DatSwapMux = '1') else IntDat(10);
IntDatMux(3) <= IntDat(10) when (DatSwapMux = '1') else IntDat(11);
IntDatMux(4) <= IntDat(13) when (DatSwapMux = '1') else IntDat(12);
IntDatMux(5) <= IntDat(12) when (DatSwapMux = '1') else IntDat(13);
end Behavioral;
