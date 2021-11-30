----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/23/2021 10:26:31 PM
-- Design Name: 
-- Module Name: HA_TB - Behavioral
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

entity HA_TB is

--  Port ( );
end HA_TB;

architecture Behavioral of HA_TB is
-- devo inserire una entity di tipo strutturale
component HA 
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           Ch : out STD_LOGIC;
           Sh : out STD_LOGIC);
end component;

--mi conviene dichiarare segnali che hanno lo stesso nome dei componenti
signal a : STD_LOGIC;
signal b :  STD_LOGIC;
signal Ch : STD_LOGIC;
signal Sh : STD_LOGIC;


begin
--vado ad instanziare all'interno del compound statement il componente che devo simulare
-- la label che utilizzo è UUT
-- UUt significa Unit under test
UUT: HA port map (a=>a, b=>b,Ch=>Ch,Sh=>Sh);
-- sostanzialmente ho creato una black box con il componente HA e ho messo verso l'esterno le porte
-- è proprio come avere un circuito su un banco di test con i vari cavi

-- collegare i cavi alla porta dell'entità mi consente di lavorare su di loro in vario modo
-- mi vincolo così se la porta è in o out perchè il simulatore farà riferimento alla cavetto

-- proviamo ad assegnare valori ad a e b 

a<='1' after 30 ns;

b<='0' after 20 ns;
a<= '0' after 40 ns;

-- l'asse delle ascisse è il tempo, la simulazione è funzionale e non analizza i ritardi dell half adder
-- analizza se saranno rispettati i ritardi del half adder.

-- per fare simulazioni significative POSSO USARE DEI RITARDI DA USARE SOLO IN SIMULAZIONE
-- i i ritardi li aggiugno con after
end Behavioral;
