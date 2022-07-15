--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:11:10 04/02/2019
-- Design Name:   
-- Module Name:   F:/2016050201017/time/text_frequence.vhd
-- Project Name:  time
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: frequence
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
 
ENTITY text_frequence IS
END text_frequence;
 
ARCHITECTURE behavior OF text_frequence IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT frequence
    PORT(
         clock : IN  std_logic;
         clock_100hz : OUT  std_logic;
         clock_led : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';

 	--Outputs
   signal clock_100hz : std_logic;
   signal clock_led : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: frequence PORT MAP (
          clock => clock,
          clock_100hz => clock_100hz,
          clock_led => clock_led
        );

   -- Clock process definitions
	process
		begin
			clock <= '0';
			wait for 10 ns;
			clock <= '1';
			wait for 10 ns;
	end process;
 


END;
