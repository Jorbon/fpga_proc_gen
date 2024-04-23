library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pixel_instancer is
    generic (
        width : natural := 2250
    );
    port (
        sx, sy : in unsigned(11 downto 0);
        px, py : in signed(31 downto 0);
        x_even, x_odd, y : out signed(31 downto 0)
    );
end entity pixel_instancer;

architecture rtl of pixel_instancer is
    signal x_next, y_next : signed(31 downto 0);
    signal x_even_out, x_odd_out, y_out : signed(31 downto 0) := (others => '0');
begin
    
    x_next <= signed(sx) + px + 7;
    y_next <= signed(sy) + py;
    
    process (sx(0))
    begin
        if rising_edge(sx(0)) then
            x_odd_out <= x_next;
            y_out <= y_next;
        end if;
        if falling_edge(sx(0)) then
            x_even_out <= x_next;
            y_out <= y_next;
        end if;
    end process;
    
    x_even <= x_even_out;
    x_odd <= x_odd_out;
    y <= y_out;
    
end architecture rtl;