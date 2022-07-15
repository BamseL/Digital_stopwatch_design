----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:10 03/31/2019 
-- Design Name: 
-- Module Name:    time - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
---- Revision 0.01 - File Created
---- Additional Comments: 
----
--Device utilization summary:
-----------------------------
--
--Selected Device : 3s200aft256-5 
--
-- Number of Slices:                       89  out of   1792     4%  
-- Number of Slice Flip Flops:             85  out of   3584     2%  
-- Number of 4 input LUTs:                162  out of   3584     4%  
-- Number of IOs:                          19
-- Number of bonded IOBs:                  19  out of    195     9%  
-- Number of GCLKs:                         3  out of     24    12%  
--
------------------------------------------------------------------------------------
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

entity time is
    Port ( clock : in  STD_LOGIC;
           start_stop : in  STD_LOGIC;
           split_reset : in  STD_LOGIC;
           L : out  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC_VECTOR (7 downto 0));
end time;

architecture Behavioral of time is
---------------------------------------------------
component frequence is
    Port ( clock : in  STD_LOGIC;
           clock_100hz : out  STD_LOGIC;
			  clock_led : out  STD_LOGIC
			  );
end component frequence; 
---------------------------------------------------
component key_debounce is
    Port ( clk : in  STD_LOGIC;
           key_in : in  STD_LOGIC;
           key_out : out  STD_LOGIC);
end component key_debounce;
----------------------------------------------------
component control is
    Port ( clock_100hz : in std_logic;
	        start_stop : in  STD_LOGIC;
           split_reset : in  STD_LOGIC;
           reset : out  STD_LOGIC;
           enable : out  STD_LOGIC;
           show : out  STD_LOGIC);
end component control;
----------------------------------------------------
component counter is
    Port ( clock_100hz : in  STD_LOGIC;
			  reset : in std_logic;
			  enable : in std_logic;
           led_0 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_1 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_3 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_4 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_6 : out  STD_LOGIC_VECTOR (3 downto 0);
           led_7 : out  STD_LOGIC_VECTOR (3 downto 0));
end component counter;
----------------------------------------------------
component latch is
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
end component latch;
----------------------------------------------------
component seg is
    Port ( clock_led : in  STD_LOGIC;
           l_0 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_3 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_4 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_6 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_7 : in  STD_LOGIC_VECTOR (3 downto 0);
           L : out  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC_VECTOR (7 downto 0));
end component seg;
----------------------------------------------------
------------------------------------------------------
----------------------------------------------------
------------------------------------------------------
----------------------------------------------------
------------------------------------------------------
signal clock_t,start_stop_t,split_reset_t,clock_100hz_t,clock_led_t,start_stop_key_out_t,split_reset_key_out_t,reset_t,
		enable_t,show_t:std_logic;
signal led_0_t,led_1_t,led_3_t,led_4_t,led_6_t,led_7_t,latch_0_t,latch_1_t,latch_3_t,latch_4_t,
	latch_6_t,latch_7_t:std_logic_vector(3 downto 0);
		
signal L_t,N_t:std_logic_vector(7 downto 0);
begin
	clock_t<=clock;
	start_stop_t<=start_stop;
	split_reset_t<=split_reset;
	T1:frequence port map (clock_t,clock_100hz_t,clock_led_t);
	T2:key_debounce port map (clock_100hz_t,start_stop_t,start_stop_key_out_t);
	T3:key_debounce port map (clock_100hz_t,split_reset_t,split_reset_key_out_t);
	T4:control port map (clock_100hz_t,start_stop_key_out_t,split_reset_key_out_t,reset_t,enable_t,show_t);
	T5:counter port map (clock_100hz_t,reset_t,enable_t,led_0_t,led_1_t,led_3_t,led_4_t,led_6_t,led_7_t);
	T6:latch port map (show_t,led_0_t,led_1_t,led_3_t,led_4_t,led_6_t,led_7_t,latch_0_t,latch_1_t,latch_3_t,latch_4_t,latch_6_t,
		latch_7_t);
	T7:seg port map (clock_led_t,latch_0_t,latch_1_t,latch_3_t,latch_4_t,latch_6_t,latch_7_t,L_t,N_t);
	L<=L_t;
	N<=N_t;

end Behavioral;

