
--------------------------------------------------------------------------------
-- Company: CAL POLY SLO
-- Engineer: Mattics Phi, John Inlow
--
-- Create Date:   12:56:58 01/24/2011
-- Design Name:   ALU
-- Module Name:   C:/Documents and Settings/sturm121/Desktop/ALU/ALU_tb.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   The ALU does all the arithmetic and logic operations
-- found inside the processor.  This includes, ADD, ADDC, SUB, SUBC, CMP,
-- AND, OR, EXOR, TEST, LSL, LSR, ROL, ROR, and ASR.
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY ALU_tb_vhd IS
END ALU_tb_vhd;

ARCHITECTURE behavior OF ALU_tb_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT ALU
	PORT(
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		Cin : IN std_logic;
		SEL : IN std_logic_vector(3 downto 0);          
		Z : OUT std_logic;
		C : OUT std_logic;
		Data : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL Cin_tb :  std_logic := '0';
	SIGNAL A_tb :  std_logic_vector(7 downto 0) := "00000000";
	SIGNAL B_tb :  std_logic_vector(7 downto 0) := "00000000";
	SIGNAL SEL_tb :  std_logic_vector(3 downto 0) := "0000";

	--Outputs
	SIGNAL Z_tb :  std_logic;
	SIGNAL C_tb :  std_logic;
	SIGNAL Data_tb :  std_logic_vector(7 downto 0);
	
	--Expected
	SIGNAL Z_exp : std_logic := '1';
	SIGNAL C_exp : std_logic := '0';
	SIGNAL Data_exp : std_logic_vector(7 downto 0) := "00000000";
	
	--Clock
	SIGNAL CLK : std_logic;
	CONSTANT clk_period : time := 100 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: ALU PORT MAP(
		A => A_tb,
		B => B_tb,
		Cin => Cin_tb,
		SEL => SEL_tb,
		Z => Z_tb,
		C => C_tb,
		Data => Data_tb
	);
	
	--Test Cases
	A_tb <= "10101010" after 100 ns,
	        "00001010" after 200 ns,
			  "11111111" after 300 ns,
			  "11001000" after 400 ns,
			  "01100100" after 800 ns,
			  "11001000" after 900 ns,
			  "01100100" after 1100 ns,
			  "10101010" after 1300 ns,
			  "11111111" after 1400 ns,
			  "10101010" after 1500 ns,
			  "00000011" after 1700 ns,
			  "10101010" after 1800 ns,
			  "00000011" after 1900 ns,
			  "10101010" after 2000 ns,
			  "00000011" after 2100 ns,
			  "10101010" after 2200 ns,
			  "01010101" after 2300 ns,
			  "00000001" after 2400 ns,
			  "10000000" after 2500 ns,
			  "00000001" after 2700 ns,
			  "10101010" after 2800 ns,
			  "10000000" after 2900 ns,
			  "01000000" after 3200 ns;
			  
	B_tb <= "10101010" after 100 ns,
	        "10100000" after 200 ns,
			  "00000001" after 300 ns,
			  "00110110" after 400 ns,
			  "00110111" after 500 ns,
			  "01100100" after 600 ns,
			  "11001000" after 800 ns,
			  "01100100" after 900 ns,
			  "11001000" after 1100 ns,
			  "11111111" after 1300 ns,
			  "10101010" after 1400 ns,
			  "00000000" after 2400 ns;
			  
	Cin_tb <= '0' after 100 ns,
	          '1' after 200 ns,
				 '0' after 300 ns,
				 '1' after 400 ns,
				 '0' after 600 ns,
				 '1' after 700 ns,
				 '0' after 800 ns,
				 '1' after 1000 ns,
				 '0' after 1100 ns,
				 '1' after 1200 ns,
				 '0' after 1300 ns,
				 '1' after 2600 ns,
				 '0' after 2800 ns,				 
				 '1' after 3000 ns,
				 '0' after 3100 ns;
				 
	SEL_tb <= "0000" after 100 ns,
	          "0001" after 400 ns,
				 "0010" after 600 ns,
				 "0011" after 900 ns,
				 "0100" after 1300 ns,
				 "0101" after 1600 ns,
				 "0110" after 1800 ns,
				 "0111" after 2000 ns,
				 "1000" after 2200 ns,
				 "1001" after 2400 ns,
				 "1010" after 2500 ns,
				 "1011" after 2700 ns,
				 "1100" after 2900 ns,
				 "1101" after 3100 ns;
	
	Data_exp <= "01010100" after 150 ns, -- add
	            "10101010" after 250 ns,
					"00000001" after 350 ns,
					"11111111" after 450 ns, -- addc
					"00000000" after 550 ns,
					"01100100" after 650 ns, -- sub
					"10011100" after 850 ns,
					"01100100" after 950 ns, -- subc
					"01100011" after 1050 ns,
					"10011100" after 1150 ns,
					"10011011" after 1250 ns,
					"10101010" after 1650 ns, -- and
					"00000010" after 1750 ns,
					"10101010" after 1850 ns, -- or
					"10101011" after 1950 ns,
					"00000000" after 2050 ns, -- xor
					"10101001" after 2150 ns,
					"00000010" after 2450 ns, -- lsl
					"01000000" after 2550 ns, -- lsr
					"11000000" after 2650 ns,
					"00000010" after 2750 ns, -- rol
					"01010101" after 2850 ns,
   				"01000000" after 2950 ns, -- ror
					"11000000" after 3150 ns, -- asr
					"00100000" after 3250 ns;
					
	Z_exp <= '0' after 150 ns,
	         '1' after 350 ns,
				'0' after 450 ns,
				'1' after 550 ns,
				'0' after 650 ns,
				'1' after 1550 ns,
				'0' after 1650 ns,
				'1' after 2050 ns,
				'0' after 2150 ns,
				'1' after 2350 ns,
				'0' after 2450 ns;
				
	C_exp <= '1' after 150 ns,
	         '0' after 250 ns,
				'1' after 350 ns,
				'0' after 450 ns,
				'1' after 550 ns,
				'0' after 650 ns,
				'1' after 850 ns,
				'0' after 950 ns,
				'1' after 1150 ns,
				'0' after 1450 ns,
				'1' after 2850 ns,
  				'0' after 2950 ns;

	--clock cycle 50ns up and 50ns down
	clk_process: process
	begin
		CLK <= '0';
		wait for clk_period/2;
		CLK <= '1';
		wait for clk_period/2;
	end process;

	tb : PROCESS
	BEGIN

		wait for 100 ns;

		assert ((Data_tb = Data_exp) and (Z_tb = Z_exp) and (C_tb = C_exp))
		 report "Mismatch at t=" & time'image(now) &
		  " Data_tb=" & integer'image(conv_integer(Data_tb)) &
		  " Data_exp=" & integer'image(conv_integer(Data_exp)) &
		  " Z_tb=" & std_logic'image(Z_tb) &
		  " Z_exp=" & std_logic'image(Z_exp) &
		  " C_tb=" & std_logic'image(C_tb) &
		  " C_exp=" & Std_logic'image(C_exp)
		  severity failure;

		assert false
		 report "No error found (t=" & time'image(now) & ")"
		 severity note;
	END PROCESS;

END;

