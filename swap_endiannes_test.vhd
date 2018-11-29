----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.11.2018 01:26:53
-- Design Name: 
-- Module Name: swap_endiannes_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

library xil_defaultlib;
use xil_defaultlib.belt_functions.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity swap_endiannes_test is
--  Port ( );
end swap_endiannes_test;

architecture Behavioral of swap_endiannes_test is
signal result_32: std_logic_vector(0 to 31);
begin
    process
    variable a: std_logic_vector(0 to 31);
    begin
        a := x"C8BA94B1";
        result_32 <= swap_endian(a);
        wait for 25 ns;
        a := x"3BF5080A";
        result_32 <= swap_endian(a);
        wait for 25 ns;
        a := x"8E006D36";
        result_32 <= swap_endian(a);
        wait for 25 ns;
        a := x"E45D4A58";
        result_32 <= swap_endian(a);
        wait for 25 ns;
    end process;
end Behavioral;
