----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2018 18:36:02
-- Design Name: 
-- Module Name: Encrypter_test - Behavioral
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

entity Encrypter_test is
--  Port ( );
end Encrypter_test;

architecture Behavioral of Encrypter_test is
component encrypter
   Port ( plaintext : in STD_LOGIC_VECTOR (0 to 127);
        key : in STD_LOGIC_VECTOR (0 to 255);
        ciphertext : out STD_LOGIC_VECTOR (0 to 127));
end component;

signal test_plaintext, test_ciphertext: std_logic_vector(0 to 127);
signal test_key: std_logic_vector(0 to 255);

begin
    enc: encrypter port map(plaintext => test_plaintext, key => test_key, ciphertext => test_ciphertext);
    process
    begin
        test_plaintext <= x"B194BAC80A08F53B366D008E584A5DE4";
        test_key <= x"E9DEE72C8F0C0FA62DDB49F46F73964706075316ED247A3739CBA38303A98BF6";
        wait for 250 ns;
    end process;
end Behavioral;