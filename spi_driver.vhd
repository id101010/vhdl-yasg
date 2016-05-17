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
	signal counter, counter_next: unsigned(5 downto 0) := (others => '0'); 
	signal data: unsigned(23 downto 0);
begin
	REGS: process (clk, rst) is
	begin                                   -- process start
	  if rst = '1' then                 -- asynchronous reset (active high)
			state_reg <= S_IDLE;
			counter <= to_unsigned(0,counter'length);
	  elsif rising_edge(clk) then         -- rising clock edge
			state_reg <= state_next;
			counter <= counter_next;
	  end if;
	end process REGS;

	data(23 downto 20) <= "0011";  --Command: Write to and Update (Power Up) 
	data(19 downto 16) <= "0000";  --Adress: DAC0
	data(15 downto 4) <= val; -- DAC Value (12bit)
	data(3 downto 0) <= "0000"; -- 4x don't care

	mosi <= data(23 - to_integer(counter srl 1)) when state_reg=S_WORK else '0';
	sck <= '1' when state_reg=S_WORK and counter(0)='1' else '0';
	cs <= '1' when state_reg =S_IDLE else '0';

	NSL: process (state_reg, counter) is
	begin   
		state_next <= state_reg;
		counter_next <= counter;
		case state_reg is -- switch on current state
			when S_IDLE => -- currently in idle state
				state_next <= S_WORK;
				counter_next <= to_unsigned(0,counter'length);
			when S_WORK => -- currently in work state
				if(counter = 24*2 -1) then
					state_next <= S_IDLE;
				else
					counter_next<= counter + 1;
				end if;
			when others => null; -- do nothing, if we are in a different state
		end case;	
	end process NSL;

end Behavioral;

