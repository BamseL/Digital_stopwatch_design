----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:58 03/31/2019 
-- Design Name: 
-- Module Name:    seg - Behavioral 
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

entity seg is
    Port ( clock_led : in  STD_LOGIC;
           l_0 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_3 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_4 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_6 : in  STD_LOGIC_VECTOR (3 downto 0);
           l_7 : in  STD_LOGIC_VECTOR (3 downto 0);
           L : out  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC_VECTOR (7 downto 0));
end seg;

architecture Behavioral of seg is
-----------------------------------------------
component bcd is
    Port ( A : out  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (3 downto 0));
end component bcd;
----------------------------------------------
type state_type is (A1,B1,C1,D1,E1,F1,G1,H1);
signal sreg,snext: state_type;
signal A,B,C,D,E,F,G,H:	STD_LOGIC_vector (7 downto 0);
signal s0,s1,s3,s4,s6,s7 :std_logic_vector (3 downto 0);
------------------------------------------
begin
process(clock_led)
begin
  if clock_led'event and clock_led='1' then
    sreg <=snext;
  end if;
end process;

process(sreg)  --×´Ì¬Ñ­»· 1kHZ
  begin
	    case sreg is
		    when A1    =>  snext <=B1;
		    when B1    =>  snext <=C1;
		    when C1    =>  snext <=D1;
		    when D1    =>  snext <=E1;
			 when E1    =>  snext <=F1;
			 when F1    =>  snext <=G1;
			 when G1		=>  snext <=H1;
			 when H1		=>	 snext <=A1;
		    when others => snext <=A1;
	    end case; 			 
end process;
  s0<=l_0;
  s1<=l_1;
  s3<=l_3;
  s4<=l_4;
  s6<=l_6;
  s7<=l_7;
  C<="11111101";
  F<="11111101";
  U0:bcd port map (A,s0);
  U1:bcd port map (B,s1);
  U3:bcd port map (D,s3);
  U4:bcd port map (E,s4);
  U6:bcd port map (G,s6);
  U7:bcd port map (H,s7);
  
  with sreg select
  L	<=	A	when A1,
			B	when B1,
			C	when C1,
			D	when D1,
			E	when E1,
			F	when F1,
			G	when G1,
			H	when H1;
			
  with sreg select
  N	<=	"11111110"	when A1,
			"11111101"	when B1,
			"11111011"	when C1,
			"11110111"	when D1,
			"11101111"	when E1,
			"11011111"	when F1,
			"10111111"	when G1,
			"01111111"	when H1;
end Behavioral;

