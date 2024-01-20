----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2023 20:19:17
-- Design Name: 
-- Module Name: AdcClockProcess - Behavioral
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
use IEEE.std_logic_UNSIGNED.all;
use IEEE.std_logic_arith.all;
library UNISIM;
use UNISIM.VCOMPONENTS.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AdcClockProcess is
  Port (IntBitClkRst         : in  std_logic;
        BitClkEna            : in  std_logic;
        IntClkCtrlOut        : in  std_logic_vector(7 downto 0);
        BitClk_RefClkIn      : in  std_logic;
        BitClkAlignWarn      : out std_logic;
        BitClkInvrtd         : out std_logic;
        IntClkCtrlDlyInc     : out std_logic;
        IntClkCtrlDlyCe      : out std_logic;
        BitClkDone           : out std_logic  
   );
end AdcClockProcess;

architecture Behavioral of AdcClockProcess is

type StateType is (Idle, A, B, C, D, E, F, G, G1, H, K, K1, K2, IdlyIncDec, Done);
signal State     : StateType;
signal ReturnState : StateType;

signal IntProceedCnt       : std_logic_vector(2 downto 0);
signal IntProceedCntTc_d   : std_logic;
signal IntCalVal           : std_logic_vector(1 downto 0);
signal IntProceed          : std_logic;
signal IntClkCtrlDone      : std_logic;
signal IntProceedCntTc     : std_logic;
signal IntCal              : std_logic;
signal IntVal              : std_logic;
signal IntProceedDone      : std_logic;
signal IntClkCtrlAlgnWrn   : std_logic;
signal IntClkCtrlInvrtd    : std_logic;
signal PassedSubstate      : std_logic;
signal IntNumIncDecIdly    : std_logic_vector(3 downto 0);
signal IntTimeOutCnt       : std_logic_vector(3 downto 0);
signal IntStepCnt          : std_logic_vector(3 downto 0);
signal IntAction           : std_logic_vector(1 downto 0);
signal IntCalValReg        : std_logic_vector(1 downto 0);
signal IntTurnAroundBit    : std_logic;


begin


IntCal  <= IntClkCtrlOut(7) and IntClkCtrlOut(6) and IntClkCtrlOut(5) and IntClkCtrlOut(4) and
           IntClkCtrlOut(3) and IntClkCtrlOut(2) and IntClkCtrlOut(1) and IntClkCtrlOut(0); 
           
Intval <= '1' when IntClkCtrlOut = "11111111" else
         '1' when IntClkCtrlOut = "00000000" else
         '0'; 
         
proceed: process (BitClkEna, IntBitClkRst, BitClk_RefClkIn, IntProceedDone, IntClkCtrlDone)
begin
    if (IntBitClkRst = '1') then
        IntProceedCnt <= "000";
        IntProceedCntTc_d <= '0';
        IntCalVal <= "00";
        IntProceed <= '0';
    elsif(rising_edge(BitClk_RefClkIn)) then
        if(BitClkEna = '1' and  IntClkCtrlDone = '0') then
           IntProceedCnt <= IntProceedCnt + 1;
           IntProceedCntTc_d <= IntProceedCntTc;
           if (IntProceedCntTc_d = '1') then
               IntProceed <= '1';
               IntCalVal <= IntCal & IntVal;
            elsif (IntProceedDone = '1') then
               IntProceed <= '0';   
            end if;
         end if;
    end if;
end process;            
               
IntProceedCntTc <= '1' when (IntProceedCnt = "110") else
                   '0';

BitClkAlignWarn <= IntClkCtrlAlgnWrn;
BitClkInvrtd    <= IntClkCtrlInvrtd;  
BitClkDone      <= IntClkCtrlDone;                                

