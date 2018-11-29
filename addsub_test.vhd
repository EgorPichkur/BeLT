----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2018 20:33:34
-- Design Name: 
-- Module Name: addsub_test - Behavioral
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

entity addsub_test is
--  Port ( );
end addsub_test;

architecture Behavioral of addsub_test is
signal result, a_out, b_out, c_out: std_logic_vector(0 to 31);
begin
    process
    variable a, b, c: std_logic_vector(0 to 31);
    begin
        a := x"C8BA94B1";
        b := x"2CE7DEE9";
        c := x"00000000";
        a_out <= a;
        b_out <= b;
        c_out <= c;
        result <= modadd(a, b);
        wait for 25 ns;
        a := x"E45D4A58";
        b := x"A60F0C8F";
        a_out <= a;
        b_out <= b;
        c_out <= c;
        result <= modadd(a, b);
        wait for 25 ns;
        a := x"6898DC66";
        b := x"98695EF9";
        c := x"4796396F";
        a_out <= a;
        b_out <= b;
        c_out <= c;
        result <= modadd(a, b, c);
        wait for 25 ns;
        a := x"C12E0720";
        b := x"98695EF9";
        a_out <= a;
        b_out <= b;
        c_out <= c;
        result <= modsub(b, a);
        wait for 25 ns;
    end process;
end Behavioral;
