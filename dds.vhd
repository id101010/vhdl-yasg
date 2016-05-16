----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:09:53 05/16/2016 
-- Design Name: 
-- Module Name:    dds - Behavioral 
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
use work.helpers.all;

entity dds is
    Generic (clk_freq: natural:= 50000000;
             max_freq: natural := 100000;
             adc_res: natural:=12;
             vector_res: natural :=8 );
    Port ( clk : in  STD_LOGIC;
           freq : in  unsigned (log2_int(max_freq)-1 downto 0);
           form : in  unsigned (1 downto 0);
           amp : out  unsigned (adc_res-1 downto 0);
           update : out  STD_LOGIC);
end dds;

architecture Behavioral of dds is
    constant clk2 : natural := clk_freq/(2**vector_res);
    constant clk2_us :unsigned (log2_int(clk2)-1 downto 0) :=to_unsigned(clk2,log2_int(clk2));
    signal prescale,cnt_prescale :unsigned (log2_int(clk2)-1 downto 0) := (others => '0');   
    signal m, idx : unsigned(vector_res -1  downto 0):= (others => '0');   
    
begin
    prescale <= divide(to_unsigned(clk2,prescale'length),freq);
    m <= resize(divide(freq*prescale,to_unsigned(clk2,prescale'length)),m'length);
    
    P1: process(clk) 
    begin
        if(rising_edge(clk)) then
            if(cnt_prescale >= prescale) then
                cnt_prescale <= to_unsigned(1, prescale'length);
                idx <= (idx+m) mod (2**vector_res);
            else
                cnt_prescale <= cnt_prescale +1;
            end if;
        end if;
    end process P1;


end Behavioral;

