----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 12:07:08 PM
-- Design Name: 
-- Module Name: eqcomp - dataflow
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

entity eqcomp is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           neq : out STD_LOGIC;
           eq : out STD_LOGIC);
end eqcomp;

architecture dataflow of eqcomp is

signal aux1: std_logic;
begin
neq <= not aux1;
aux1 <= '1' when (a=b) else '0';
eq <=aux1;

end dataflow;
-- invertire a e fare eq e neq a 2 bit