----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2021 03:48:14 PM
-- Design Name: 
-- Module Name: signed_unsigned_tb - Behavioral
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

entity signed_unsigned_tb is
--  Port ( );  non dichiaro la entity perchè copio quella presente nell'altro file signed_unsigned
-- e la dichiaro come component
end signed_unsigned_tb;

architecture Behavioral of signed_unsigned_tb is

-- signal r_CLK    : std_logic  := '0';
-- signal r_RST_L    : std_logic  := '0';

component signed_unsigned
-- copio qui entity del file signed unsigned come component
port(
i_a : in std_logic_vector(4 downto 0);
i_b : in std_logic_vector(4 downto 0);
rs_SUM : out std_logic_vector(4 downto 0);
ru_SUM : out std_logic_vector(4 downto 0);
rs_SUB : out std_logic_vector(4 downto 0);
ru_SUB : out std_logic_vector(4 downto 0)
);
end component signed_unsigned;

-- dichiaro i segnali con gli stessi nomi delle porte del componente, in questo modo lavoro sulle porte indipendentemente se sono in o out
-- il simulatore farà riferimento al segnale e non alla porta, quindi conviene assegnare ad ogni porta un segnale ( immagino di metterci un filo)

signal i_a, i_b : std_logic_vector ( 4 downto 0);
signal rs_SUM, ru_SUM, rs_SUB, ru_SUB : std_logic_vector ( 4 downto 0);


begin

DUT : signed_unsigned -- istanzio il componente con un port map
    port map( i_a=>i_a, i_b=>i_b, rs_SUM=>rs_SUM,ru_SUM=>ru_SUM, rs_SUB=>rs_SUB, ru_SUB=>ru_SUB);
-- il port map così definito asssegna porta a e segnale, se metto solo I-a, i_b allora avviene associazione in maniera poszionale
-- è poco legibile perchè devo leggere nel port map e nei segnali
-- meglio non farlo

-- per definire i segnali bast afare un process, i_a e i_b sono a 5 bit quindi avrò 5 cifre

-- le stringhe che iniziano con 1 hanno un interpretazione diversa se sono signed o unsigned

-- le stringhe che iniziano con 0 signed o unsigned sono entrambi positivi
-- se iniziano con 1 il signed è negativo e unsigned positivo

-- quindi il range di valore assoluti rappresentabili dagli signed è maggiore
-- pari al doppio, dei unsigned

process
    begin
    --i_a <= "01001";
   -- i_b <= "00110";
    -- provo a forzare l overflow con -16 -16, commento i due sopra per forzare
    i_a <= "10000";  -- underflow ingresso
    i_b <= "00001";  -- underflow ingresso
    
    wait for 20 ns;
    i_a <= "10110";
    i_b <= "00110";    
    
    wait for 20 ns;
    
    i_a <= "11001";
    i_b <= "01001";
    
    wait for 20 ns;

    i_a <= "00001";
    i_b <= "00010";
   
    wait for 20 ns;
    
    i_a <= "01111";
    i_b <= "00001";
    
    wait for 20 ns;
    
  --  i_a <= "0000";
  --  i_b <= "00001";
  wait; -- così scritto sospende la simulazione
    end process;
-- temporizzazione al momento va bene 20 ns


end Behavioral;
