----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2023 18:20:02
-- Design Name: 
-- Module Name: FclkCntEqu - Behavioral
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

entity FclkCntEqu is
    Port (clock         : in std_logic;
          RstIn         : in std_logic;
          DataIn        : in std_logic_vector(3 downto 0);
          DataOut       : out std_logic_vector(3 downto 0); 
          final         : out std_logic );
end FclkCntEqu;

architecture Behavioral of FclkCntEqu is

component  IntRegOutModule is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           Clock   : in std_logic;
           IntRstIn_d: in std_logic;
           IntEqu    : out std_logic;
           IntRegOutIn: out std_logic_vector(3 downto 0));
end  component;

component IntRstFfModule is
  Port (clock      : in std_logic;
        IntRstSet  : in std_logic;
        RstIn      : in std_logic;
        IntRstIn_d : out std_logic );
end component;

component EquCntModule is
  Port (Clock          : in std_logic; 
        IntEqu         : in std_logic;
        IntRstIn_d     : in std_logic;
        IntEquCnt_d    : out STD_LOGIC_VECTOR (3 downto 0)
        
         );
end component;

component IntSlipCntModule is
  Port (clock            : in std_logic;
        IntPulse         : in std_logic;
        IntSlipCntRst    : in std_logic;
        IntSlipCnt_d     : out STD_LOGIC_VECTOR (3 downto 0) );
end component;

component IntSrlModule is
  Port (Clock            : in std_logic;
        IntRegOutIn      : in std_logic_vector(3 downto 0);
        IntEquCnt_d     :  in STD_LOGIC_VECTOR (3 downto 0);
        IntSlipCnt_d     : in STD_LOGIC_VECTOR (3 downto 0);
        IntSrlOut        : out std_logic_vector(3 downto 0) );
end component;

component DataOutModule is
  Port (clock         : in std_logic; 
        IntRstIn_d       : in std_logic;
        IntSrlOut        : in std_logic_vector(3 downto 0);
        DataOut       : out std_logic_vector(3 downto 0) );
end component;

component RSTSetModule is
  Port (clock      : in std_logic;
        IntEqu           : in std_logic;
        IntRstIn_d       : in std_logic;
        IntSlipCnt_d     : in STD_LOGIC_VECTOR (3 downto 0);
        IntEquCnt_d      : in STD_LOGIC_VECTOR (3 downto 0);
        IntPulse         : out std_logic;
        IntSlipCntRst    : out std_logic;
        IntRstSet        : out std_logic;
        Final            : out std_logic );
end component;

--signal IntEquCnt       : std_logic_vector(3 downto 0);
signal IntEquCnt_d     : STD_LOGIC_VECTOR (3 downto 0);

--signal IntSlipCnt       : std_logic_vector(3 downto 0);
signal IntSlipCnt_d     : STD_LOGIC_VECTOR (3 downto 0);

signal IntRstSet        : std_logic;
--signal IntRstIn         : std_logic;
signal IntPulse         : std_logic;
signal IntEqu           : std_logic;
signal IntRegOutIn      : std_logic_vector(3 downto 0);
--signal IntRstFf_d       : std_logic_vector(6 downto 0):= "0000000";
signal IntRstIn_d       : std_logic;
signal IntSrlOut        : std_logic_vector(3 downto 0);
--signal IntAddr          : std_logic_vector(4 downto 0);
--signal IntEqu_d         : std_logic;
signal IntSlipCntRst    : std_logic;


begin


RstSet1: RSTSetModule 
  Port map(clock      => clock,
        IntEqu        => IntEqu,
        IntRstIn_d    => IntRstIn_d,
        IntSlipCnt_d  => IntSlipCnt_d,
        IntEquCnt_d   => IntEquCnt_d,
        IntPulse      => IntPulse,
        IntSlipCntRst => IntSlipCntRst,
        IntRstSet     => IntRstSet,
        Final         => Final );






------------------------------------------------------------
------------------------------------------------------------

IntRegOut1: IntRegOutModule 
    Port map( DataIn => DataIn,
           Clock   => Clock,
           IntRstIn_d => IntRstIn_d,
           IntEqu    => IntEqu,
           IntRegOutIn => IntRegOutIn);
           

IntRstFf1: IntRstFfModule 
  Port map(clock => clock,
        IntRstSet  => IntRstSet,
        RstIn      => RstIn,
        IntRstIn_d => IntRstIn_d );



-----------------------------------------------------------------
----------------------------------------------
EquCnt1: EquCntModule 
  Port map(Clock   => clock, 
        IntEqu     => IntEqu,
        IntRstIn_d  => IntRstIn_d,
        IntEquCnt_d   => IntEquCnt_d
        
         );

IntSrl1: IntSrlModule 
  Port map(Clock => clock,
        IntRegOutIn   => IntRegOutIn,
        IntEquCnt_d   => IntEquCnt_d,
        IntSlipCnt_d  => IntSlipCnt_d,
        IntSrlOut     => IntSrlOut );

----------------------------------------------------------
---------------------------------------
dataOut1: DataOutModule 
  Port map(clock => clock, 
        IntRstIn_d  => IntRstIn_d,
        IntSrlOut   => IntSrlOut,
        DataOut    => DataOut );

--------------------------------------------------------------------------
--------------------------------------------------------------------------




slipCnt1: IntSlipCntModule 
  Port map (clock => clock,
        IntPulse  => IntPulse,
        IntSlipCntRst => IntSlipCntRst,
        IntSlipCnt_d  => IntSlipCnt_d );



        
--------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------


           
          
                   

end Behavioral;
