----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:36 05/23/2016 
-- Design Name: 
-- Module Name:    controller - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
    Port ( clk : in  STD_LOGIC;
			  rst: in STD_LOGIC;
           enc_updown : in  STD_LOGIC;
           enc_ce : in  STD_LOGIC;
			  enc_btn: in STD_LOGIC;
           enc_err : in  STD_LOGIC;
           freq_out : out  unsigned (16 downto 0));
end controller;

architecture Behavioral of controller is
	signal freq_reg, freq_next : unsigned(16 downto 0)  := to_unsigned(1000,17);
   signal digpos_reg, digpos_next : unsigned(2 downto 0)  := to_unsigned(0,3);
	signal btn_old_reg, btn_old_next : std_logic := '0';

	type storage is array (4 downto 0) of unsigned (16 downto 0);
	constant bases : storage := (to_unsigned(1,17),to_unsigned(10,17),
											to_unsigned(100,17),to_unsigned(1000,17),
											to_unsigned(10000,17));
											
	signal digpos_base : unsigned(16 downto 0);
begin

	proc1: process(clk,rst) 
	begin
		if(rst='1') then
			freq_reg <= to_unsigned(1000,17);
			digpos_reg <= to_unsigned(0,3);
			btn_old_reg <= '0';
		elsif(rising_edge(clk)) then
			freq_reg <= freq_next;
			digpos_reg <= digpos_next;
			btn_old_reg <= btn_old_next;
		end if;
	end process proc1;
	
	freq_out <= freq_reg;
	digpos_base <= bases(to_integer(digpos_reg));
	
	proc2: process(freq_reg,enc_updown,enc_ce,enc_err,enc_btn,digpos_reg,digpos_base,btn_old_reg) 
	begin
		freq_next <= freq_reg;
		digpos_next <= digpos_reg;
		btn_old_next <= enc_btn;
		
		if(enc_ce='1' and enc_err='0') then
			if(enc_updown='1') then
				freq_next <= freq_reg + digpos_base;
			else
				freq_next <= freq_reg - digpos_base;
			end if;
		elsif(enc_btn ='1' and btn_old_reg='0') then
			if(digpos_reg = to_unsigned(4,3)) then
				digpos_next <= to_unsigned(0,3);
			else
				digpos_next <= digpos_reg + 1;
			end if;
		end if;
	
	end process proc2;
	
end Behavioral;

