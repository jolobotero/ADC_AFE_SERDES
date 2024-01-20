----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2023 21:30:32
-- Design Name: 
-- Module Name: FCLK_GenPulse - Behavioral
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
	use IEEE.std_logic_1164.all;
	use IEEE.std_logic_UNSIGNED.all;
library UNISIM;
	use UNISIM.VCOMPONENTS.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FCLK_GenPulse is
  Port (Clk   : in std_logic; 
        Ena   : in std_logic;
        SigIn      : In std_logic; 
        SigOut     : out std_logic  );
end FCLK_GenPulse;

architecture Behavioral of FCLK_GenPulse is

component  FCLK_GenPulse_Fdcr is
  Port (D        : in std_logic;
        CE       : in std_logic; 
        C        : in std_logic; 
        R        : in std_logic;
        Q        : out std_logic);
end  component;
signal IntSigClr    : std_logic;

begin

GenPulse_Fdcr_1: FCLK_GenPulse_Fdcr 
  Port map(D => SigIn,
        CE   => Ena, 
        C    => Clk,  
        R   => IntSigClr,
        Q   => SigOut);

GenPulse_Fdcr_2: FCLK_GenPulse_Fdcr 
  Port map(D => SigIn,
        CE   => '1', 
        C    => Clk,  
        R   => '0',
        Q   => IntSigClr);


end Behavioral;
