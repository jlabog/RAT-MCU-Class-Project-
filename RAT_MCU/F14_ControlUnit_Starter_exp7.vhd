----------------------------------------------------------------------------------
-- Company:   CPE 233 Productions
-- Engineer:  Various Engineers
-- 
-- Create Date:    20:59:29 02/04/2013 
-- Design Name: 
-- Module Name:    RAT Control Unit
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:  Control unit (FSM) for RAT CPU
--
-- Dependencies: 
--
-- Revision: 
-- 2-17-15
-- *Added RETID and RETIE
-- *ADDED ST_int 
-- *Included INT in process sensitivity list
-- *Modified Execute with branch instruction that chosses 
--  ST_int if INT is asserted.
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


Entity CONTROL_UNIT is
    Port ( CLK           : in   STD_LOGIC;
           C             : in   STD_LOGIC;
           Z             : in   STD_LOGIC;
           INT           : in   STD_LOGIC;
           RESET         : in   STD_LOGIC;
           OPCODE_HI_5   : in   STD_LOGIC_VECTOR (4 downto 0);
           OPCODE_LO_2   : in   STD_LOGIC_VECTOR (1 downto 0);
              
           PC_LD         : out  STD_LOGIC;
           PC_INC        : out  STD_LOGIC;
           PC_MUX_SEL    : out  STD_LOGIC_VECTOR (1 downto 0);
           PC_OE         : out  STD_LOGIC;			  

           SP_LD         : out  STD_LOGIC;
           SP_MUX_SEL    : out  STD_LOGIC_VECTOR (1 downto 0);
 
           RF_WR         : out  STD_LOGIC;
           RF_WR_SEL     : out  STD_LOGIC_VECTOR (1 downto 0);
           RF_OE         : out  STD_LOGIC;

           ALU_OPY_SEL   : out  STD_LOGIC;
           ALU_SEL       : out  STD_LOGIC_VECTOR (3 downto 0);

           SCR_WR        : out  STD_LOGIC;
           SCR_ADDR_SEL  : out  STD_LOGIC_VECTOR (1 downto 0);
           SCR_OE        : out  STD_LOGIC;

           FLG_C_LD      : out  STD_LOGIC;
           FLG_C_SET     : out  STD_LOGIC;
           FLG_C_CLR     : out  STD_LOGIC;
           FLG_SHAD_LD   : out  STD_LOGIC;
           FLG_LD_SEL    : out  STD_LOGIC;
           FLG_Z_LD      : out  STD_LOGIC;
              
           I_FLAG_SET    : out  STD_LOGIC;
           I_FLAG_CLR    : out  STD_LOGIC;

           RST           : out  STD_LOGIC;
           IO_STRB       : out  STD_LOGIC);
end;

architecture Behavioral of CONTROL_UNIT is

   type state_type is (ST_init, ST_fet, ST_exec, ST_int);
      signal PS,NS : state_type;
		
	signal sig_OPCODE_7: std_logic_vector (6 downto 0);
