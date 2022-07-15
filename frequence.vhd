----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:14 03/31/2019 
-- Design Name: 
-- Module Name:    frequence - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequence is
    Port ( clock : in  STD_LOGIC;
           clock_100hz : out  STD_LOGIC;
			  clock_led : out  STD_LOGIC
			  );
end frequence;

architecture Behavioral of frequence is
signal counter : std_logic_vector(3 downto 0) := (others => '0');
signal counter1 : std_logic_vector(14 downto 0) := (others => '0');
signal s,s1 : std_logic:='0';
begin

process(clock)--1khz
	begin
	if rising_edge(clock) then
		counter1<=counter1 +1;
		if counter1=23999 then
			s1<=not s1;
			counter1<=(others => '0');
		end if;
	end if;
end process;

process(s1)--100hz
	begin
	if rising_edge(s1) then
		counter<=counter +1;
		if counter=4 then
			s<=not s;
			counter<=(others => '0');
		end if;
	end if;
end process;


clock_100hz<=s;
clock_led<=s1;


end Behavioral;

