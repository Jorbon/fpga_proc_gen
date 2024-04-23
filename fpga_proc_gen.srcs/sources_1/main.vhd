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
    
    component clk_wiz_0 is
        port (
            clk_in1, reset : in std_logic;
            clk_out1 : out std_logic
        );
    end component;
    
    component pixel_instancer is
        generic (
            width : natural := 2250
        );
        port (
            sx, sy : in unsigned(11 downto 0);
            px, py : in signed(31 downto 0);
            x_even, x_odd, y : out signed(31 downto 0)
        );
    end component;
    
    component perlin_noise is
        port (
            clk : in std_logic;
            x, y : in signed(31 downto 0);
            seed : in std_logic_vector(31 downto 0);
            value : out signed(18 downto 0) -- +2.16
        );
    end component;
    
    constant seed : std_logic_vector(31 downto 0) := "00100001110100111101111010010110";
    
    constant width : natural := 1920;
    constant height : natural := 1080;
    constant h_front_porch : natural := 88;
    constant h_sync_width : natural := 44;
    constant h_back_porch : natural := 148;
    constant v_front_porch : natural := 4;
    constant v_sync_width : natural := 5;
    constant v_back_porch : natural := 36;
    
    
    signal reset, enable : std_logic;
    
    signal pixel_clk : std_logic;
    signal sx, sy : unsigned(11 downto 0) := (others => '0');
    signal inbounds : boolean;
    signal hsync, vsync : std_logic;
    signal r, g, b : unsigned(3 downto 0);
    
    constant speed : natural := 4;
    signal px, py : signed(31 downto 0) := (others => '0');
    
    signal x_even, x_odd, y : signed(31 downto 0);
    signal v_even, v_odd, v : signed(18 downto 0); -- +2.16
    
begin
    
    reset <= not cpu_reset;
    enable <= not sw(15);
    
    clk_transform: clk_wiz_0 port map (
        clk_in1 => clk, -- 100 MHz
        reset => reset,
        clk_out1 => pixel_clk -- 148.5 MHz
    );
    
    
    process (pixel_clk)
    begin if rising_edge(pixel_clk) then
        if reset = '1' then
            sx <= (others => '0');
            sy <= (others => '0');
        elsif enable = '1' then
            if sx = width + h_front_porch + h_sync_width + h_back_porch then
                sx <= (others => '0');
                if sy = height + v_front_porch + v_sync_width + v_back_porch then
                    sy <= (others => '0');
                else
                    sy <= sy + 1;
                end if;
            else
                sx <= sx + 1;
            end if;
        end if;
    end if; end process;
    
    inbounds <= sx < width and sy < height and reset = '0' and enable = '1';
    
    hsync <= '1' when
             sx >= (width + h_front_porch) and
             sx < (width + h_front_porch + h_sync_width) and
             reset = '0' and enable = '1'
             else '0';
    vsync <= '1' when
             sy >= (height + v_front_porch) and
             sy < (height + v_front_porch + v_sync_width) and
             reset = '0' and enable = '1'
             else '0';
    
    vga_hs <= hsync;
    vga_vs <= vsync;
    
    
    
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
    
    
    
    pi: pixel_instancer
        generic map (
            width => width + h_front_porch + h_sync_width + h_back_porch
        )
        port map (
            sx => sx,
            sy => sy,
            px => px,
            py => py,
            x_even => x_even,
            x_odd => x_odd,
            y => y
        );
    
    n_even: perlin_noise port map (
        clk => not sx(0),
        x => x_even(23 downto 0) & "00000000",
        y => y(23 downto 0) & "00000000",
        seed => seed,
        value => v_even
    );
    
    n_odd: perlin_noise port map (
        clk => sx(0),
        x => x_odd(23 downto 0) & "00000000",
        y => y(23 downto 0) & "00000000",
        seed => seed,
        value => v_odd
    );
    
    v <= v_even when sx(0) = '0' else v_odd;
    
    r <= unsigned((not v(18)) & v(15 downto 13));
    g <= unsigned((not v(18)) & v(15 downto 13));
    b <= unsigned((not v(18)) & v(15 downto 13));
    
    vga_r <= std_logic_vector(r) when inbounds else "0000";
    vga_g <= std_logic_vector(g) when inbounds else "0000";
    vga_b <= std_logic_vector(b) when inbounds else "0000";
    
    
    
    
end architecture behavior;


