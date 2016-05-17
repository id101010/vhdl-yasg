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
use IEEE.MATH_REAL.ALL;
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
           amp : out  unsigned (adc_res-1 downto 0));
end dds;

architecture Behavioral of dds is   
    signal m, idx : unsigned(acc_res -1  downto 0):= (others => '0');   
    signal idx_phase : unsigned(phase_res-1 downto 0) := (others => '0');  
    signal amp_rect, amp_saw, amp_tria, amp_sin : unsigned (adc_res-1 downto 0);
    
    type storage is array (((2**phase_res)/4)-1 downto 0) of unsigned (adc_res-2 downto 0);
    function gen_sin_wave return storage is
        variable temp : storage;
        begin
            forLoop: for i in 0 to temp'high loop
                temp(i) := to_unsigned(integer(real((2**(adc_res-1))-1)*sin((real(i)*MATH_PI/2.0)/real(temp'high))),adc_res-1);
            end loop;
        return temp;
    end function gen_sin_wave;
    constant sin_wave : storage := gen_sin_wave;
   
begin

    -- m = fout*(2^n)/fclk
    m <= resize(divide(shift_left(resize(freq,64),acc_res),to_unsigned(clk_freq,64)),m'length);
    idx_phase <= idx(acc_res -1 downto acc_res - phase_res);
       
    amp_rect <= to_unsigned(0,adc_res) when idx_phase(phase_res-1)='0' else 
                to_unsigned((2**adc_res)-1,adc_res);
    
    amp_saw <=  resize(unsigned(((2**adc_res) -1)*idx_phase/2**phase_res),adc_res) ;
    
    amp_tria <= resize(unsigned(((2**adc_res) -1)*idx_phase/2**(phase_res-1)),adc_res)
                when idx_phase(phase_res-1)='0' else 
                resize(unsigned((2**(adc_res+1)) - ((2**adc_res) -1)*idx_phase/2**(phase_res-1)),adc_res);
    
    -- Modulo is only required to prevent a synthesizer warning, but the value is actually never > 2**phase_res/4
    amp_sin <=  to_unsigned((2**(adc_res-1)) - 1,adc_res) + sin_wave(to_integer(idx_phase) mod ((2**phase_res)/4)) when idx_phase(phase_res-1 downto phase_res-2)="00" else
                to_unsigned((2**(adc_res-1)) - 1,adc_res) + sin_wave(to_integer(((2**phase_res)/2)-idx_phase) mod ((2**phase_res)/4)) when idx_phase(phase_res-1 downto phase_res-2)="01" else
                to_unsigned((2**(adc_res-1)) - 1,adc_res) - sin_wave(to_integer(idx_phase-((2**phase_res)/2)) mod ((2**phase_res)/4)) when idx_phase(phase_res-1 downto phase_res-2)="10" else
                to_unsigned((2**(adc_res-1)) - 1,adc_res) - sin_wave(to_integer(((2**phase_res)-1)-idx_phase) mod ((2**phase_res)/4));

    with form select amp <= amp_rect when "00",
                            amp_saw when "01",
                            amp_tria when "10",
                            amp_sin when others;
                            
            
    P1: process(clk) 
    begin
        if(rising_edge(clk)) then
            idx <= (idx+m);
        end if;
    end process P1;


end Behavioral;

