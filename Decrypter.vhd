----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2018 17:24:07
-- Design Name: 
-- Module Name: Decrypter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decrypter is
    Port ( ciphertext : in STD_LOGIC_VECTOR (0 to 127);
           key : in STD_LOGIC_VECTOR (0 to 255);
           plaintext : out STD_LOGIC_VECTOR (0 to 127));
end decrypter;

architecture Behavioral of decrypter is
-- round keys type
type vector_array_56by32 is array (1 to 56) of std_logic_vector(0 to 31);
begin
    belt: process(ciphertext, key)
        variable a, b, c, d, e, temp: std_logic_vector(0 to 31);
        variable round_keys: vector_array_56by32;
    begin
        -- initialize round keys
        init: for i in 0 to 6 loop
            round_keys(8*i + 1) := swap_endian(key(0 to 31));
            round_keys(8*i + 2) := swap_endian(key(32 to 63));
            round_keys(8*i + 3) := swap_endian(key(64 to 95));
            round_keys(8*i + 4) := swap_endian(key(96 to 127));
            round_keys(8*i + 5) := swap_endian(key(128 to 159));
            round_keys(8*i + 6) := swap_endian(key(160 to 191));
            round_keys(8*i + 7) := swap_endian(key(192 to 223));
            round_keys(8*i + 8) := swap_endian(key(224 to 255));
        end loop init;
        
        a := swap_endian(ciphertext(0 to 31));
        b := swap_endian(ciphertext(32 to 63));
        c := swap_endian(ciphertext(64 to 95));
        d := swap_endian(ciphertext(96 to 127));
        
        -- main loop
        main: for i in 8 downto 1 loop
            b := b xor G_transformation(modadd(a, round_keys(7*i)), 5);
            c := c xor G_transformation(modadd(d, round_keys(7*i-1)), 21);
            a := modsub(a, G_transformation(modadd(b, round_keys(7*i-2)), 13));
            e := G_transformation(modadd(b, c, round_keys(7*i-3)), 21) xor std_logic_vector(to_unsigned(i, 32));
            b := modadd(b, e);
            c := modsub(c, e);
            d := modadd(d, G_transformation(modadd(c, round_keys(7*i-4)), 13));
            b := b xor G_transformation(modadd(a, round_keys(7*i-5)), 21);
            c := c xor G_transformation(modadd(d, round_keys(7*i-6)), 5);
            -- swap a, b
            temp := a;
            a := b;
            b := temp;
            -- swap c, d
            temp := c;
            c := d;
            d := temp;
            -- swap a, d
            temp := a;
            a := d;
            d := temp;
        end loop main;
        plaintext(0 to 31) <= swap_endian(c);
        plaintext(32 to 63) <= swap_endian(a);
        plaintext(64 to 95) <= swap_endian(d);
        plaintext(96 to 127) <= swap_endian(b);
    end process;
end Behavioral;
