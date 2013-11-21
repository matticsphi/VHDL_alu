----------------------------------------------------------------------------------
-- Company: CAL POLY SLO
-- Engineer: Mattics Phi, John Inlow
-- 
-- Create Date:    12:59:55 01/21/2011 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name:  ALU
-- Target Devices: 
-- Tool versions: 
-- Description: The ALU does all the arithmetic and logic operations
-- found inside the processor.  This includes, ADD, ADDC, SUB, SUBC, CMP,
-- AND, OR, EXOR, TEST, LSL, LSR, ROL, ROR, and ASR.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( A,B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           SEL : in  STD_LOGIC_VECTOR (3 downto 0);
           Z,C : out  STD_LOGIC;
           Data : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

signal output : STD_LOGIC_VECTOR (7 downto 0);
signal temp : STD_LOGIC_VECTOR (7 downto 0);

begin
	process (A,B,SEL,Cin)
	begin
		case SEL is
			when "0000" => --ADD
				output <= A + B;
				if ((A+B) = "00000000") then Z <= '1';
				else Z <= '0';
				end if;
				if ((A+B) < A OR (A+B) < B) then C <= '1';
				else C <= '0';
				end if;
			when "0001" => --ADDC
				output <= A + B + Cin;
				if ((A+B+Cin) = "00000000") then Z <= '1';
				else Z <= '0';
				end if;
				if ((A+B+Cin) <= A OR (A+B+Cin) <= B) then C <= '1';
				else C <= '0';
				end if;
			when "0010" => --SUB
				if (B > A) then C <= '1';
				else C <= '0';
				end if;
				output <= A - B; 
				if (A = B) then Z <= '1';
				else Z <= '0';
				end if;
			when "0011" => --SUBC
				if (A < (B+Cin)) then C <= '1';
				else C <= '0';
				end if;
				output <= A - B - Cin;
				if ((A-B-Cin) = "00000000") then Z <= '1';
				else Z <= '0';
				end if;
			when "0100" => --CMP
				if (B > A) then C <= '1';
				else C <= '0';
				end if;
				if (A = B) then Z <= '1';
				else Z <= '0';
				end if;
			when "0101" => --AND
				output <= A AND B;
				if ((A AND B) = "00000000") then Z <= '1';
				else Z <= '0';
				end if;
			when "0110" => --OR
				output <= A OR B;
				if ((A OR B) = "00000000") then Z <= '1';
				else Z <= '0';
				end if;
			when "0111" => --XOR
				output <= A XOR B;
				if ((A XOR B) = "00000000") then Z <= '1';
				else Z <= '0';
				end if;
			when "1000" => --TEST
				if ((A AND B) = "0000000") then Z <= '1';
				else Z <= '0';
				end if;
			when "1001" => --LSL
				output <= A(6 downto 0) & Cin;
				C <= A(7);
				if ((A(6 downto 0) & Cin = "00000000")) then Z <= '1';
				else Z <= '0';
				end if;
			when "1010" => --LSR
				output <= Cin & A(7 downto 1);
				C <= A(0);
				if ((Cin & A(7 downto 1)) = "00000000") then Z <= '1';
				else Z <= '0';
				end if;
			when "1011" => --ROL
				output <= A(6 downto 0) & A(7);
				C <= A(7);
				if ((A(6 downto 0) & A(7)) = "00000000") then Z <= '1';
				else Z <= '0';
				end if;
			when "1100" => --ROR
				output <= A(0) & A(7 downto 1);
				C <= A(0);
				if ((A(0) & A(7 downto 1)) = "00000000") then Z <= '1';
				else Z <= '0';
				end if;
			when "1101" => --ASR
				output <= A(7) & A(7 downto 1);
				C <= A(0);
				if ((A(7) & A(7 downto 1)) = "00000000") then Z <= '1';
				else Z <= '0';
				end if;
			when others =>
				output<= "00000000";
				Z <= '0';
				C <= '0';
		end case;
	end process;
	Data <= output;
end Behavioral;


