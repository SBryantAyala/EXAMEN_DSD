library IEEE;
use IEEE.std_logic_1164.all;

entity bascula is
  port (
    A, B, C, D, E : in  std_logic;
    Seg           : out std_logic_vector(6 downto 0); 
    an            : out std_logic_vector(3 downto 0)  
  );
end entity;

architecture arq of bascula is
  signal F : std_logic;
begin

  an <= "1110";

  F <= ((not C) and (not D)) or
       ((not C) and (not E)) or
       ((not B) and C and (not E)) or
       (B and C and E) or
       (C and D and E);

  Seg <= "1001111" when F = '1' else  
         "0000001";                   
end architecture;