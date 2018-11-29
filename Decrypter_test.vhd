----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2018 18:36:02
-- Design Name: 
-- Module Name: Decrypter_test - Behavioral
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

entity Decrypter_test is
--  Port ( );
end Decrypter_test;

architecture Behavioral of Decrypter_test is
component decrypter
   Port ( ciphertext : in STD_LOGIC_VECTOR (0 to 127);
        key : in STD_LOGIC_VECTOR (0 to 255);
        plaintext : out STD_LOGIC_VECTOR (0 to 127));
end component;

signal test_plaintext, test_ciphertext: std_logic_vector(0 to 127);
signal test_key: std_logic_vector(0 to 255);

begin
    dec: decrypter port map(plaintext => test_plaintext, key => test_key, ciphertext => test_ciphertext);
    process
    begin
        test_ciphertext <= x"E12BDC1AE28257EC703FCCF095EE8DF1";
        test_key <= x"92BD9B1CE5D141015445FBC95E4D0EF2682080AA227D642F2687F93490405511";
        wait for 250 ns;
    end process;
end Behavioral;