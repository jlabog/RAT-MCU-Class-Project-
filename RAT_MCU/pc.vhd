----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:57:49 02/08/2015 
-- Design Name: 
-- Module Name:    pc - arch 
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

entity pc is
	port (clk, rst   : in  std_logic;
			pc_inc     : in  std_logic;
			pc_ld		  : in  std_logic;
			pc_oe		  : in  std_logic;
			from_immed : in  std_logic_vector(9 downto 0);
			from_stack : in  std_logic_vector(9 downto 0);
			FROM_INTRR : in  std_logic_vector(9 downto 0);
			pc_mux_sel : in  std_logic_vector(1 downto 0);
			pc_count   : out  std_logic_vector(9 downto 0);
			pc_tri     : out std_logic_vector(9 downto 0));
end pc;

architecture arch of pc is

	signal d_in : std_logic_vector(9 downto 0);
	
begin

	counter_module : entity work.counter(arch)
		port map (clk      => clk,
					 rst      => rst,
					 pc_inc   => pc_inc,
					 pc_ld    => pc_ld,
					 pc_oe    => pc_oe,
					 d_in     => d_in,
					 pc_count => pc_count,
					 pc_tri   => pc_tri);
	
	counter_mux_module : entity work.counter_mux(arch)
		port map (from_immed => from_immed,
					 from_stack => from_stack,
					 Ox3ff      => FROM_INTRR,
					 pc_mux_sel => pc_mux_sel,
					 d_in			=> d_in);
					 
end arch;