----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2023 07:23:30
-- Design Name: 
-- Module Name: IntSrlModule - Behavioral
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

entity IntSrlModule is
  Port (Clock            : in std_logic;
        IntRegOutIn      : in std_logic_vector(3 downto 0);
        IntEquCnt_d     :  in STD_LOGIC_VECTOR (3 downto 0);
        IntSlipCnt_d     : in STD_LOGIC_VECTOR (3 downto 0);
        IntSrlOut        : out std_logic_vector(3 downto 0) );
end IntSrlModule;

architecture Behavioral of IntSrlModule is
signal IntAddr          : std_logic_vector(4 downto 0);


begin

SRLC32E_instintreg0 : SRLC32E
generic map (
INIT => X"00000000")
port map (
Q => IntSrlOut(0), -- SRL data output
Q31 => open, -- SRL cascade output pin
A => IntAddr, -- 5-bit shift depth select input
CE => '1', -- Clock enable input
CLK => CLock, -- Clock input
D => IntRegOutIn(0) -- SRL data input
);

SRLC32E_instintreg1 : SRLC32E
generic map (
INIT => X"00000000")
port map (
Q => IntSrlOut(1), -- SRL data output
Q31 => open, -- SRL cascade output pin
A => IntAddr, -- 5-bit shift depth select input
CE => '1', -- Clock enable input
CLK => CLock, -- Clock input
D => IntRegOutIn(1) -- SRL data input
);

SRLC32E_instintreg2 : SRLC32E
generic map (
INIT => X"00000000")
port map (
Q => IntSrlOut(2), -- SRL data output
Q31 => open, -- SRL cascade output pin
A => IntAddr, -- 5-bit shift depth select input
CE => '1', -- Clock enable input
CLK => CLock, -- Clock input
D => IntRegOutIn(2) -- SRL data input
);

SRLC32E_instintreg3 : SRLC32E
generic map (
INIT => X"00000000")
port map (
Q => IntSrlOut(3), -- SRL data output
Q31 => open, -- SRL cascade output pin
A => IntAddr, -- 5-bit shift depth select input
CE => '1', -- Clock enable input
CLK => CLock, -- Clock input
D => IntRegOutIn(3) -- SRL data input
);


IntAddr <= "00100" when (IntEquCnt_d = "0000" and IntSlipCnt_d = "0000") else
           "00011" when (IntEquCnt_d = "0001" and IntSlipCnt_d = "0111") else
           "00010" when (IntEquCnt_d = "0011" and IntSlipCnt_d = "0110") else
           "00001" when (IntEquCnt_d = "0010" and IntSlipCnt_d = "0010") else
           "00000" when (IntEquCnt_d = "0110" and IntSlipCnt_d = "0011") else
           "00100" when (IntEquCnt_d = "0111" and IntSlipCnt_d = "0001");
end Behavioral;
