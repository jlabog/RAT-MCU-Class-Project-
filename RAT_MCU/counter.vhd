----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:53:22 02/08/2015 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
	port (clk, rst      : in  std_logic;
			pc_ld, pc_inc : in  std_logic;
			pc_oe         : in  std_logic;
			d_in          : in  std_logic_vector(9 downto 0);
			pc_count      : out std_logic_vector(9 downto 0);
			pc_tri		  : out std_logic_vector(9 downto 0));
end counter;

architecture arch of counter is

	signal count_reg, count_next : unsigned(9 downto 0) := (others => '0');
	
begin

	process (clk, rst) 
	begin
		if (rst = '1') then
			count_reg <= (others => '0');
		elsif (clk'event and clk = '1') then
			count_reg <= count_next;
		end if;
	end process;

	count_next <= unsigned(d_in) when pc_ld = '1' else
					  count_reg + 1  when pc_inc = '1' else
					  count_reg;
	
	pc_count <= std_logic_vector(count_reg);
	
	pc_tri <= std_logic_vector(count_reg) when pc_oe = '1' else
				 (others => 'Z');

end arch;