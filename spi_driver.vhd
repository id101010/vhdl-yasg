----------------------------------------------------------------------------------
-- Project:        YASG (Yet another signal generator)
-- Project Page:   https://github.com/id101010/vhdl-yasg/
-- Authors:        Aaron Schmocker & Timo Lang
-- License:        GPL v3
-- Create Date:    12:51:31 05/17/2016 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity spi_driver is
   Generic (clk_freq: natural:= 50000000;           -- Clock-Frequency in Hz
            adc_res: natural:=12);                  -- Number of bits the DAC has
    Port ( clk : in  STD_LOGIC;                     -- Clock input
           rst: in STD_LOGIC;                       -- High active, async reset
           val : in  unsigned (adc_res-1 downto 0); -- DAC Value to write out 
           sck : out  STD_LOGIC;                    -- SPI SCK Signal (Clock)
           cs : out  STD_LOGIC;                     -- SPI CS Signal (Chip Select)
           mosi : out  STD_LOGIC);                  -- SPI MOSI Signal (Master Out Slave in)
end spi_driver;

architecture Behavioral of spi_driver is
   type states is(S_IDLE, S_WORK); -- FSM: Idle and Work State
   signal state_reg, state_next: states := S_IDLE; -- Current and next state register
   signal counter_reg, counter_next: unsigned(5 downto 0) := (others => '0'); -- Counter for the bit nr
   signal shift_reg, shift_next: unsigned(19 downto 0):= (others => '0'); -- Shift reg for the ouput
begin
   -- State register process (combinational)
   REGS: process (clk, rst) is
   begin -- process start
     if rst = '1' then  -- asynchronous reset (active high)
         state_reg <= S_IDLE;
         counter_reg <= to_unsigned(0,counter_reg'length);
         shift_reg <= to_unsigned(0,shift_reg'length);
     elsif rising_edge(clk) then -- rising clock edge
         state_reg <= state_next;
         counter_reg <= counter_next;
         shift_reg <= shift_next;
     end if;
   end process REGS;

   mosi <= shift_reg(shift_reg'high) when state_reg=S_WORK else '0'; -- Mosi: Highest value of shift reg when in Work state, otherwise 0
   sck <= '1' when state_reg=S_WORK and counter_reg(0)='1' else '0'; -- Sck: High when in work state and lowest bit 1 (shift will be performed when lowest bit = 0)
   cs <= '0' when state_reg =S_WORK else '1'; -- Cs (low active): Low when in state work

   -- Next State logic process (combinational)
   NSL: process (state_reg, counter_reg, shift_reg, val) is
   begin   
      state_next <= state_reg;
      counter_next <= counter_reg;
      shift_next <= shift_reg;
      
      case state_reg is -- switch on current state
         when S_IDLE => -- currently in idle state
            state_next <= S_WORK;
            counter_next <= to_unsigned(0,counter_reg'length);
            
            -- Initialize shift reg
            shift_next(19 downto 16) <= "0011";  -- Command: Write to and Update (Power Up) 
            shift_next(15 downto 12) <= "0000";  -- Adress: DAC0
            shift_next(11 downto 0) <= val;      -- DAC Value (12bit)
            --shift_next(0 downto -3) <= "XXXX"; -- 4x don't care
            
         when S_WORK => -- currently in work state
            if(counter_reg = 24*2 -1) then -- all bits sent
               state_next <= S_IDLE; -- return to idle state
            else -- not all bits sent
               counter_next<= counter_reg + 1; -- increase bit counter
            end if;
            if(counter_reg(0)='1') then -- peform shift when lowest bit = 1, shift will be performed when bit = 0
               shift_next <= shift_left(shift_reg,1);
            end if;
         when others => null; -- do nothing, if we are in a different state
      end case;   
   end process NSL;

end Behavioral;

