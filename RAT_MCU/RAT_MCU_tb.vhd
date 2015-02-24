--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:46:56 02/18/2015
-- Design Name:   
-- Module Name:   C:/Users/Jacobe/Desktop/RAT-MCU-Class-Project-/RAT_MCU/RAT_MCU_tb.vhd
-- Project Name:  RAT_MCU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAT_MCU
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
 
ENTITY RAT_MCU_tb IS
END RAT_MCU_tb;
 
ARCHITECTURE behavior OF RAT_MCU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAT_MCU
    PORT(
         IN_PORT : IN  std_logic_vector(7 downto 0);
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         INT : IN  std_logic;
         OUT_PORT : OUT  std_logic_vector(7 downto 0);
         PORT_ID : OUT  std_logic_vector(7 downto 0);
         IO_STRB : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN_PORT : std_logic_vector(7 downto 0) := (others => '0');
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';
   signal INT : std_logic := '0';

 	--Outputs
   signal OUT_PORT : std_logic_vector(7 downto 0);
   signal PORT_ID : std_logic_vector(7 downto 0);
   signal IO_STRB : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAT_MCU PORT MAP (
          IN_PORT => IN_PORT,
          RESET => RESET,
          CLK => CLK,
          INT => INT,
          OUT_PORT => OUT_PORT,
          PORT_ID => PORT_ID,
          IO_STRB => IO_STRB
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
