library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity tb;

architecture rtl of tb is
    component main is
        port (
            clk : in std_logic;
            sw : in std_logic_vector(15 downto 0);
            led : out std_logic_vector(15 downto 0);
            led16r, led16g, led16b, led17r, led17g, led17b : out std_logic;
            seg, an : out std_logic_vector(7 downto 0);
            cpu_reset, btn_center, btn_up, btn_left, btn_right, btn_down : in std_logic;
            vga_r, vga_g, vga_b : out std_logic_vector(3 downto 0);
            vga_hs, vga_vs : out std_logic
        );
    end component;
    
    signal clk : std_logic := '0';
begin
    
    clk <= not clk after 5ns;
    
    m: main port map (
        clk,
        sw => (others => '0'),
        cpu_reset => '1',
        btn_center => '0',
        btn_up => '0',
        btn_left => '0',
        btn_right => '0',
        btn_down => '0'
    );
    
    
end architecture rtl;
