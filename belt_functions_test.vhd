----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2018 17:03:26
-- Design Name: 
-- Module Name: belt_functions_test - Behavioral
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

entity belt_functions_test is
--  Port ( );
end belt_functions_test;

architecture Behavioral of belt_functions_test is
    signal byte_change_test_output: std_logic_vector(0 to 7);
    signal G_transformation_test_output: std_logic_vector(0 to 31);
    
begin
    process
        variable byte_change_test: std_logic_vector(0 to 7);
        variable G_transformation_test: std_logic_vector(0 to 31);
    begin
        byte_change_test := x"F5";
        byte_change_test_output <= byte_change(byte_change_test);
        wait for 25 ns;
        byte_change_test := x"8A";
        byte_change_test_output <= byte_change(byte_change_test);
        wait for 25 ns;
        G_transformation_test := x"F5A2739A";
        G_transformation_test_output <= G_transformation(G_transformation_test, 5);
        wait for 25 ns;
        G_transformation_test_output <= G_transformation(G_transformation_test, 13);
        wait for 25 ns;
        G_transformation_test_output <= G_transformation(G_transformation_test, 21);
        wait for 25 ns;
        G_transformation_test := x"8A6C56E7";
        G_transformation_test_output <= G_transformation(G_transformation_test, 5);
        wait for 25 ns;
        G_transformation_test_output <= G_transformation(G_transformation_test, 13);
        wait for 25 ns;
        G_transformation_test_output <= G_transformation(G_transformation_test, 21);
        wait for 25 ns;
    end process;
end Behavioral;
