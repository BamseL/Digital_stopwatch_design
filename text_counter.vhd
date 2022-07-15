--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:51:07 03/31/2019
-- Design Name:   
-- Module Name:   F:/2016050201017/time/text_counter.vhd
-- Project Name:  time
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY text_counter IS
END text_counter;
 
ARCHITECTURE behavior OF text_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         clock_100hz : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         led_0 : OUT  std_logic_vector(3 downto 0);
         led_1 : OUT  std_logic_vector(3 downto 0);
         led_3 : OUT  std_logic_vector(3 downto 0);
         led_4 : OUT  std_logic_vector(3 downto 0);
         led_6 : OUT  std_logic_vector(3 downto 0);
         led_7 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal clock_100hz : std_logic;
   signal reset :  std_logic;
   signal enable :  std_logic;
 	--Outputs
   signal led_0 : std_logic_vector(3 downto 0);
   signal led_1 : std_logic_vector(3 downto 0);
   signal led_3 : std_logic_vector(3 downto 0);
   signal led_4 : std_logic_vector(3 downto 0);
   signal led_6 : std_logic_vector(3 downto 0);
   signal led_7 : std_logic_vector(3 downto 0);


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          clock_100hz => clock_100hz,
          reset => reset,
          enable => enable,
          led_0 => led_0,
          led_1 => led_1,
          led_3 => led_3,
          led_4 => led_4,
          led_6 => led_6,
          led_7 => led_7
        );
	process
		begin
			clock_100hz<='0';
			wait for 10 ns;
			clock_100hz<='1';
			wait for 10 ns;
	end process;

	process
		begin
			reset<='1';
			wait for 10 ns;
			reset<='0';
			wait for 100 ms;
	end process;

	process
		begin
			enable<='1';
			wait for 100 ms;
			enable<='0';
			wait for 10 ns;
	end process;

END;
