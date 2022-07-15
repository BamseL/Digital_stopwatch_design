--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:40:20 04/14/2019
-- Design Name:   
-- Module Name:   F:/2016050201017/2016050201017/time/test_seg.vhd
-- Project Name:  time
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seg
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
 
ENTITY test_seg IS
END test_seg;
 
ARCHITECTURE behavior OF test_seg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seg
    PORT(
         clock_led : IN  std_logic;
         l_0 : IN  std_logic_vector(3 downto 0);
         l_1 : IN  std_logic_vector(3 downto 0);
         l_3 : IN  std_logic_vector(3 downto 0);
         l_4 : IN  std_logic_vector(3 downto 0);
         l_6 : IN  std_logic_vector(3 downto 0);
         l_7 : IN  std_logic_vector(3 downto 0);
         L : OUT  std_logic_vector(7 downto 0);
         N : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock_led : std_logic := '0';
   signal l_0 : std_logic_vector(3 downto 0) := (others => '0');
   signal l_1 : std_logic_vector(3 downto 0) := (others => '0');
   signal l_3 : std_logic_vector(3 downto 0) := (others => '0');
   signal l_4 : std_logic_vector(3 downto 0) := (others => '0');
   signal l_6 : std_logic_vector(3 downto 0) := (others => '0');
   signal l_7 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal L : std_logic_vector(7 downto 0);
   signal N : std_logic_vector(7 downto 0);

   -- Clock period definitions
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seg PORT MAP (
          clock_led => clock_led,
          l_0 => l_0,
          l_1 => l_1,
          l_3 => l_3,
          l_4 => l_4,
          l_6 => l_6,
          l_7 => l_7,
          L => L,
          N => N
        );

   -- Clock process definitions
	process
		begin
			clock_led <= '0';
			wait for 1 ns;
			clock_led <= '1';
			wait for 1 ns;
	end process;

	process
		begin
			l_0<="0000";
			wait for 1 ns;
			l_0<="0001";
			wait for 1 ns;
			l_0<="0010";
			wait for 1 ns;
			l_0<="0011";
			wait for 1 ns;
			l_0<="0100";
			wait for 1 ns;
			l_0<="0101";
			wait for 1 ns;
			l_0<="0110";
			wait for 1 ns;
			l_0<="0111";
			wait for 1 ns;
			l_0<="1000";
			wait for 1 ns;
	end process;
	
	process
		begin
			l_1<="0000";
			wait for 10 ns;
			l_1<="0001";
			wait for 10 ns;
			l_1<="0010";
			wait for 10 ns;
			l_1<="0011";
			wait for 10 ns;
			l_1<="0100";
			wait for 10 ns;
			l_1<="0101";
			wait for 10 ns;
			l_1<="0110";
			wait for 10 ns;
			l_1<="0111";
			wait for 10 ns;
			l_1<="1000";
			wait for 10 ns;
	end process;
	
	process
		begin
			l_3<="0000";
			wait for 100 ns;
			l_3<="0001";
			wait for 100 ns;
			l_3<="0010";
			wait for 100 ns;
			l_3<="0011";
			wait for 100 ns;
			l_3<="0100";
			wait for 100 ns;
			l_3<="0101";
			wait for 100 ns;
			l_3<="0110";
			wait for 100 ns;
			l_3<="0111";
			wait for 100 ns;
			l_3<="1000";
			wait for 100 ns;
	end process;
	
	process
		begin
			l_4<="0000";
			wait for 1 ms;
			l_4<="0001";
			wait for 1 ms;
	end process;
	
	process
		begin
			l_6<="0000";
			wait for 1 ms;
			l_6<="0001";
			wait for 1 ms;
	end process;

	process
		begin
			l_7<="0000";
			wait for 1 ms;
			l_7<="0001";
			wait for 1 ms;
	end process;
END;
