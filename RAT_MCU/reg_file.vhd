----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:57:39 02/08/2015 
-- Design Name: 
-- Module Name:    reg_file - Behavioral 
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
use ieee.numeric_std.all;

entity registerfile is
	port (clk        : in  std_logic;
			dx_oe  	  : in  std_logic;
			wr         : in  std_logic;
			d_in       : in  std_logic_vector(7 downto 0);
			adrx, adry : in  std_logic_vector(4 downto 0);
			dx_out     : out std_logic_vector(7 downto 0);
			dy_out     : out std_logic_vector(7 downto 0));
end registerfile;

architecture arch of registerfile is
	
	type reg_file_type is array(31 downto 0) of
		std_logic_vector(7 downto 0);
	
	signal memory_reg : reg_file_type;
	signal memory_next : std_logic_vector(7 downto 0);
	
begin
	
	process (clk)
	begin
			if (clk'event and clk = '1') then
				memory_reg(to_integer(unsigned(adrx))) <= memory_next;
			end if;
	end process;
	
	memory_next <= d_in when wr = '1' else
						memory_reg(to_integer(unsigned(adrx)));
	
	dx_out <= memory_reg(to_integer(unsigned(adrx))) when dx_oe = '1' else
				 (others => 'Z');
				 
	dy_out <= memory_reg(to_integer(unsigned(adry)));
	
end arch;