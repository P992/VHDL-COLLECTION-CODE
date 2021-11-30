----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2021 07:35:18 PM
-- Design Name: 
-- Module Name: signed_unsigned - Behavioral
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

entity signed_unsigned is
port(
i_a : in std_logic_vector(4 downto 0);
i_b : in std_logic_vector(4 downto 0);
rs_SUM : out std_logic_vector(4 downto 0);
ru_SUM : out std_logic_vector(4 downto 0);
rs_SUB : out std_logic_vector(4 downto 0);
ru_SUB : out std_logic_vector(4 downto 0)
);
end signed_unsigned;

architecture Behavioral of signed_unsigned is
signal rs_SUM_RESULT : signed(4 downto 0) := (others => '0');
signal ru_SUM_RESULT : unsigned(4 downto 0) := (others => '0');
signal rs_SUB_RESULT : signed(4 downto 0) := (others => '0');
signal ru_SUB_RESULT : unsigned(4 downto 0) := (others => '0');

begin

p_SUM : process (i_a, i_b)  -- processo attivo su a e b
begin
    
    ru_SUM_RESULT <= unsigned(i_a) + unsigned(i_b);  -- assegno ad rs i vettori i_a e i_b
    rs_SUM_RESULT <= signed(i_a) + signed(i_b);      -- convertendoli im unsigned e signed

end process p_SUM;

p_SUB : process (i_a, i_b)  -- processo attivo su a e b
begin
    
    ru_SUB_RESULT <= unsigned(i_a) - unsigned(i_b);  -- assegno ad rs i vettori i_a e i_b
    rs_SUB_RESULT <= signed(i_a) - signed(i_b);      -- convertendoli im unsigned e signed

end process p_SUB;

rs_SUM<= std_logic_vector (rs_SUM_RESULT);
ru_SUM<= std_logic_vector (ru_SUM_RESULT);
rs_SUB<= std_logic_vector (rs_SUB_RESULT);
ru_SUB<= std_logic_vector (ru_SUB_RESULT);

end Behavioral;
