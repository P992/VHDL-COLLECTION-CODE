----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2021 10:49:23 PM
-- Design Name: 
-- Module Name: one_counter - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-- avendo 4 ingressi e 3 uscite in vece di fare l'elenco ABC come per il full adder uso un bus, cioè un vettore
-- e come visto in port map vado a prendere i singoli bit del vettore.
entity one_counter is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end one_counter;

architecture strucutural of one_counter is

-- copio entity dell full adder 
component FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           SF : out STD_LOGIC;
           CF : out STD_LOGIC);
end component;

-- copio entityt e sostituisco con component l half adder
component HA 
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           Ch : out STD_LOGIC;
           Sh : out STD_LOGIC);
end component;

-- dichiarazione segnali ausiliari
signal aux1,aux2,aux3: std_logic;

-- finito di richiamare " tutto quello che mi serve" vado in begin


begin

FA1: FA port map ( A =>A(0), B =>A(1), c => A(2), SF=> aux1, CF => aux2);
HA1: HA port map( a=>aux1, b=>A(3), Ch=>aux3, Sh=>Y(0));
HA2: HA port map (a=>aux2, b=>aux3, Ch => Y(1), Sh =>Y(2));


end strucutural;
