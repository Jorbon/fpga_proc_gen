library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_controller is
    port (
        sx, sy : in unsigned(11 downto 0);
        px, py : in signed(31 downto 0);
        seed : in std_logic_vector(31 downto 0);
        r, g, b : out unsigned(3 downto 0)
    );
end entity display_controller;

architecture rtl of display_controller is
    
    component perlin_noise is
        port (
            x, y : in signed(31 downto 0);
            seed : in std_logic_vector(31 downto 0);
            value : out signed(18 downto 0) -- +2.16
        );
    end component;
    
    signal x, y : signed(31 downto 0);
    
    signal v : signed(18 downto 0);
begin
    x <= signed(sx) + px;
    y <= signed(sy) + py;
    
    n1: perlin_noise port map (
        x => x(23 downto 0) & "00000000",
        y => y(23 downto 0) & "00000000",
        seed => seed,
        value => v
    );
    
    r <= unsigned((not v(18)) & v(17 downto 15));
    g <= unsigned((not v(18)) & v(17 downto 15));
    b <= unsigned((not v(18)) & v(17 downto 15));
    
end architecture rtl;