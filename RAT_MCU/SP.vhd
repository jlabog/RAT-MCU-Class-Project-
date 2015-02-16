----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:53:00 02/09/2015 
-- Design Name: 
-- Module Name:    SP - Behavioral 
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

entity sp is 
	port(
		clk, rst : in  std_logic;
		sp_ld    : in  std_logic;
		sp_in    : in  std_logic_vector(7 downto 0);
		sp_out   : out std_logic_vector(7 downto 0)
		);
end sp;

architecture arch of sp is

	signal sp_reg, sp_next : unsigned(7 downto 0);

begin 

	process(clk, rst)
	begin
		if (rst = '1') then
			sp_reg <= (others => '0');
		elsif (clk'event and clk = '1') then
			sp_reg <= sp_next;
		end if;
	end process;
	
	sp_next <= unsigned(sp_in) when sp_ld = '1' else
				  sp_reg;
	
	sp_out <= std_logic_vector(sp_reg);

end arch;
