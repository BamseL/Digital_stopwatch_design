----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:20:56 03/31/2019 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
    Port ( clock_100hz : in  STD_LOGIC;
			  reset : in std_logic;
			  enable : in std_logic;
           led_0 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_1 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_3 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_4 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_6 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_7 : out  STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is

---------------------------------------
component counter_10 is
    Port ( clock_one : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           c_out : out  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0));
end component counter_10; 
------------------------------------------
component counter_6 is
    Port ( clock_one : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           c_out : out  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0));
end component counter_6;
--------------------------------------------
signal c_out_0,c_out_1,c_out_3,c_out_4,
				c_out_6,c_out_7: std_logic;--½øÎ»Êä³ö
signal reset_text:std_logic;

begin
reset_text<='1' when (reset='1' or c_out_7='1') else '0';
C0:counter_10 port map(clock_100hz,reset_text,enable,c_out_0,led_0);
C1:counter_10 port map(clock_100hz,reset_text,c_out_0,c_out_1,led_1);
C3:counter_10 port map(clock_100hz,reset_text,c_out_1,c_out_3,led_3);
C4:counter_6 port map(clock_100hz,reset_text,c_out_3,c_out_4,led_4);
C6:counter_10 port map(clock_100hz,reset_text,c_out_4,c_out_6,led_6);
C7:counter_6 port map(clock_100hz,reset_text,c_out_6,c_out_7,led_7);


end Behavioral;

