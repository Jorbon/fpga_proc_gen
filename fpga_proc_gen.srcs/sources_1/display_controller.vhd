library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_controller is
    port (
        sx, sy : in unsigned(11 downto 0);
        r, g, b : out unsigned(3 downto 0);
        px, py : in signed(31 downto 0)
    );
end entity display_controller;

architecture rtl of display_controller is
    signal x, y : signed(31 downto 0);
begin
    x <= signed(sx) + px;
    y <= signed(sy) + py;
    
    r <= unsigned(x(5 downto 2));
    g <= unsigned(y(5 downto 2));
    b <= "0111";
    
end architecture rtl;