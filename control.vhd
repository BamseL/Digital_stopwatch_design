----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:23:28 03/31/2019 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
    Port ( clock_100hz : in std_logic;
			  start_stop : in  STD_LOGIC;
           split_reset : in  STD_LOGIC;
           reset : out  STD_LOGIC;
           enable : out  STD_LOGIC;
           show : out  STD_LOGIC);
end control;

architecture Behavioral of control is
type state_type is (A,B,C,D);
signal sreg,snext: state_type :=A;
signal s: std_logic_vector(1 downto 0);

begin
	s(0)<=split_reset;
	s(1)<=start_stop;
process(clock_100hz)
	begin
	if rising_edge(clock_100hz) then
		sreg <=snext;
	end if;
	end process;

process(sreg,s)
	begin
		case sreg is
			when A	=> case s is
								when	"00" 	=> snext <=A;
								when	"01" 	=> snext <=D;
								when	"11" 	=> snext <=A;
								when	"10" 	=> snext <=B;
								when others	=> snext <=A;
							end case;
			when B	=> case s is
								when	"00" 	=> snext <=B;
								when	"01" 	=> snext <=C;
								when	"11" 	=> snext <=A;
								when	"10" 	=> snext <=A;
								when others	=> snext <=B;
							end case;
			when C	=> case s is
								when	"00" 	=> snext <=C;
								when	"01" 	=> snext <=C;
								when	"11" 	=> snext <=C;
								when	"10" 	=> snext <=A;
								when others	=> snext <=C;
							end case;
			when D	=> case s is
								when	"00" 	=> snext <=D;
								when	"01" 	=> snext <=A;
								when	"11" 	=> snext <=D;
								when	"10" 	=> snext <=D;
								when others	=> snext <=D;
							end case;
			when others	=> snext<=A;
		end case;
end process;

with sreg select
	reset <= '0'	when	A,
				'0'	when	B,
				'1'	when	C,
				'0'	when	D;

with sreg select
	enable <= '1'	when	A,
			 	 '0'	when	B,
			 	 '0'	when	C,
				 '1'	when	D;

with sreg select
	show <=  '1'	when	A,
				'1'	when	B,
				'1'	when	C,
				'0'	when	D;

end Behavioral;

