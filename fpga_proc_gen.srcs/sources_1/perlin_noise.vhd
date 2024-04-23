library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity perlin_noise is
    port (
        clk : in std_logic;
        x, y : in signed(31 downto 0); -- +15.16
        seed : in std_logic_vector(31 downto 0);
        value : out signed(18 downto 0) -- +2.16
    );
end entity perlin_noise;

architecture rtl of perlin_noise is
    
    component hash_function is
        port (
            x, y : in signed(15 downto 0); -- +15.
            seed : in std_logic_vector(31 downto 0);
            gx, gy : out signed(15 downto 0) -- +.15
        );
    end component;
    
    signal xf, yf, xc, yc : signed(15 downto 0); -- .16
    signal agx_next, agy_next, bgx_next, bgy_next, cgx_next, cgy_next, dgx_next, dgy_next : signed(15 downto 0);
    signal sx_next, sy_next, nx_next, ny_next : signed(16 downto 0);
    signal sx2_next, sy2_next, nx2_next, ny2_next : unsigned(33 downto 0);
    
    signal agx, agy, bgx, bgy, cgx, cgy, dgx, dgy : signed(15 downto 0) := (others => '0'); -- +.15
    signal sx, sy, nx, ny : signed(16 downto 0) := (others => '0'); -- +.16
    signal sx2, sy2, nx2, ny2 : unsigned(33 downto 0) := (others => '0'); -- 2.32
    signal fa, fb, fc, fd : unsigned(17 downto 0); -- 2.16
    signal dot_ax, dot_ay, dot_bx, dot_by, dot_cx, dot_cy, dot_dx, dot_dy : signed(32 downto 0); -- +1.31
    signal fa2_next, fb2_next, fc2_next, fd2_next : unsigned(31 downto 0);
    signal dot_a_next, dot_b_next, dot_c_next, dot_d_next : signed(17 downto 0);
    
    signal fa2, fb2, fc2, fd2 : unsigned(31 downto 0) := (others => '0'); -- .32
    signal dot_a, dot_b, dot_c, dot_d : signed(17 downto 0) := (others => '0'); -- +1.16
    signal av, bv, cv, dv : signed(34 downto 0); -- +2.32
    signal value_next : signed(18 downto 0);
    
    signal value_out : signed(18 downto 0) := (others => '0'); -- +2.16
