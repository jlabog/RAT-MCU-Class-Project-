----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:44:02 02/11/2015 
-- Design Name: 
-- Module Name:    Z_Flag - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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


entity Z_Flag is
    Port ( D    : in  STD_LOGIC; --flag input
           LD   : in  STD_LOGIC; --load Q with the D value
           SET  : in  STD_LOGIC; --set the flag to '1'
           CLR  : in  STD_LOGIC; --clear the flag to '0'
           CLK  : in  STD_LOGIC; --system clock
           Q    : out  STD_LOGIC); --flag output
end Z_Flag;

architecture arch of Z_Flag is
   signal s_D : STD_LOGIC := '0';  
begin
    process(CLK)
    begin
        if( rising_edge(CLK) ) then
            if( LD = '1' ) then
                s_D <= D;
            elsif( SET = '1' ) then
                s_D <= '1';
            elsif( CLR = '1' ) then
                s_D <= '0';
         end if;
      end if;
    end process;	

    Q <= s_D; 
    
end arch;

