----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:41:25 03/31/2019 
-- Design Name: 
-- Module Name:    latch - Behavioral 
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

entity latch is
    Port ( latch_signal : in  STD_LOGIC;
           led_0 : in  STD_LOGIC_VECTOR (3 downto 0);
           led_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           led_3 : in  STD_LOGIC_VECTOR (3 downto 0);
           led_4 : in  STD_LOGIC_VECTOR (3 downto 0);
           led_6 : in  STD_LOGIC_VECTOR (3 downto 0);
           led_7 : in  STD_LOGIC_VECTOR (3 downto 0);
           latch_0 : out  STD_LOGIC_VECTOR (3 downto 0);
           latch_1 : out  STD_LOGIC_VECTOR (3 downto 0);
           latch_3 : out  STD_LOGIC_VECTOR (3 downto 0);
           latch_4 : out  STD_LOGIC_VECTOR (3 downto 0);
           latch_6 : out  STD_LOGIC_VECTOR (3 downto 0);
           latch_7 : out  STD_LOGIC_VECTOR (3 downto 0));
end latch;

architecture Behavioral of latch is
begin
process(latch_signal,led_0,led_1,led_3,led_4,led_6,led_7)
	begin
	if latch_signal='1' then
		latch_0<=led_0;
		latch_1<=led_1;
		latch_3<=led_3;
		latch_4<=led_4;
		latch_6<=led_6;
		latch_7<=led_7;
	end if;
end process;
end Behavioral;

