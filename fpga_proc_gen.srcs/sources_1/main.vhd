library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main is
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
end entity main;

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
    
    component display_controller is
        port (
            sx, sy : in unsigned(11 downto 0);
            r, g, b : out unsigned(3 downto 0);
            px, py : in signed(31 downto 0)
        );
    end component;
    
    signal reset, enable : std_logic;
    
    signal sx, sy : unsigned(11 downto 0);
    signal inbounds : boolean;
    signal dc_r, dc_g, dc_b : unsigned(3 downto 0);
    signal vsync : std_logic;
    
    constant speed : natural := 4;
    signal px, py : signed(31 downto 0) := (others => '0');
begin
    
    reset <= not cpu_reset;
    enable <= not sw(15);
    
    vd: vga_driver port map (
        board_clk => clk,
        reset => reset,
        enable => enable,
        x => sx,
        y => sy,
        inbounds => inbounds,
        hsync => vga_hs,
        vsync => vsync
    );
    
    vga_vs <= vsync;
    
    dc: display_controller port map (
        sx => sx,
        sy => sy,
        r => dc_r,
        g => dc_g,
        b => dc_b,
        px => px,
        py => py
    );
    
    vga_r <= std_logic_vector(dc_r) when inbounds else "0000";
    vga_g <= std_logic_vector(dc_g) when inbounds else "0000";
    vga_b <= std_logic_vector(dc_b) when inbounds else "0000";
    
    
    process (vsync)
    begin if rising_edge(vsync) then
        if reset = '1' then
            px <= (others => '0');
            py <= (others => '0');
        elsif enable = '1' then
            if btn_right = '1' and btn_left = '0' then
                px <= px + speed;
            elsif btn_left = '1' and btn_right = '0' then
                px <= px - speed;
            end if;
            if btn_down = '1' and btn_up = '0' then
                py <= py + speed;
            elsif btn_up = '1' and btn_down = '0' then
                py <= py - speed;
            end if;
        end if;
    end if; end process;
    
end architecture behavior;


