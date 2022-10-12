library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit_full_adder is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out STD_LOGIC);
end bit_full_adder;

architecture Behavioral of bit_full_adder is

begin
    s <= (in1 xor in2) xor cin;
    cout <= (in1 and in2) or ((in1 xor in2) and cin);

end Behavioral;