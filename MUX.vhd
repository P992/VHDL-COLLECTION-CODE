----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2021 09:55:02 PM
-- Design Name: 
-- Module Name: MUX - Behavioral
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

entity MUX is
    Port ( i0 : in STD_LOGIC_VECTOR (3 downto 0);
           i1 : in STD_LOGIC_VECTOR (3 downto 0);
           i2 : in STD_LOGIC_VECTOR (3 downto 0);
           i3 : in STD_LOGIC_VECTOR (3 downto 0);
           i4 : in STD_LOGIC_VECTOR (3 downto 0);
           i5 : in STD_LOGIC_VECTOR (3 downto 0);
           i6 : in STD_LOGIC_VECTOR (3 downto 0);
           i7 : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           -- il selettore lo posso mettere come un vettore a 3 bit invece che 3 ingressi
           y0 : out STD_LOGIC_VECTOR (3 downto 0);
           y1 : out STD_LOGIC_VECTOR (3 downto 0));
end MUX;

architecture dataflow of MUX is
--
begin
with sel select
y0 <= i0 when "000",
      i1 when "001",
      i2 when "010",
      i3 when "011",
      i4 when "100",
      i5 when "101",
      i6 when "110",
      i7 when others;


with sel select
y1 <= i7 when "000",
      i6 when "001",
      i5 when "010",
      i4 when "011",
      i3 when "100",
      i2 when "101",
      i1 when "110",
      i0 when others;
end dataflow;
