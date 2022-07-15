----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:27 03/31/2019 
-- Design Name: 
-- Module Name:    key_debounce - Behavioral 
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

entity key_debounce is
    Port ( clk : in  STD_LOGIC;
           key_in : in  STD_LOGIC;
           key_out : out  STD_LOGIC);
end key_debounce;

architecture Behavioral of key_debounce is
	signal cnt	 : std_logic_vector(2 downto 0);
	signal k1,k2 : std_logic;

begin
p1:process(key_in,clk)
	begin
		if key_in = '1' then
			cnt <= "000";
		elsif falling_edge(clk) then
			if cnt /= 7 then
				cnt <= cnt + 1;
			end if;
		end if;
end process;

p2:process(clk)
	begin
		if falling_edge(clk) then
			if cnt /= 7 then
				k1 <= '0';
			else
				k1 <= '1';
			end if;
			k2 <=	k1;
		end if;
end process;

p3: key_out <= (not k1)	and k2;
end Behavioral;

