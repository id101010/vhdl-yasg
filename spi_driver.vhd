----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:51:31 05/17/2016 
-- Design Name: 
-- Module Name:    spi_driver - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spi_driver is
	Generic (clk_freq: natural:= 50000000;
             adc_res: natural:=12);
    Port ( clk : in  STD_LOGIC;
			  rst: in STD_LOGIC;
           val : in  unsigned (adc_res-1 downto 0);
           sck : out  STD_LOGIC;
           cs : out  STD_LOGIC;
           mosi : out  STD_LOGIC);
end spi_driver;

architecture Behavioral of spi_driver is
	type states is(S_IDLE, S_WORK);
	signal state_reg, state_next: states := S_IDLE;
	signal counter_reg, counter_next: unsigned(5 downto 0) := (others => '0'); 
	signal shift_reg, shift_next: unsigned(19 downto 0):= (others => '0'); 
begin
	REGS: process (clk, rst) is
	begin                                   -- process start
	  if rst = '1' then                 -- asynchronous reset (active high)
			state_reg <= S_IDLE;
			counter_reg <= to_unsigned(0,counter_reg'length);
			shift_reg <= to_unsigned(0,shift_reg'length);
	  elsif rising_edge(clk) then         -- rising clock edge
			state_reg <= state_next;
			counter_reg <= counter_next;
			shift_reg <= shift_next;
	  end if;
	end process REGS;

	mosi <= shift_reg(shift_reg'high) when state_reg=S_WORK else '0';
	sck <= '1' when state_reg=S_WORK and counter_reg(0)='1' else '0';
	cs <= '1' when state_reg =S_IDLE else '0';

	NSL: process (state_reg, counter_reg, shift_reg, val) is
	begin   
		state_next <= state_reg;
		counter_next <= counter_reg;
		shift_next <= shift_reg;
		case state_reg is -- switch on current state
			when S_IDLE => -- currently in idle state
				state_next <= S_WORK;
				counter_next <= to_unsigned(0,counter_reg'length);
				
				shift_next(19 downto 16) <= "0011";  --Command: Write to and Update (Power Up) 
				shift_next(15 downto 12) <= "0000";  --Adress: DAC0
				shift_next(11 downto 0) <= val; -- DAC Value (12bit)
				--shift_next(0 downto -3) <= "XXXX"; -- 4x don't care
				
			when S_WORK => -- currently in work state
				if(counter_reg = 24*2 -1) then
					state_next <= S_IDLE;
				else
					counter_next<= counter_reg + 1;
				end if;
				if(counter_reg(0)='1') then
					shift_next <= shift_left(shift_reg,1);
				end if;
			when others => null; -- do nothing, if we are in a different state
		end case;	
	end process NSL;

end Behavioral;

