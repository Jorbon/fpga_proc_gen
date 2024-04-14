library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_driver is
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
end entity vga_driver;

architecture rtl of vga_driver is
    component clk_wiz_0 is port (
        clk_in1, reset : in std_logic;
        clk_out1 : out std_logic
    ); end component;
    
    signal pixel_clk : std_logic;
    signal hcount, vcount : unsigned(11 downto 0) := (others => '0');
    
    
begin
    
    clk_transform: clk_wiz_0 port map (
        clk_in1 => board_clk, -- 100 MHz
        reset => reset,
        clk_out1 => pixel_clk -- 148.5 MHz
    );
    
    process (pixel_clk)
    begin if rising_edge(pixel_clk) then
        if reset = '1' then
            hcount <= (others => '0');
            vcount <= (others => '0');
        elsif enable = '1' then
            if hcount = to_unsigned(width + h_front_porch + h_sync_width + h_back_porch, 12) then
                hcount <= (others => '0');
                if vcount = to_unsigned(height + v_front_porch + v_sync_width + v_back_porch, 12) then
                    vcount <= (others => '0');
                else
                    vcount <= vcount + 1;
                end if;
            else
                hcount <= hcount + 1;
            end if;
        end if;
    end if; end process;
    
    x <= hcount;
    y <= vcount;
    inbounds <= hcount < width and
                vcount < height and
                reset = '0' and enable = '1';
    hsync <= '1' when
             hcount >= (width + h_front_porch) and
             hcount < (width + h_front_porch + h_sync_width) and
             reset = '0' and enable = '1'
             else '0';
    vsync <= '1' when
             vcount >= (height + v_front_porch) and
             vcount < (height + v_front_porch + v_sync_width) and
             reset = '0' and enable = '1'
             else '0';
    
end architecture rtl;
