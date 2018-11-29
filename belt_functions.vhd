----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2018 16:46:22
-- Design Name: 
-- Module Name: belt_functions - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package belt_functions is
    function byte_change(input : in std_logic_vector(0 to 7)) return std_logic_vector;
    function G_transformation(input : in std_logic_vector(0 to 31); shift_size : in integer) return std_logic_vector;
    function modadd(op1 : in std_logic_vector(0 to 31); op2 : in std_logic_vector(0 to 31)) return std_logic_vector;
    function modadd(op1 : in std_logic_vector(0 to 31); op2 : in std_logic_vector(0 to 31); op3 : in std_logic_vector(0 to 31)) return std_logic_vector;
    function modsub(op1 : in std_logic_vector(0 to 31); op2 : in std_logic_vector(0 to 31)) return std_logic_vector;
    function swap_endian(vec : in std_logic_vector(0 to 31)) return std_logic_vector;
end package belt_functions;

package body belt_functions is
    function byte_change(input : in std_logic_vector(0 to 7)) return std_logic_vector is
        variable temp: integer range 0 to 255;
        variable output: std_logic_vector(0 to 7);
    begin
        temp := to_integer(unsigned(input));
        case temp is
            when 0 => output := x"B1";
            when 1 => output := x"94";
            when 2 => output := x"BA";
            when 3 => output := x"C8";
            when 4 => output := x"0A";
            when 5 => output := x"08";
            when 6 => output := x"F5";
            when 7 => output := x"3B";
            when 8 => output := x"36";
            when 9 => output := x"6D";
            when 10 => output := x"00";
            when 11 => output := x"8E";
            when 12 => output := x"58";
            when 13 => output := x"4A";
            when 14 => output := x"5D";
            when 15 => output := x"E4";
            when 16 => output := x"85";
            when 17 => output := x"04";
            when 18 => output := x"FA";
            when 19 => output := x"9D";
            when 20 => output := x"1B";
            when 21 => output := x"B6";
            when 22 => output := x"C7";
            when 23 => output := x"AC";
            when 24 => output := x"25";
            when 25 => output := x"2E";
            when 26 => output := x"72";
            when 27 => output := x"C2";
            when 28 => output := x"02";
            when 29 => output := x"FD";
            when 30 => output := x"CE";
            when 31 => output := x"0D";
            when 32 => output := x"5B";
            when 33 => output := x"E3";
            when 34 => output := x"D6";
            when 35 => output := x"12";
            when 36 => output := x"17";
            when 37 => output := x"B9";
            when 38 => output := x"61";
            when 39 => output := x"81";
            when 40 => output := x"FE";
            when 41 => output := x"67";
            when 42 => output := x"86";
            when 43 => output := x"AD";
            when 44 => output := x"71";
            when 45 => output := x"6B";
            when 46 => output := x"89";
            when 47 => output := x"0B";
            when 48 => output := x"5C";
            when 49 => output := x"B0";
            when 50 => output := x"C0";
            when 51 => output := x"FF";
            when 52 => output := x"33";
            when 53 => output := x"C3";
            when 54 => output := x"56";
            when 55 => output := x"B8";
            when 56 => output := x"35";
            when 57 => output := x"C4";
            when 58 => output := x"05";
            when 59 => output := x"AE";
            when 60 => output := x"D8";
            when 61 => output := x"E0";
            when 62 => output := x"7F";
            when 63 => output := x"99";
            when 64 => output := x"E1";
            when 65 => output := x"2B";
            when 66 => output := x"DC";
            when 67 => output := x"1A";
            when 68 => output := x"E2";
            when 69 => output := x"82";
            when 70 => output := x"57";
            when 71 => output := x"EC";
            when 72 => output := x"70";
            when 73 => output := x"3F";
            when 74 => output := x"CC";
            when 75 => output := x"F0";
            when 76 => output := x"95";
            when 77 => output := x"EE";
            when 78 => output := x"8D";
            when 79 => output := x"F1";
            when 80 => output := x"C1";
            when 81 => output := x"AB";
            when 82 => output := x"76";
            when 83 => output := x"38";
            when 84 => output := x"9F";
            when 85 => output := x"E6";
            when 86 => output := x"78";
            when 87 => output := x"CA";
            when 88 => output := x"F7";
            when 89 => output := x"C6";
            when 90 => output := x"F8";
            when 91 => output := x"60";
            when 92 => output := x"D5";
            when 93 => output := x"BB";
            when 94 => output := x"9C";
            when 95 => output := x"4F";
            when 96 => output := x"F3";
            when 97 => output := x"3C";
            when 98 => output := x"65";
            when 99 => output := x"7B";
            when 100 => output := x"63";
            when 101 => output := x"7C";
            when 102 => output := x"30";
            when 103 => output := x"6A";
            when 104 => output := x"DD";
            when 105 => output := x"4E";
            when 106 => output := x"A7";
            when 107 => output := x"79";
            when 108 => output := x"9E";
            when 109 => output := x"B2";
            when 110 => output := x"3D";
            when 111 => output := x"31";
            when 112 => output := x"3E";
            when 113 => output := x"98";
            when 114 => output := x"B5";
            when 115 => output := x"6E";
            when 116 => output := x"27";
            when 117 => output := x"D3";
            when 118 => output := x"BC";
            when 119 => output := x"CF";
            when 120 => output := x"59";
            when 121 => output := x"1E";
            when 122 => output := x"18";
            when 123 => output := x"1F";
            when 124 => output := x"4C";
            when 125 => output := x"5A";
            when 126 => output := x"B7";
            when 127 => output := x"93";
            when 128 => output := x"E9";
            when 129 => output := x"DE";
            when 130 => output := x"E7";
            when 131 => output := x"2C";
            when 132 => output := x"8F";
            when 133 => output := x"0C";
            when 134 => output := x"0F";
            when 135 => output := x"A6";
            when 136 => output := x"2D";
            when 137 => output := x"DB";
            when 138 => output := x"49";
            when 139 => output := x"F4";
            when 140 => output := x"6F";
            when 141 => output := x"73";
            when 142 => output := x"96";
            when 143 => output := x"47";
            when 144 => output := x"06";
            when 145 => output := x"07";
            when 146 => output := x"53";
            when 147 => output := x"16";
            when 148 => output := x"ED";
            when 149 => output := x"24";
            when 150 => output := x"7A";
            when 151 => output := x"37";
            when 152 => output := x"39";
            when 153 => output := x"CB";
            when 154 => output := x"A3";
            when 155 => output := x"83";
            when 156 => output := x"03";
            when 157 => output := x"A9";
            when 158 => output := x"8B";
            when 159 => output := x"F6";
            when 160 => output := x"92";
            when 161 => output := x"BD";
            when 162 => output := x"9B";
            when 163 => output := x"1C";
            when 164 => output := x"E5";
            when 165 => output := x"D1";
            when 166 => output := x"41";
            when 167 => output := x"01";
            when 168 => output := x"54";
            when 169 => output := x"45";
            when 170 => output := x"FB";
            when 171 => output := x"C9";
            when 172 => output := x"5E";
            when 173 => output := x"4D";
            when 174 => output := x"0E";
            when 175 => output := x"F2";
            when 176 => output := x"68";
            when 177 => output := x"20";
            when 178 => output := x"80";
            when 179 => output := x"AA";
            when 180 => output := x"22";
            when 181 => output := x"7D";
            when 182 => output := x"64";
            when 183 => output := x"2F";
            when 184 => output := x"26";
            when 185 => output := x"87";
            when 186 => output := x"F9";
            when 187 => output := x"34";
            when 188 => output := x"90";
            when 189 => output := x"40";
            when 190 => output := x"55";
            when 191 => output := x"11";
            when 192 => output := x"BE";
            when 193 => output := x"32";
            when 194 => output := x"97";
            when 195 => output := x"13";
            when 196 => output := x"43";
            when 197 => output := x"FC";
            when 198 => output := x"9A";
            when 199 => output := x"48";
            when 200 => output := x"A0";
            when 201 => output := x"2A";
            when 202 => output := x"88";
            when 203 => output := x"5F";
            when 204 => output := x"19";
            when 205 => output := x"4B";
            when 206 => output := x"09";
            when 207 => output := x"A1";
            when 208 => output := x"7E";
            when 209 => output := x"CD";
            when 210 => output := x"A4";
            when 211 => output := x"D0";
            when 212 => output := x"15";
            when 213 => output := x"44";
            when 214 => output := x"AF";
            when 215 => output := x"8C";
            when 216 => output := x"A5";
            when 217 => output := x"84";
            when 218 => output := x"50";
            when 219 => output := x"BF";
            when 220 => output := x"66";
            when 221 => output := x"D2";
            when 222 => output := x"E8";
            when 223 => output := x"8A";
            when 224 => output := x"A2";
            when 225 => output := x"D7";
            when 226 => output := x"46";
            when 227 => output := x"52";
            when 228 => output := x"42";
            when 229 => output := x"A8";
            when 230 => output := x"DF";
            when 231 => output := x"B3";
            when 232 => output := x"69";
            when 233 => output := x"74";
            when 234 => output := x"C5";
            when 235 => output := x"51";
            when 236 => output := x"EB";
            when 237 => output := x"23";
            when 238 => output := x"29";
            when 239 => output := x"21";
            when 240 => output := x"D4";
            when 241 => output := x"EF";
            when 242 => output := x"D9";
            when 243 => output := x"B4";
            when 244 => output := x"3A";
            when 245 => output := x"62";
            when 246 => output := x"28";
            when 247 => output := x"75";
            when 248 => output := x"91";
            when 249 => output := x"14";
            when 250 => output := x"10";
            when 251 => output := x"EA";
            when 252 => output := x"77";
            when 253 => output := x"6C";
            when 254 => output := x"DA";
            when 255 => output := x"1D";
            when others => output := "XXXXXXXX";
        end case;
        return output;
    end function byte_change;
    
    function G_transformation(input : in std_logic_vector(0 to 31); shift_size : integer) return std_logic_vector is
    variable a, b, c, d: std_logic_vector(0 to 7);
    variable result: std_logic_vector(0 to 31);
    begin
        -- read input
        a := input(0 to 7);
        b := input(8 to 15);
        c := input(16 to 23);
        d := input(24 to 31);
        -- change bytes
        a := byte_change(a);
        b := byte_change(b);
        c := byte_change(c);
        d := byte_change(d);
        -- concat result
        result(0 to 7) := a;
        result(8 to 15) := b;
        result(16 to 23) := c;
        result(24 to 31) := d;
        -- rotate
        result := std_logic_vector(rotate_left(unsigned(result), shift_size));
        return result;
    end function G_transformation;
    
    function modadd(op1 : in std_logic_vector(0 to 31); op2 : in std_logic_vector(0 to 31)) return std_logic_vector is
    variable temp: unsigned(0 to 31);
    variable result: std_logic_vector(0 to 31);
    begin
        temp := unsigned(op1) + unsigned(op2);
        result := std_logic_vector(temp);
        return result;
    end function modadd;
    
    function modadd(op1 : in std_logic_vector(0 to 31); op2 : in std_logic_vector(0 to 31); op3 : in std_logic_vector(0 to 31)) return std_logic_vector is
    variable temp: unsigned(0 to 31);
    variable result: std_logic_vector(0 to 31);
    begin
        temp := unsigned(op1) + unsigned(op2);
        temp := temp + unsigned(op3);
        result := std_logic_vector(temp);
        return result;
    end function modadd;
    
    function modsub(op1 : in std_logic_vector(0 to 31); op2 : in std_logic_vector(0 to 31)) return std_logic_vector is
    variable temp: unsigned(0 to 31);
    variable result: std_logic_vector(0 to 31);
    begin
        temp := unsigned(op1) - unsigned(op2);
        result := std_logic_vector(temp);
        return result;
    end function modsub;
    
    function swap_endian(vec : in std_logic_vector(0 to 31)) return std_logic_vector is
    variable vRet : std_logic_vector(0 to 31);
    begin
        for i in 0 to 3 loop
            for j in 0 to 7 loop
                vRet(8*i + j) := vec(8*(3-i) + j);
            end loop; --j
        end loop; --i
        return vRet;
    end function swap_endian;
end package body belt_functions;