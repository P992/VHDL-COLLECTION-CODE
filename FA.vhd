----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2021 11:56:45 AM
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           SF : out STD_LOGIC;
           CF : out STD_LOGIC);
end FA;






architecture structural of FA is

--qui copio la entity dell Half adder 
-- sostituisco la entityt con componentn
component HA 
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           Ch : out STD_LOGIC;
           Sh : out STD_LOGIC);
end component;
-- dichiarazione segnali ausiliari
signal aux1,aux2,aux3: std_logic;


--qui inizia FULL ADDER
begin
--metto le label, se uso più componenti uguali la label mi aiuta
-- per differenziare
HA_1: HA
-- qui scrivo chi dell half adder va nei pin del full adder
Port map (a => A, b => B, Ch => aux1, Sh => aux2);

HA_2: HA
Port map (a => aux2, b => C, Sh => SF, Ch => aux3);
CF <= aux1 or aux3;

end structural;
