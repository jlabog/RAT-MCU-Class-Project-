----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:37 02/09/2015 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu is
	port (
		cin    : in  std_logic;
		a, b   : in  std_logic_vector(7 downto 0);
		sel    : in  std_logic_vector(3 downto 0);		
		c, z   : out std_logic;
		result : out std_logic_vector(7 downto 0)
	);
end alu;

architecture arch of alu is
begin
	
	process ( A, B, SEL, Cin )
		variable res : std_logic_vector(8 downto 0) := (others => '0');
	begin
	
		RESULT <= x"00";
		C <= '0';
		Z <= '0';
		res := (others => '0');
		case (SEL) is
			when "0000" =>
				res := ( '0' & A ) + ( '0' & B );
				RESULT <= res(7 downto 0);
				C <= res(8);
			when x"1" =>
				res := ( '0' & A ) + ( '0' & B ) + Cin;
				RESULT <= res(7 downto 0);
				C <= res(8);
			when x"2" =>
				res := ( '1' & A ) - ( '1' & B );
				RESULT <= res(7 downto 0);
				C <= res(8);
			when x"3" => 
				res := ( '1' & A ) - ( '1' & B ) - Cin;
				RESULT <= res(7 downto 0);
				C <= res(8); 
			when x"4" =>
				res := ( '1' & A ) - ( '1' & B );
				C <= res(8);
			when x"5" =>
				res(7 downto 0) := A and B;
				result <= res(7 downto 0);
				C <= '0';
			when x"6" =>
				res(7 downto 0) := A or B;
				result <= res(7 downto 0);
				C <= '0';
			when x"7" =>
				res(7 downto 0) := A xor B;
				RESULT <= res(7 downto 0);
				C <= '0';
			when x"8" =>
				res(7 downto 0) := A and B;
				C <= '0';
			when x"9" =>
				res(7 downto 0) := A(6 downto 0) & CIN;
				res(8) := A(7);
				C <= res(8);
				RESULT <= res(7 downto 0);
			when x"A" => 
				res(7 downto 0) := CIN & A(7 downto 1);
				res(8) := A(0);
				C <= res(8);
				RESULT <= res(7 downto 0);
			when x"B" =>
				res(8) := A(7);
				C <= res(8);
				res(7 downto 0) := A(6 downto 0) & A(7);
				RESULT <= res(7 downto 0);
			when x"C" =>
				res(8) := A(0);
				C <= res(8);
				res(7 downto 0) := A(0) & A(7 downto 1);
				RESULT <= res(7 downto 0);
			when x"D" =>
				res(8) := A(0);
				C <= res(8);
				res(7 downto 0) := A(7) & A(7) & A(6 downto 1);
				RESULT <= res(7 downto 0);
			when x"E" =>
				res(7 downto 0) := B;
				RESULT <= res(7 downto 0);
			when others =>
				RESULT <= (others => '0');
				C <= '0';
				Z <= '0';
		end case; 
		
		if (res = x"00") then
			Z <= '0';
		else
			Z <= '1';
		end if;
	end process;
	
end arch;