----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:03:47 02/17/2015 
-- Design Name: 
-- Module Name:    SHAD_FLAG - Behavioral 
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

entity shad_flag is
	port (clk  : in  std_logic;
			ld   : in  std_logic;
			d    : in  std_logic;
			flag : out std_logic);
end shad_flag;

architecture arch of shad_flag is

	signal flag_reg, flag_next : std_logic;

begin

	process (clk)
	begin
		if (clk'event and clk = '1') then
			flag_reg <= flag_next;
		end if;
	end process;

	flag_next <= d when ld = '1' else
					 flag_reg;
					 
	flag <= flag_reg;
	
end arch;