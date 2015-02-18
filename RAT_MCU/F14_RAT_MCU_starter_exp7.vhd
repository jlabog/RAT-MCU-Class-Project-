----------------------------------------------------------------------------------
-- Company: Ratner Engineering
-- Engineer: James Ratner
-- 
-- Create Date:    20:59:29 02/04/2013 
-- Design Name: 
-- Module Name:    RAT_MCU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Starter MCU file for RAT MCU. 
--
-- Dependencies: 
--
-- Revision: 2-17-15
-- *Added INT_FLAG
-- *Added signals for INT_FLAG module
-- *Added AND gate for INT_FLAG and INT 
-- *Added signals for output of AND gate and 
--  connected to control unit
-- *Added shadow flag modules along with signals
-- *Added multiplexors for normal flag modules along 
--  signals
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RAT_MCU is
    Port ( IN_PORT : in  STD_LOGIC_VECTOR (7 downto 0);
           RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           INT    : in  STD_LOGIC;
           OUT_PORT : out  STD_LOGIC_VECTOR (7 downto 0);
           PORT_ID : out  STD_LOGIC_VECTOR (7 downto 0);
           IO_STRB : out  STD_LOGIC);
end RAT_MCU;



architecture Behavioral of RAT_MCU is
	
	component shad_flag
	port (clk  : in  std_logic;
			ld   : in  std_logic;
			d    : in  std_logic;
			flag : out std_logic);
	end component;
	
	component int_flag 
	port (clk  : in  std_logic;
			set  : in  std_logic;
			clr  : in  std_logic;
			flag : out std_logic);
	end component;
	
	component scr 
	port (
		clk      : in  std_logic;
		scr_oe   : in  std_logic;
		scr_we   : in  std_logic;
		scr_addr : in  std_logic_vector(7 downto 0);
		scr_data : inout std_logic_vector(9 downto 0)
		);
	end component;
	
	component sp 
	port(
		clk, rst : in  std_logic;
		sp_ld    : in  std_logic;
		sp_in    : in  std_logic_vector(7 downto 0);
		sp_out   : out std_logic_vector(7 downto 0)
		);
	end component;

	component C_Flag
		port (D    : in  STD_LOGIC; --flag input
            LD   : in  STD_LOGIC; --load Q with the D value
            SET  : in  STD_LOGIC; --set the flag to '1'
            CLR  : in  STD_LOGIC; --clear the flag to '0'
            CLK  : in  STD_LOGIC; --system clock
            Q    : out  STD_LOGIC);
	end component;
	
	component Z_Flag
		port (D    : in  STD_LOGIC; --flag input
            LD   : in  STD_LOGIC; --load Q with the D value
            SET  : in  STD_LOGIC; --set the flag to '1'
            CLR  : in  STD_LOGIC; --clear the flag to '0'
            CLK  : in  STD_LOGIC; --system clock
            Q    : out  STD_LOGIC);
	end component;
	
   component prog_rom  
      port (     ADDRESS : in std_logic_vector(9 downto 0); 
             INSTRUCTION : out std_logic_vector(17 downto 0); 
                     CLK : in std_logic);  
   end component;

   component ALU
       Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
              B : in  STD_LOGIC_VECTOR (7 downto 0);
              Cin : in  STD_LOGIC;
              SEL : in  STD_LOGIC_VECTOR(3 downto 0);
              C : out  STD_LOGIC;
              Z : out  STD_LOGIC;
              RESULT : out  STD_LOGIC_VECTOR (7 downto 0));
   end component;

   component CONTROL_UNIT 
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
   end component;

   component RegisterFile 
       Port ( D_IN   : in     STD_LOGIC_VECTOR (7 downto 0);
              DX_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
              DY_OUT : out    STD_LOGIC_VECTOR (7 downto 0);
              ADRX   : in     STD_LOGIC_VECTOR (4 downto 0);
              ADRY   : in     STD_LOGIC_VECTOR (4 downto 0);
              DX_OE  : in     STD_LOGIC;
              WR     : in     STD_LOGIC;
              CLK    : in     STD_LOGIC);
   end component;

   component PC 
      port ( RST,CLK,PC_LD,PC_OE,PC_INC : in std_logic; 
             FROM_IMMED : in std_logic_vector (9 downto 0); 
             FROM_STACK : in std_logic_vector (9 downto 0); 
             FROM_INTRR : in std_logic_vector (9 downto 0); 
             PC_MUX_SEL : in std_logic_vector (1 downto 0); 
             PC_COUNT : out std_logic_vector (9 downto 0); 
             PC_TRI : out std_logic_vector(9 downto 0)); 
   end component; 

   -- intermediate signals ----------------------------------
   signal s_pc_ld : std_logic := '0'; 
   signal s_pc_inc : std_logic := '0'; 
   signal s_pc_oe : std_logic := '0'; 
   signal s_rst : std_logic := '0'; 
   signal s_pc_mux_sel : std_logic_vector(1 downto 0) := "00"; 
   signal s_pc_count : std_logic_vector(9 downto 0) := (others => '0');   
   signal s_inst_reg : std_logic_vector(17 downto 0) := (others => '0'); 
   
   signal s_multi_bus : std_logic_vector(9 downto 0) := (others => '0'); 
   

   -- helpful aliases ------------------------------------------------------------------
   alias s_ir_immed_bits : std_logic_vector(9 downto 0) is s_inst_reg(12 downto 3); 
   
   -- My Signals
	signal s_b : std_logic_vector(7 downto 0);
	signal s_alu_opy_sel : std_logic;
	signal s_alu_sel : std_logic_vector(3 downto 0);
	signal s_din : std_logic_vector(7 downto 0);
	signal s_result : std_logic_vector(7 downto 0);
	signal s_rf_wr_sel : std_logic_vector(1 downto 0);
	signal s_rf_wr : std_logic;
	signal s_dy_out : std_logic_vector(7 downto 0);
	signal s_dx_oe : std_logic;
	signal s_c_flag : std_logic;
	signal s_c_ld : std_logic;
	signal s_c_set : std_logic;
	signal s_c_clr : std_logic;
	signal s_cin : std_logic;
	signal s_z_out : std_logic;
	signal s_z_in : std_logic;
	signal s_z_ld : std_logic;
	
	-- SCR and Scratch Pointer
	signal s_scr_oe : std_logic;
	signal s_scr_we : std_logic;
	signal s_scr_addr : std_logic_vector(7 downto 0);
	signal s_scr_addr_sel : std_logic_vector(1 downto 0);
	
	signal s_sp_mux_sel : std_logic_vector(1 downto 0);
	signal s_sp_ld  : std_logic;
	signal s_sp_in  : std_logic_vector(7 downto 0);
	signal s_sp_out : std_logic_vector(7 downto 0);
	
	-- INT_FLAG signals
	signal s_int_flag_set : std_logic;
	signal s_int_flag_clr : std_logic;
	signal s_int_flag : std_logic;
   signal s_INT : std_logic;
	
	-- SHADOW FLAG signals
	signal s_flg_ld_sel : std_logic;
	signal s_shad_ld : std_logic;
	signal s_z_shad : std_logic;
	signal s_c_shad : std_logic;
	signal s_ALU_C  : std_logic;
	signal s_ALU_Z  : std_logic;
