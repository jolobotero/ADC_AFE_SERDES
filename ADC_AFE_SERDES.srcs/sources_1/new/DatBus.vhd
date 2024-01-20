----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.09.2023 19:35:52
-- Design Name: 
-- Module Name: DatBus - Behavioral
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

entity DatBus is
    Port ( DatOut : in STD_LOGIC_VECTOR (13 downto 0);
           IntDatSrds : out STD_LOGIC_VECTOR (13 downto 0)
           );
end DatBus;

architecture Behavioral of DatBus is

begin

IntDatSrds <= not DatOut(13) & not DatOut(12) & not DatOut(11) & not DatOut(10) &  
              not DatOut(9)  & not DatOut(8)  & not DatOut(7)  & not DatOut(6)  & 
              not DatOut(5)  & not DatOut(4)  & not DatOut(3)  & not DatOut(2)  & 
              not DatOut(1)  & not DatOut(0); 
               
end Behavioral;
