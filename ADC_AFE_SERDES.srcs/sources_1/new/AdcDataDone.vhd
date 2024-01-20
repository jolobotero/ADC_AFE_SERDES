----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.09.2023 20:05:52
-- Design Name: 
-- Module Name: AdcDataDone - Behavioral
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

entity AdcDataDone is
    Port ( DatDone    : in std_logic;
           IntDatDone : out STD_LOGIC;
           DatRst : in STD_LOGIC;
           DatClkDiv : in STD_LOGIC;
           DatEna : in STD_LOGIC;
           IntDatEna : out STD_LOGIC);
end AdcDataDone;

architecture Behavioral of AdcDataDone is
signal IntDatDoneInt : std_logic;

begin

IntDatDone <= IntDatDoneInt;

Process(DatClkDiv,DatRst)
begin
  if(DatRst = '1') then
     IntDatDoneInt <= '0';
  elsif rising_edge(DatClkDiv) then
     IntDatDoneInt <= DatDone;   
  end if;
end process;

IntDatEna <= '1' when (IntDatDoneInt = '1' and DatEna = '1') else
             '0';   
end Behavioral;
