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
            board_clk, reset : in std_logic;
            pixel_clk : out std_logic
        );
    end component;
    
    component hash_function is
        port (
            x, y : in signed(15 downto 0); -- +15.
            seed : in std_logic_vector(31 downto 0);
            gx, gy : out signed(15 downto 0) -- +.15
        );
    end component;
    
    component perlin_noise is
        generic (
            octave : integer := 0
        );
        port (
            clk : in std_logic;
            sx, sy : in unsigned(11 downto 0);
            posx, posy : in signed(31 downto 0); -- +15.16
            seed : in std_logic_vector(31 downto 0);
            value : out signed(18 downto 0) -- +2.16
        );
    end component;
    
    constant width : natural := 1920;
    constant height : natural := 1080;
    constant h_front_porch : natural := 88;
    constant h_sync_width : natural := 44;
    constant h_back_porch : natural := 148;
    constant v_front_porch : natural := 4;
    constant v_sync_width : natural := 5;
    constant v_back_porch : natural := 36;
    
    signal seed : std_logic_vector(31 downto 0) := "00100001110100111101111010010110";
    signal next_seed : signed(31 downto 0);
    signal btn_center_last : std_logic := '0';
    
    signal reset, enable : std_logic;
    
    signal pixel_clk : std_logic;
    signal nclk0 : std_logic := '1';
    signal nclk1, nclk2, nclk3 : std_logic := '0';
    signal sx, sy : unsigned(11 downto 0) := (others => '0');
    signal inbounds : boolean;
    signal hsync, vsync : std_logic;
    signal r, g, b : unsigned(3 downto 0);
    
    constant speed : natural := 4;
    signal px, py : signed(31 downto 0) := (others => '0');
    
    signal vn0, vn1, vn2, vn3, vo0, vo1, vo2, vo3, vp0, vp1, vp2, vp3 : signed(18 downto 0); -- +2.16
    signal v, v01, v23, v0, v1, v2, v3 : signed(16 downto 0);
    
begin
    
    reset <= not cpu_reset;
    enable <= not sw(15);
    
    ns: hash_function port map (
        x => signed(seed(31 downto 16)),
        y => signed(seed(15 downto 0)),
        seed => "01010110111110010111100101101001",
        gx => next_seed(15 downto 0),
        gy => next_seed(31 downto 16)
    );
    
    clk_transform: clk_wiz_0 port map ( clk, reset, pixel_clk );
    process (pixel_clk)
    begin if rising_edge(pixel_clk) then
        if reset = '1' then
            sx <= (others => '0');
            sy <= (others => '0');
            nclk0 <= '1';
            nclk1 <= '0';
            nclk2 <= '0';
            nclk3 <= '0';
        elsif enable = '1' then
            if sx = width + h_front_porch + h_sync_width + h_back_porch - 1 then
                if nclk3 = '1' then
                    sx <= (others => '0');
                    if sy = height + v_front_porch + v_sync_width + v_back_porch - 1 then
                        sy <= (others => '0');
                    else
                        sy <= sy + 1;
                    end if;
                end if;
            else
                sx <= sx + 1;
            end if;
            
            nclk0 <= nclk3;
            nclk1 <= nclk0;
            nclk2 <= nclk1;
            nclk3 <= nclk2;
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
            if btn_center = '1' and btn_center_last = '0' then
                seed <= std_logic_vector(next_seed);
            end if;
            btn_center_last <= btn_center;
        end if;
    end if; end process;
    
    
    n0: perlin_noise generic map ( octave => 0 ) port map ( nclk0, sx, sy, px, py, seed, vn0 );
    n1: perlin_noise generic map ( octave => 0 ) port map ( nclk1, sx, sy, px, py, seed, vn1 );
    n2: perlin_noise generic map ( octave => 0 ) port map ( nclk2, sx, sy, px, py, seed, vn2 );
    n3: perlin_noise generic map ( octave => 0 ) port map ( nclk3, sx, sy, px, py, seed, vn3 );
    
    o0: perlin_noise generic map ( octave => 1 ) port map ( nclk0, sx, sy, px, py, seed, vo0 );
    o1: perlin_noise generic map ( octave => 1 ) port map ( nclk1, sx, sy, px, py, seed, vo1 );
    o2: perlin_noise generic map ( octave => 1 ) port map ( nclk2, sx, sy, px, py, seed, vo2 );
    o3: perlin_noise generic map ( octave => 1 ) port map ( nclk3, sx, sy, px, py, seed, vo3 );
    
    p0: perlin_noise generic map ( octave => 2 ) port map ( nclk0, sx, sy, px, py, seed, vp0 );
    p1: perlin_noise generic map ( octave => 2 ) port map ( nclk1, sx, sy, px, py, seed, vp1 );
    p2: perlin_noise generic map ( octave => 2 ) port map ( nclk2, sx, sy, px, py, seed, vp2 );
    p3: perlin_noise generic map ( octave => 2 ) port map ( nclk3, sx, sy, px, py, seed, vp3 );
    
    v0 <= (vn0(18) & vn0(15 downto 0)) + (vo0(18) & vo0(16 downto 1)) + vp0(18 downto 2);
    v1 <= (vn1(18) & vn1(15 downto 0)) + (vo1(18) & vo1(16 downto 1)) + vp1(18 downto 2);
    v2 <= (vn2(18) & vn2(15 downto 0)) + (vo2(18) & vo2(16 downto 1)) + vp2(18 downto 2);
    v3 <= (vn3(18) & vn3(15 downto 0)) + (vo3(18) & vo3(16 downto 1)) + vp3(18 downto 2);
    
    v01 <= v0 when sx(0) = '0' else v1;
    v23 <= v2 when sx(0) = '0' else v3;
    v <= v01 when sx(1) = '0' else v23;
    
    r <= unsigned((not v(16)) & v(15 downto 13));
    g <= unsigned((not v(16)) & v(15 downto 13));
    b <= unsigned((not v(16)) & v(15 downto 13));
    
    vga_r <= std_logic_vector(r) when inbounds else "0000";
    vga_g <= std_logic_vector(g) when inbounds else "0000";
    vga_b <= std_logic_vector(b) when inbounds else "0000";
    
    
    
    
end architecture behavior;


