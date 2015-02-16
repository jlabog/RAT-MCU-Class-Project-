----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:56:37 02/08/2015 
-- Design Name: 
-- Module Name:    counter_mux - Behavioral 
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

entity counter_mux is
	port (from_immed : in  std_logic_vector(9 downto 0);
			from_stack : in  std_logic_vector(9 downto 0); 
			Ox3ff      : in  std_logic_vector(9 downto 0);
			pc_mux_sel : in  std_logic_vector(1 downto 0);
			d_in		  : out std_logic_vector(9 downto 0));
end counter_mux;

architecture arch of counter_mux is

begin
	
	d_in <= Ox3ff      when pc_mux_sel = "10" else
			  "00" & from_stack(7 downto 0) when pc_mux_sel = "01" else --from_stack when pc_mux_sel = "01" else (Attempting to fix push uncomment when it doesn't work)
			  from_immed when pc_mux_sel = "00" else
			  (others => '1');
	
end arch;