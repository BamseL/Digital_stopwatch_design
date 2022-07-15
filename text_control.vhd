--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:08:04 04/14/2019
-- Design Name:   
-- Module Name:   F:/2016050201017/2016050201017/time/text_control.vhd
-- Project Name:  time
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control
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
 
ENTITY text_control IS
END text_control;
 
ARCHITECTURE behavior OF text_control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control
    PORT(
         clock_100hz : IN  std_logic;
         start_stop : IN  std_logic;
         split_reset : IN  std_logic;
         reset : OUT  std_logic;
         enable : OUT  std_logic;
         show : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock_100hz : std_logic := '0';
   signal start_stop : std_logic := '0';
   signal split_reset : std_logic := '0';

 	--Outputs
   signal reset : std_logic;
   signal enable : std_logic;
   signal show : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          clock_100hz => clock_100hz,
          start_stop => start_stop,
          split_reset => split_reset,
          reset => reset,
          enable => enable,
          show => show
        );

   -- Clock process definitions
	process
		begin
			clock_100hz<='1';
			wait for 1 ns;
			clock_100hz<='0';
			wait for 1 ns;
	end process;
	
	process
		begin
			start_stop<='0';
			wait for 50 ns;
			start_stop<='1';
			wait for 50 ns;
	end process;
	
	process
		begin
			split_reset<='0';
			wait for 25 ns;
			split_reset<='1';
			wait for 50 ns;
			split_reset<='0';
			wait for 25 ns;
	end process;

END;