begin
   
   -- concatenate the all opcodes into a 7-bit complete opcode for
	-- easy instruction decoding.
   sig_OPCODE_7 <= OPCODE_HI_5 & OPCODE_LO_2;

   sync_p: process (CLK, NS, RESET)
   begin
      if (RESET = '1') then
	   PS <= ST_init;
	elsif (rising_edge(CLK)) then 
         PS <= NS;
 	end if;
   end process sync_p;


   comb_p: process (sig_OPCODE_7, PS, NS, C, Z, INT)
   begin
   
    	-- preset everything to known values --------------------------
      PC_LD <= '0';   PC_MUX_SEL <= "00";   	  
      PC_OE <= '0';   PC_INC     <= '0';		  			      				

      SP_LD <= '0';   SP_MUX_SEL <= "00";
 
	RF_WR <= '0';   RF_WR_SEL  <= "00";   RF_OE    <= '0';
  
      ALU_OPY_SEL <= '0';  ALU_SEL <= "0000";       			

      SCR_WR <= '0';       SCR_OE <= '0';    SCR_ADDR_SEL <= "00";  
      
      FLG_C_SET  <= '0';   FLG_C_CLR   <= '0'; 
      FLG_C_LD   <= '0';   FLG_Z_LD    <= '0'; 
      FLG_LD_SEL <= '0';   FLG_SHAD_LD <= '0';    

	I_FLAG_SET <= '0';        I_FLAG_CLR <= '0';    

      IO_STRB <= '0';      RST <= '0'; 
            
   case PS is
   
	when ST_int =>
			I_FLAG_CLR <= '1';  
			I_FLAG_SET <= '0';
			PC_MUX_SEL <= "10";
			PC_LD <= '1';
			FLG_SHAD_LD <= '1';
			PC_OE <= '1';
			SCR_WR <= '1';
			SCR_ADDR_SEL <= "11";
			SP_MUX_SEL <= "10";
			SP_LD <= '1';
		NS <= ST_fet;
		
	
	
      -- STATE: the init cycle ------------------------------------
	-- Initialize all control outputs to non-active states and 
      --   Reset the PC and SP to all zeros.
	when ST_init => 
         RST <= '1'; 
	   NS <= ST_fet;
						 	
				
      -- STATE: the fetch cycle -----------------------------------
      when ST_fet => 
         NS <= ST_exec;
         PC_INC <= '1';  -- increment PC
            
            
      -- STATE: the execute cycle ---------------------------------
      when ST_exec => 
			if (INT = '0') then
           NS <= ST_fet;
			else
			  NS <= ST_int;
			end if;
			
        PC_INC <= '0';  -- don't increment PC
				
	     case sig_OPCODE_7 is		

		  -- BRN -------------------
              when "0010000" =>   
					PC_MUX_SEL <= "00";
					PC_LD <= '1';
		  -- BRCS ------------------
				  when "0010100" =>
					if (C = '1') then
					 PC_MUX_SEL <= "00";
					 PC_LD <= '1';
					else
					 PC_LD <= '0';
					 PC_MUX_SEL <= "00";
					end if;
		  -- CMP -------------------
				  when "0001000" =>
					FLG_Z_LD <= '1';
					FLG_C_LD <= '1';
					RF_OE <= '1';
					RF_WR <= '0';
					ALU_OPY_SEL <= '0';
					ALU_SEL <= "0100";
		  -- SUB reg-reg  --------
              when "0000110" =>					
					ALU_OPY_SEL <= '0';
					ALU_SEL <= "0010";
					RF_WR <= '1';
					RF_WR_SEL <= "00";
					RF_OE <= '1';
					FLG_C_LD <= '1';
					FLG_Z_LD <= '1';
					FLG_LD_SEL <= '0';
		  -- IN reg-immed  ------
              when "1100100" | "1100101" | "1100110" | "1100111" =>		                             
					RF_WR <= '1';
					RF_WR_SEL <= "11";
		  -- OUT reg-immed  ------
              when "1101000" | "1101001" | "1101010" | "1101011" =>		               
					IO_STRB <= '1';
					RF_OE <= '1';
		  -- MOV reg-immed  ------
              when "1101100" | "1101101" | "1101110" | "1101111" =>		               
					ALU_OPY_SEL <= '1';
					ALU_SEL <= "1110";
					RF_WR_SEL <= "00";
					RF_WR <= '1';
		  -- CALL ---------------------
					when "0010001" =>
					 PC_OE <= '1';
					 SCR_WR <= '1';
					 SCR_OE <= '0';
					 SCR_ADDR_SEL <= "11";
					 SP_MUX_SEL <= "10";
					 SP_LD <= '1';
					 PC_MUX_SEL <= "00";
					 PC_LD <= '1';
		  -- WSP ----------------------
					when "0101000" =>
					 SP_MUX_SEL <= "00";
					 SP_LD <= '1';
					 RF_OE <= '1';
		  -- RET ----------------------
					when "0110010" =>
					 SCR_OE <= '1';
					 SCR_WR <= '0';
					 PC_MUX_SEL <= "01";
					 PC_LD <= '1';
					 SCR_ADDR_SEL <= "10";
					 SP_MUX_SEL <= "11";
					 SP_LD <= '1';
		  -- RETID --------------------
					when "0110110" =>
					 SCR_OE <= '1';
					 SCR_WR <= '0';
					 PC_MUX_SEL <= "01";
					 PC_LD <= '1';
					 SCR_ADDR_SEL <= "10";
					 SP_MUX_SEL <= "11";
					 SP_LD <= '1';
					 FLG_LD_SEL <= '1';
					 I_FLAG_CLR <= '1';
					 I_FLAG_SET <= '0';
		  -- RETIE ---------------------
					when "0110111" =>
					 SCR_OE <= '1';
					 SCR_WR <= '0';
					 PC_MUX_SEL <= "01";
					 PC_LD <= '1';
					 SCR_ADDR_SEL <= "10";
					 SP_MUX_SEL <= "11";
					 SP_LD <= '1';
					 FLG_LD_SEL <= '1';
					 I_FLAG_CLR <= '0';
					 I_FLAG_SET <= '1';
		  -- PUSH ---------------------
				   when "0100101" =>
				    RF_OE <= '1';
					 RF_WR <= '0';
					 SCR_WR <= '1';
					 SCR_OE <= '0';
					 SCR_ADDR_SEL <= "11";
					 SP_MUX_SEL <= "10";
					 SP_LD <= '1';
		  -- SEI -------------------------
					when "0110100" =>
					 I_FLAG_SET <= '1';
					 I_FLAG_CLR <= '0';
		  -- CLI -------------------------
					when "0110101" =>
					 I_FLAG_CLR <= '1';
					 I_FLAG_SET <= '0';
		  -- POP -------------------------
					when "0100110" =>
					 SCR_WR <= '0';
					 SCR_OE <= '1';
					 RF_WR_SEL <= "01";
					 RF_WR <= '1';
					 RF_OE <= '0';
					 SCR_ADDR_SEL <= "10";
					 SP_MUX_SEL <= "11";
					 SP_LD <= '1';
              when others =>		-- for inner case
                  NS <= ST_fet;       
            end case; -- inner execute case statement


          when others =>    -- for outer case
               NS <= ST_fet;		    
			 
				 
	    end case;  -- outer init/fetch/execute case
       
   end process comb_p;
   
   
end Behavioral;




