library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main is port (
	clk : in std_logic;
	sw : in std_logic_vector(15 downto 0);
	led : out std_logic_vector(15 downto 0);
	led16r, led16g, led16b, led17r, led17g, led17b : out std_logic;
	seg, an : out std_logic_vector(7 downto 0);
	cpu_reset, btn_center, btn_up, btn_left, btn_right, btn_down : in std_logic;
	vga_r, vga_g, vga_b : out std_logic_vector(3 downto 0);
	vga_hs, vga_vs : out std_logic
); end main;

architecture behavior of main is
    
    component vga_driver is
        generic (
            width : natural := 1920;
            height : natural := 1080;
            h_front_porch : natural := 88;
            h_sync_width : natural := 44;
            h_back_porch : natural := 148;
            v_front_porch : natural := 4;
            v_sync_width : natural := 5;
            v_back_porch : natural := 36
        );
        port (
            board_clk : in std_logic;
            reset, enable : in std_logic;
            x, y : out unsigned(11 downto 0);
            inbounds : out boolean;
            hsync, vsync : out std_logic
        );
    end component;
    
    signal x, y : unsigned(11 downto 0);
    signal inbounds : boolean;
begin
    
    vd: vga_driver port map (
        board_clk => clk,
        reset => sw(14),
        enable => sw(15),
        x => x,
        y => y,
        inbounds => inbounds,
        hsync => vga_hs,
        vsync => vga_vs
    );
    
    vga_r <= std_logic_vector(x(7 downto 4)) when inbounds else "0000";
    vga_g <= std_logic_vector(y(7 downto 4)) when inbounds else "0000";
    vga_b <= "0111" when inbounds else "0000";
    
    
    
end behavior;


