library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_perlin is
end entity tb_perlin;

architecture rtl of tb_perlin is
    component perlin_noise is
        generic (
            width : natural;
            s : unsigned(1 downto 0)
        );
        port (
            clk : in std_logic;
            sx, sy : in unsigned(11 downto 0);
            posx, posy : in signed(31 downto 0); -- +15.16
            seed : in std_logic_vector(31 downto 0);
            value : out signed(18 downto 0) -- +2.16
        );
    end component;
    
    signal clk : std_logic := '0';
    
    signal x : integer := 496;
begin
    
    clk <= not clk after 5ns;
    
    process (clk)
    begin if rising_edge(clk) then
        if x = 527 then
            x <= 496;
        else
            x <= x + 1;
        end if;
    end if; end process;
    
    p: perlin_noise
    generic map (
        width => 2200,
        s => "00"
    )
    port map (
        clk => clk,
        sx => to_unsigned(x, 12),
        sy => to_unsigned(450, 12),
        posx => (others => '0'),
        posy => (others => '0'),
        seed => "00100001110100111101111010010110"
    );
    
    
end architecture rtl;
