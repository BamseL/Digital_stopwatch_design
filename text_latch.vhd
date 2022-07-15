--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:27:37 04/14/2019
-- Design Name:   
-- Module Name:   F:/2016050201017/2016050201017/time/text_latch.vhd
-- Project Name:  time
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: latch
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
 
ENTITY text_latch IS
END text_latch;
 
ARCHITECTURE behavior OF text_latch IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT latch
    PORT(
         latch_signal : IN  std_logic;
         led_0 : IN  std_logic_vector(3 downto 0);
         led_1 : IN  std_logic_vector(3 downto 0);
         led_3 : IN  std_logic_vector(3 downto 0);
         led_4 : IN  std_logic_vector(3 downto 0);
         led_6 : IN  std_logic_vector(3 downto 0);
         led_7 : IN  std_logic_vector(3 downto 0);
         latch_0 : OUT  std_logic_vector(3 downto 0);
         latch_1 : OUT  std_logic_vector(3 downto 0);
         latch_3 : OUT  std_logic_vector(3 downto 0);
         latch_4 : OUT  std_logic_vector(3 downto 0);
         latch_6 : OUT  std_logic_vector(3 downto 0);
         latch_7 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal latch_signal : std_logic := '0';
   signal led_0 : std_logic_vector(3 downto 0) := (others => '0');
   signal led_1 : std_logic_vector(3 downto 0) := (others => '0');
   signal led_3 : std_logic_vector(3 downto 0) := (others => '0');
   signal led_4 : std_logic_vector(3 downto 0) := (others => '0');
   signal led_6 : std_logic_vector(3 downto 0) := (others => '0');
   signal led_7 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal latch_0 : std_logic_vector(3 downto 0);
   signal latch_1 : std_logic_vector(3 downto 0);
   signal latch_3 : std_logic_vector(3 downto 0);
   signal latch_4 : std_logic_vector(3 downto 0);
   signal latch_6 : std_logic_vector(3 downto 0);
   signal latch_7 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: latch PORT MAP (
          latch_signal => latch_signal,
          led_0 => led_0,
          led_1 => led_1,
          led_3 => led_3,
          led_4 => led_4,
          led_6 => led_6,
          led_7 => led_7,
          latch_0 => latch_0,
          latch_1 => latch_1,
          latch_3 => latch_3,
          latch_4 => latch_4,
          latch_6 => latch_6,
          latch_7 => latch_7
        );

   -- Clock process definitions
	process
		begin
			latch_signal<='0';
			wait for 10 ns;
			latch_signal<='1';
			wait for 10 ns;
	end process;
	
	process
		begin
			led_0<="0000";
			wait for 1 ns;
			led_0<="0001";
			wait for 1 ns;
			led_0<="0010";
			wait for 1 ns;
			led_0<="0011";
			wait for 1 ns;
			led_0<="0100";
			wait for 1 ns;
			led_0<="0101";
			wait for 1 ns;
			led_0<="0110";
			wait for 1 ns;
			led_0<="0111";
			wait for 1 ns;
			led_0<="1000";
			wait for 1 ns;
	end process;
	
	process
		begin
			led_1<="0000";
			wait for 10 ns;
			led_1<="0001";
			wait for 10 ns;
			led_1<="0010";
			wait for 10 ns;
			led_1<="0011";
			wait for 10 ns;
			led_1<="0100";
			wait for 10 ns;
			led_1<="0101";
			wait for 10 ns;
			led_1<="0110";
			wait for 10 ns;
			led_1<="0111";
			wait for 10 ns;
			led_1<="1000";
			wait for 10 ns;
	end process;
	
	process
		begin
			led_3<="0000";
			wait for 100 ns;
			led_3<="0001";
			wait for 100 ns;
			led_3<="0010";
			wait for 100 ns;
			led_3<="0011";
			wait for 100 ns;
			led_3<="0100";
			wait for 100 ns;
			led_3<="0101";
			wait for 100 ns;
			led_3<="0110";
			wait for 100 ns;
			led_3<="0111";
			wait for 100 ns;
			led_3<="1000";
			wait for 100 ns;
	end process;
	
	process
		begin
			led_4<="0000";
			wait for 1 ms;
			led_4<="0001";
			wait for 1 ms;
	end process;
	
	process
		begin
			led_6<="0000";
			wait for 1 ms;
			led_6<="0001";
			wait for 1 ms;
	end process;

	process
		begin
			led_7<="0000";
			wait for 1 ms;
			led_7<="0001";
			wait for 1 ms;
	end process;
END;
