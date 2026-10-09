library ieee;
use ieee.std_logic_1164.all;

entity sensores is 
port(
    A   : in std_logic;
    B   : in std_logic;
    C   : in std_logic;
    D   : in std_logic;
    seg : out std_logic_vector (6 downto 0);
    an  : out std_logic_vector (3 downto 0) 
);
end sensores;

architecture comportamiento of sensores is
    
signal entradas : std_logic_vector (3 downto 0);
begin

an <= "1110";

entradas <= A & B & C & D;

process(entradas)
begin
    case entradas is 
        when "0011" | "0110" | "0111" | "1001" | "1010" | "1011" =>
            seg <= "1001111"; 

        when "0101" | "1100" | "1101" | "1110" | "1111" =>
            seg <= "0000001"; 

        when others =>
            seg <= "XXXXXXX";

    end case;
end process;
end comportamiento;