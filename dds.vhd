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
             acc_res: natural:=32;
             phase_res: natural:=15);
    Port ( clk : in  STD_LOGIC;
           freq : in  unsigned (log2_int(max_freq)-1 downto 0);
           form : in  unsigned (1 downto 0);
           amp : out  signed (adc_res-1 downto 0);
           update : out  STD_LOGIC);
end dds;

architecture Behavioral of dds is   
    signal m, idx : unsigned(acc_res -1  downto 0):= (others => '0');   
    signal idx_phase : unsigned(phase_res-1 downto 0) := (others => '0');  
    signal amp_rect, amp_saw, amp_tria, amp_sin : signed (adc_res-1 downto 0);
   
begin
    -- m = f0*2^n/fc
    m <= resize(divide(shift_left(resize(freq,64),acc_res),to_unsigned(clk_freq,64)),m'length);
    idx_phase <= idx(acc_res -1 downto acc_res - phase_res);
       
    amp_rect <= to_signed((2**(adc_res-1)) - 1,adc_res) when idx_phase(phase_res-1)='0' else 
                to_signed(-(2**(adc_res-1)),adc_res);
    
    amp_saw <=  to_signed(-(2**(adc_res-1)),adc_res)
                + signed(resize(unsigned(((2**adc_res) -1)*idx_phase/2**phase_res),adc_res)) ;
    
    amp_tria <= to_signed(-(2**(adc_res-1)),adc_res)
                + signed(resize(unsigned(((2**adc_res) -1)*idx_phase/2**(phase_res-1)),adc_res)) 
                when idx_phase(phase_res-1)='0' else 
                resize(to_signed((2**(adc_res))-1,adc_res+1)
                - signed(resize(unsigned(((2**adc_res) -1)*idx_phase/2**(phase_res-1)),adc_res)),adc_res);
    
    
    
    amp <= amp_tria;
        
        
        
    P1: process(clk) 
    begin
        if(rising_edge(clk)) then
            idx <= (idx+m);
        end if;
    end process P1;


end Behavioral;