begin
	
	my_int_flag: int_flag 
	port map (clk  => clk,
			    set  => s_int_flag_set,
			    clr  => s_int_flag_clr,
			    flag => s_int_flag);
				 
				 
   my_prog_rom: prog_rom  
   port map(     ADDRESS => s_pc_count, 
             INSTRUCTION => s_inst_reg, 
                     CLK => CLK); 
	
	s_B <= s_inst_reg(7 downto 0) when s_alu_opy_sel = '1' else
			 s_dy_out;
			 
   my_alu: ALU
   port map ( A => s_multi_bus(7 downto 0),       
              B => s_b,       
              Cin => s_cin,     
              SEL => s_alu_sel,     
              C => s_ALU_C,       
              Z => s_ALU_Z,       
              RESULT => s_result ); 

	s_INT <= s_int_flag and INT;
	
   my_cu: CONTROL_UNIT 
   port map ( CLK           => CLK, 
              C             => s_cin, 
              Z             => s_z_out, 
              INT           => s_INT, 
              RESET         => RESET, 
              OPCODE_HI_5   => s_inst_reg(17 downto 13), 
              OPCODE_LO_2   => s_inst_reg(1 downto 0), 
              
              PC_LD         => s_pc_ld, 
              PC_INC        => s_pc_inc, 
              PC_OE         => s_pc_oe, 
              PC_MUX_SEL    => s_pc_mux_sel, 
				  
              SP_LD         => s_sp_ld, 
              SP_MUX_SEL    => s_sp_mux_sel, 
				  
              RF_WR         => s_rf_wr, 
              RF_WR_SEL     => s_rf_wr_sel, 
              RF_OE         => s_dx_oe, 
  
              ALU_SEL       => s_alu_sel, 
				  ALU_OPY_SEL   => s_alu_opy_sel,
				  
              SCR_WR        => s_scr_we, 
              SCR_OE        => s_scr_oe, 
              SCR_ADDR_SEL  => s_scr_addr_sel,
              
              FLG_C_LD      => s_c_ld, 
              FLG_C_SET     => s_c_set, 
              FLG_C_CLR     => s_c_clr, 
              FLG_SHAD_LD   => s_shad_ld, 
              FLG_LD_SEL    => s_flg_ld_sel, 
              FLG_Z_LD      => s_z_ld, 
              I_FLAG_SET    => s_int_flag_set, 
              I_FLAG_CLR    => s_int_flag_clr, 

              RST           => s_rst,
              IO_STRB       => IO_STRB);
              
	s_din <= IN_PORT when s_rf_wr_sel = "11" else
				s_multi_bus(7 downto 0) when s_rf_wr_sel = "01" else
				s_result when s_rf_wr_sel = "00" else
				x"FF";
				
   my_regfile: RegisterFile 
   port map ( D_IN   => s_din,   
              DX_OUT => s_multi_bus(7 downto 0),   
              DY_OUT => s_dy_out,   
              ADRX   => s_inst_reg(12 downto 8),   
              ADRY   => s_inst_reg(7 downto 3),   
              DX_OE  => s_dx_oe,   
              WR     => s_rf_wr,   
              CLK    => CLK); 


   my_PC: PC 
   port map ( RST        => s_rst,
              CLK        => CLK,
              PC_LD      => s_pc_ld,
              PC_OE      => s_pc_oe,
              PC_INC     => s_pc_inc,
              FROM_IMMED => s_ir_immed_bits,
              FROM_STACK => s_multi_bus,
              FROM_INTRR => (others => '1'),
              PC_MUX_SEL => s_pc_mux_sel,
              PC_COUNT   => s_pc_count,
              PC_TRI     => s_multi_bus); 
	
	s_c_flag <= s_c_shad when s_flg_ld_sel = '1' else
					s_ALU_C;
					
	my_C_FLAG : C_Flag
	port map (D    => s_c_flag,
             LD   => s_c_ld, 
             SET  => s_c_set,
             CLR  => s_c_clr,
             CLK  => CLK,
             Q    => s_cin);
	
	s_z_in <= s_z_shad when s_flg_ld_sel = '1' else
				 s_ALU_Z;
				 
	my_Z_FLAG : Z_FLAG
	port map (D    => s_z_in,
          	 LD   => s_z_ld,
             SET  => '0', --set the flag to '1'
             CLR  => '0',
             CLK  => CLK,
             Q    => s_z_out);
	
	s_scr_addr <= s_dy_out                                 when s_scr_addr_sel = "00" else
					  s_inst_reg(7 downto 0)                   when s_scr_addr_sel = "01" else
					  s_sp_out                                 when s_scr_addr_sel = "10" else
					  std_logic_vector(unsigned(s_sp_out) - 1) when s_scr_addr_sel = "11" else
					  x"ff";
	
	my_SCR : SCR
	port map (
		clk      => clk,
		scr_oe   => s_scr_oe,
		scr_we   => s_scr_we,
		scr_addr => s_scr_addr,
		scr_data => s_multi_bus
	);
	
	s_sp_in <= s_multi_bus(7 downto 0) when s_sp_mux_sel = "00" else
				  std_logic_vector(unsigned(s_sp_out) - 1) when s_sp_mux_sel = "10" else
				  std_logic_vector(unsigned(s_sp_out) + 1) when s_sp_mux_sel = "11" else
				  x"ff";
				  
	my_SP : SP
	port map (
		clk    => clk,
		rst    => s_rst,
		sp_ld  => s_sp_ld,
		sp_in  => s_sp_in,
		sp_out => s_sp_out
	);
	
	my_Z_SHAD_FLAG : SHAD_FLAG
	port map (clk  => clk,
		    	 ld   => s_shad_ld,
			    d    => s_z_out,
			    flag => s_z_shad);
	
	my_C_SHAD_FLAG : SHAD_FLAG
	port map (clk  => clk,
			    ld   => s_shad_ld,
			    d    => s_cin,
			    flag => s_c_shad);
				 
	OUT_PORT <= s_multi_bus(7 downto 0);
	
	PORT_ID <= s_inst_reg(7 downto 0);
end Behavioral;