state_process: process(BitClk_RefClkIn, IntBitClkRst, BitClkEna, IntProceed, IntCalVal)
subtype ActCalVal is std_logic_vector (4 downto 0);
begin
     if(IntBitClkRst = '1') then 
        State <= Idle;
        ReturnState <= Idle;
        passedSubState <= '0';
        ----------
        IntNumIncDecIdly    <= "0000";
        IntAction           <= "00";
        IntClkCtrlDlyInc    <= '1';
        IntClkCtrlDlyCe     <= '0';  
        IntClkCtrlDone      <= '0';
        IntClkCtrlAlgnWrn   <= '0';
        IntClkCtrlInvrtd    <= '0';
        IntTurnAroundBit    <= '0';       
        IntProceedDone      <= '0';
        IntClkCtrlDone      <= '0';
        IntCalValReg        <= "00";
        IntTimeOutCnt       <= "0000";
        IntStepCnt          <= "0000";
     elsif (rising_edge(BitClk_RefClkIn)) then
        if(BitClkEna = '1' and IntClkCtrlDone = '0') then
           case State is
           
           when Idle =>
                IntProceedDone <= '0';
                PassedSubState <= '0';
                IntStepCnt <=  "0000";
                
                case ActCalVal'(IntAction & IntCalVal & IntProceed) is 
                
                when "00001" => State <= A; 
                when "01001" => State <= B; 
                when "10001" => State <= B;
                when "11001" => State <= B;
                when "01111" => State <= C;
                when "01101" => State <= D;
                when "01011" => State <= D;
                when "00011" => State <= E;
                when "00101" => State <= E;
                when "00111" => State <= E;
                when "10011" => State <= F; 
                when "11011" => State <= F; 
                when "10101" => State <= F; 
                when "11101" => State <= F; 
                when "10111" => State <= F; 
                when "11111" => State <= F; 
                when others => State <= Idle;
                
                end case;
           
           when A =>
               IntAction <= "01";
               State <= B;                               
           
           when B =>      
                if(PassedSubState = '1') then
                   PassedSubState <= '0';
                   IntProceedDone <= '1';
                   State <= Idle;
                elsif(IntTimeOutCnt = "1111") then
                   IntTimeOutCnt <= "0000";
                   IntAction     <= "00";
                   IntClkCtrlAlgnWrn <= '1';
                   IntProceedDone    <= '1';
                   State             <= Idle;
               else
                   IntTimeOutCnt <= IntTimeOutCnt + 1;
                   IntNumIncDecIdly <= "0010";
                   ReturnState <= State;
                   IntProceedDone <= '1';
                   IntClkCtrlDlyInc <= '1';
                   State <= IdlyIncDec;
               end if;
               
          when C =>
               IntNumIncDecIdly    <= "0010";
               ReturnState         <= Done;  
               IntClkCtrlDlyInc    <= '0';
               State <= IdlyIncDec;
               
          when D =>
               IntClkCtrlInvrtd <= '1';
               State <= C;
               
          when E =>     
               IntCalValReg <= IntCalVal;
               IntAction <= "10";               
               IntProceedDone <= '1';  
               IntNumIncDecIdly <= "0001";
               State <= IdlyIncDec;  
               ReturnState <= Idle;
               IntClkCtrlDlyInc <= '1';
               
          when F =>
               if(IntCalVal /= IntCalValReg) then
                   State <= G; 
               else
                   if(IntStepCnt = "1111") then
                      if (IntTurnAroundBit = '0') then
                          State <= H;
                      elsif(IntCalValReg = "11") then
                          State <= K;
                      else
                          State <= K1;
                      end if;
                   else
                      IntStepCnt <= IntStepCnt + 1;
                      IntNumIncDecIdly <= "0001";
                      IntProceedDone <= '1';
                      ReturnState <= Idle;
                      IntClkCtrlDlyInc <= '1';
                      State <= IdlyIncDec;
                   end if;
               end if;
               
           when G =>
               if(IntCalValReg /= "01") then
                  IntClkCtrlInvrtd <= '1';
                  State <= G1;
               else
                  State <= G1;
               end if;
               
          when G1 =>
               if(IntTimeOutCnt = "00") then
                  State <= Done;
               else
                  IntNumIncDecIdly  <= "0010";              
                  ReturnState <= Done;
                  IntClkCtrlDlyInc <= '0';
                  State <= IdlyIncDec;
               end if;
               
           when H =>
                IntTurnaroundBit <= '1';
                IntStepCnt <= IntStepCnt + 1;
                Intaction <= "00";
                IntCalValReg  <= "00";
                IntTimeOUtCnt <= "0000";
                IntNumIncDecIdly <= "0001"; 
                IntProceedDone <= '1';
                ReturnState <= Idle;
                IntClkCtrlDlyInc <= '1';
                State <= IdlyIncDec;
                
           when K =>
                IntNumIncDecIdly <= "1111";
                ReturnState <= K2;
                IntClkCtrlDlyInc <= '1';
                State <= IdlyIncDec;
                
           when K1 =>
                IntNumIncDecIdly <= "1110";
                ReturnState <= K2;
                IntClkCtrlDlyInc <= '1';
                State <= IdlyIncDec;
                
            when K2 => 
                IntNumIncDecIdly <= "0001";
                ReturnState <= Done;
                IntClkCtrlDlyInc <= '1';
                State <= IdlyIncDec;
                
            when IdlyIncDec =>
                if(IntNumIncDecIdly /= "0000") then
                    IntNumIncDecIdly <= IntNumIncDecIdly - 1;
                    IntClkCtrlDlyCe <= '1';
                else
                    IntClkCtrlDlyCe <= '0';
                    PassedSubState <= '1';
                    State <= ReturnState;
                end if;
                
             when Done =>
                  IntClkCtrlDone <= '1';
             end case;
        end if;
    end if;
end process;                                                                 
                                    
               
                      
                
                 
                        

end Behavioral;
