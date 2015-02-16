----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:32:59 02/09/2015 
-- Design Name: 
-- Module Name:    scr - Behavioral 
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

entity scr is
	port (
		clk      : in  std_logic;
		scr_oe   : in  std_logic;
		scr_we   : in  std_logic;
		scr_addr : in  std_logic_vector(7 downto 0);
		scr_data : inout std_logic_vector(9 downto 0)
		);
end scr;

architecture arch of scr is

	type struc_mem_type is array(255 downto 0) of
		std_logic_vector(9 downto 0);
		
	signal memory_reg  : struc_mem_type := (others => (others => '0'));
	signal memory_next : std_logic_vector(9 downto 0);
	
begin

	process (clk)
	begin
		if (clk'event and clk = '1') then
			memory_reg(to_integer(unsigned(scr_addr))) <= memory_next;
		end if;
	end process;

	memory_next <= scr_data when scr_we = '1' and scr_oe = '0' else
						memory_reg(to_integer(unsigned(scr_addr)));
						
	scr_data <= memory_reg(to_integer(unsigned(scr_addr))) when scr_we = '0' and scr_oe = '1' else
					(others => 'Z');

end arch;