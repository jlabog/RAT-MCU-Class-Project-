--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:41:49 02/18/2015
-- Design Name:   
-- Module Name:   C:/Users/Jacobe/Desktop/RAT-MCU-Class-Project-/RAT_MCU/RAT_wrapper_tb.vhd
-- Project Name:  RAT_MCU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAT_wrapper
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RAT_wrapper_tb IS
END RAT_wrapper_tb;
 
ARCHITECTURE behavior OF RAT_wrapper_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAT_wrapper
    PORT(
         LEDS : OUT  std_logic_vector(7 downto 0);
         SWITCHES : IN  std_logic_vector(7 downto 0);
         INT : IN  std_logic;
         RESET : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SWITCHES : std_logic_vector(7 downto 0) := (others => '0');
   signal INT : std_logic := '0';
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal LEDS : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAT_wrapper PORT MAP (
          LEDS => LEDS,
          SWITCHES => SWITCHES,
          INT => INT,
          RESET => RESET,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		for I in 0 to 200 loop
			wait until falling_edge(clk);
		end loop;
		
		INT <= '1';
		
		for I in 0 to 200 loop
			wait until falling_edge(clk);
		end loop;
		
		INT <= '0';
		
		for I in 0 to 200 loop 
			wait until falling_edge(clk);
		end loop;
		
		INT <= '1';
      wait;
   end process;

END;