begin
    
    -- 1
    xf <= x(31 downto 16);
    yf <= y(31 downto 16);
    xc <= x(31 downto 16) + 1;
    yc <= y(31 downto 16) + 1;
    
    ha: hash_function port map (
        x => xf,
        y => yf,
        seed => seed,
        gx => agx_next,
        gy => agy_next
    );
    
    hb: hash_function port map (
        x => xc,
        y => yf,
        seed => seed,
        gx => bgx_next,
        gy => bgy_next
    );
    
    hc: hash_function port map (
        x => xf,
        y => yc,
        seed => seed,
        gx => cgx_next,
        gy => cgy_next
    );
    
    hd: hash_function port map (
        x => xc,
        y => yc,
        seed => seed,
        gx => dgx_next,
        gy => dgy_next
    );
    
    sx_next <= '0' & x(15 downto 0);
    sy_next <= '0' & y(15 downto 0);
    nx_next <= '1' & x(15 downto 0);
    ny_next <= '1' & y(15 downto 0);
    
    sx2_next <= unsigned(sx * sx);
    sy2_next <= unsigned(sy * sy);
    nx2_next <= unsigned(nx * nx);
    ny2_next <= unsigned(ny * ny);
    
    
    
    -- 2
    fa <= not (('0' & sx2(32 downto 16)) + ('0' & sy2(32 downto 16)));
    fb <= not (('0' & nx2(32 downto 16)) + ('0' & sy2(32 downto 16)));
    fc <= not (('0' & sx2(32 downto 16)) + ('0' & ny2(32 downto 16)));
    fd <= not (('0' & nx2(32 downto 16)) + ('0' & ny2(32 downto 16)));
    
    fa2_next <= (fa(15 downto 0) * fa(15 downto 0)) when fa(17 downto 16) = "11" else (others => '0');
    fb2_next <= (fb(15 downto 0) * fb(15 downto 0)) when fb(17 downto 16) = "11" else (others => '0');
    fc2_next <= (fc(15 downto 0) * fc(15 downto 0)) when fc(17 downto 16) = "11" else (others => '0');
    fd2_next <= (fd(15 downto 0) * fd(15 downto 0)) when fd(17 downto 16) = "11" else (others => '0');
    
    dot_ax <= sx * agx;
    dot_ay <= sy * agy;
    dot_bx <= nx * bgx;
    dot_by <= sy * bgy;
    dot_cx <= sx * cgx;
    dot_cy <= ny * cgy;
    dot_dx <= nx * dgx;
    dot_dy <= ny * dgy;
    
    dot_a_next <= dot_ax(32 downto 15) + dot_ay(32 downto 15); -- this could get to 2 (requiring +2.16 (19) bits) but then it would be too distant to affect anything
    dot_b_next <= dot_bx(32 downto 15) + dot_by(32 downto 15);
    dot_c_next <= dot_cx(32 downto 15) + dot_cy(32 downto 15);
    dot_d_next <= dot_dx(32 downto 15) + dot_dy(32 downto 15);
    
    
    
    -- 3
    av <= signed('0' & fa2(31 downto 16)) * dot_a;
    bv <= signed('0' & fb2(31 downto 16)) * dot_b;
    cv <= signed('0' & fc2(31 downto 16)) * dot_c;
    dv <= signed('0' & fd2(31 downto 16)) * dot_d;
    
    value_next <= (av(34 downto 16) + bv(34 downto 16)) + (cv(34 downto 16) + dv(34 downto 16));
    
    
    value <= value_out;
    
    process (clk)
    begin if rising_edge(clk) then
        agx <= agx_next;
        agy <= agy_next;
        bgx <= bgx_next;
        bgy <= bgy_next;
        cgx <= cgx_next;
        cgy <= cgy_next;
        dgx <= dgx_next;
        dgy <= dgy_next;
        sx <= sx_next;
        sy <= sy_next;
        nx <= nx_next;
        ny <= ny_next;
        sx2 <= sx2_next;
        sy2 <= sy2_next;
        nx2 <= nx2_next;
        ny2 <= ny2_next;
        
        fa2 <= fa2_next;
        fb2 <= fb2_next;
        fc2 <= fc2_next;
        fd2 <= fd2_next;
        dot_a <= dot_a_next;
        dot_b <= dot_b_next;
        dot_c <= dot_c_next;
        dot_d <= dot_d_next;
        
        value_out <= value_next;
    end if; end process;
    
end architecture rtl;


-- let fx = Math.floor(x);
-- let fy = Math.floor(y);
-- let [agx, agy] = hash2([fx, fy], seed, shuffles);
-- let [bgx, bgy] = hash2([fx + 1, fy], seed, shuffles);
-- let [cgx, cgy] = hash2([fx, fy + 1], seed, shuffles);
-- let [dgx, dgy] = hash2([fx + 1, fy + 1], seed, shuffles);
-- let sx = x - fx;
-- let sy = y - fy;
-- let r2 = 1.0;
-- let p = 2;
-- let av = Math.max(0, r2 - (sx*sx + sy*sy))**p * (sx*agx + sy*agy);
-- let bv = Math.max(0, r2 - (nx*nx + sy*sy))**p * (nx*bgx + sy*bgy);
-- let cv = Math.max(0, r2 - (sx*sx + ny*ny))**p * (sx*cgx + ny*cgy);
-- let dv = Math.max(0, r2 - (nx*nx + ny*ny))**p * (nx*dgx + ny*dgy);
-- return av + bv + cv + dv;