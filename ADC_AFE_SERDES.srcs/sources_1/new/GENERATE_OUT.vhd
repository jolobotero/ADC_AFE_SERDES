----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 12:16:31
-- Design Name: 
-- Module Name: GENERATE_OUT - Behavioral
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

entity GENERATE_OUT is
  Port (C_adcMsbOrLsbFst : in std_logic; 
        DatClkDiv        : in std_logic; 
        DatLsbRegEna     : in std_logic;  
        DatMsbRegEna     : in std_logic;  
        DatReSync        : in std_logic;
        IntDatSwp        : in std_logic_vector(13 downto 0);
        DatOut           : out std_logic_vector(13 downto 0)
      );
end GENERATE_OUT;

architecture Behavioral of GENERATE_OUT is

signal IntDatSwpBus         : std_logic_vector(13 downto 0);


begin



process(C_adcMsbOrLsbFst)
begin
   if (C_adcMsbOrLsbFst = '0') then      -- 0 MSB firts, 1 -- LSB firts
      IntDatSwpBus <= IntDatSwp;
   else
      IntDatSwpBus(0)  <= IntDatSwp(13);   
      IntDatSwpBus(1)  <= IntDatSwp(12);   
      IntDatSwpBus(2)  <= IntDatSwp(11);   
      IntDatSwpBus(3)  <= IntDatSwp(10);   
      IntDatSwpBus(4)  <= IntDatSwp(9);   
      IntDatSwpBus(5)  <= IntDatSwp(8);   
      IntDatSwpBus(6)  <= IntDatSwp(7);
      IntDatSwpBus(7)  <= IntDatSwp(6);   
      IntDatSwpBus(8)  <= IntDatSwp(5);   
      IntDatSwpBus(9)  <= IntDatSwp(4);   
      IntDatSwpBus(10) <= IntDatSwp(3);   
      IntDatSwpBus(11) <= IntDatSwp(2);   
      IntDatSwpBus(12) <= IntDatSwp(1);   
      IntDatSwpBus(13) <= IntDatSwp(0);
   end if;
end process;      

FDCE_inst_out1 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(0), -- Data output
C => DatClkDiv, -- Clock input
CE => DatLsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(0) -- Data input
);         
      
FDCE_inst_out2 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(1), -- Data output
C => DatClkDiv, -- Clock input
CE => DatLsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(1) -- Data input
);         

FDCE_inst_out3 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(2), -- Data output
C => DatClkDiv, -- Clock input
CE => DatLsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(2) -- Data input
);         

FDCE_inst_out4 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(3), -- Data output
C => DatClkDiv, -- Clock input
CE => DatLsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(3) -- Data input
);         

FDCE_inst_out5 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(4), -- Data output
C => DatClkDiv, -- Clock input
CE => DatLsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(4) -- Data input
);         

FDCE_inst_out6 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(5), -- Data output
C => DatClkDiv, -- Clock input
CE => DatLsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(5) -- Data input
);         

FDCE_inst_out7 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(6), -- Data output
C => DatClkDiv, -- Clock input
CE => DatLsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(6) -- Data input
);         

FDCE_inst_out8 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(7), -- Data output
C => DatClkDiv, -- Clock input
CE => DatLsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(7) -- Data input
);         

FDCE_inst_out9 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(8), -- Data output
C => DatClkDiv, -- Clock input
CE => DatMsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(8) -- Data input
);         

FDCE_inst_out10 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(9), -- Data output
C => DatClkDiv, -- Clock input
CE => DatMsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(9) -- Data input
);         

FDCE_inst_out11 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(10), -- Data output
C => DatClkDiv, -- Clock input
CE => DatMsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(10) -- Data input
);         

FDCE_inst_out12 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(11), -- Data output
C => DatClkDiv, -- Clock input
CE => DatMsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(11) -- Data input
);         

FDCE_inst_out13 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(12), -- Data output
C => DatClkDiv, -- Clock input
CE => DatMsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(12) -- Data input
);         

FDCE_inst_out14 : FDCE
generic map (
INIT => '0') -- Initial value of register ('0' or '1')
port map (
Q => DatOut(13), -- Data output
C => DatClkDiv, -- Clock input
CE => DatMsbRegEna, -- Clock enable input
CLR => DatReSync, -- Asynchronous clear input
D => IntDatSwpBus(13) -- Data input
);         


end Behavioral;
