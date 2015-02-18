----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:45:30 02/17/2015 
-- Design Name: 
-- Module Name:    INT_FLAG - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;

entity INT_FLAG is
	port (clk  : in  std_logic;
			set  : in  std_logic;
			clr  : in  std_logic;
			flag : out std_logic);
end INT_FLAG;

architecture arch of INT_FLAG is

	signal flag_reg, flag_next : std_logic;
	
begin
	
	process (clk)
	begin
		if (clk'event and clk = '1') then
			flag_reg <= flag_next;
		end if;
	end process;
		
	flag_next <= '1' when set = '1' else
					 '0' when clr = '1' else
					 flag_reg;
						 
	flag <= flag_reg;	
		
end arch;