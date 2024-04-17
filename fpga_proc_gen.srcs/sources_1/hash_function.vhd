library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hash_function is
    port (
        x, y : in signed(15 downto 0); -- +15.
        seed : in std_logic_vector(31 downto 0);
        gx, gy : out signed(15 downto 0) -- +.15
    );
end entity hash_function;

architecture rtl of hash_function is
    signal s0, s1, s2, s3, s4, s5, s6, s7, s8 : signed(31 downto 0);
begin
    s0 <= (
        y(15) & x(15) & y(14) & x(14) & y(13) & x(13) & y(12) & x(12) & 
        y(11) & x(11) & y(10) & x(10) & y( 9) & x( 9) & y( 8) & x( 8) & 
        y( 7) & x( 7) & y( 6) & x( 6) & y( 5) & x( 5) & y( 4) & x( 4) & 
        y( 3) & x( 3) & y( 2) & x( 2) & y( 1) & x( 1) & y( 0) & x( 0)
    ) xor signed(seed);
    
    s1 <= s0 xor (s0(17) & s0(15) & s0(28) & s0(26) & s0(31) & s0(31) & s0(24) & s0(18) & s0(22) & s0( 4) & s0( 4) & s0(26) & s0(29) & s0(24) & s0(28) & s0(24) & s0( 8) & s0(17) & s0(31) & s0(22) & s0( 2) & s0( 7) & s0( 1) & s0(12) & s0( 8) & s0(17) & s0(17) & s0(25) & s0(19) & s0(18) & s0( 3) & s0( 4));
    s2 <= s1 xor (s1(29) & s1(26) & s1(23) & s1(20) & s1(16) & s1(21) & s1(17) & s1( 9) & s1(19) & s1(23) & s1(25) & s1(17) & s1(27) & s1(28) & s1(21) & s1( 9) & s1( 2) & s1(10) & s1(22) & s1( 8) & s1( 6) & s1( 3) & s1(12) & s1(28) & s1(11) & s1(25) & s1(20) & s1( 3) & s1(29) & s1(16) & s1( 0) & s1(21));
    s3 <= s2 xor (s2(13) & s2(10) & s2( 5) & s2(22) & s2(16) & s2(22) & s2(22) & s2(21) & s2(25) & s2( 3) & s2(26) & s2(15) & s2(27) & s2(31) & s2(23) & s2( 3) & s2( 6) & s2(12) & s2(14) & s2( 9) & s2(28) & s2( 3) & s2(29) & s2(18) & s2(11) & s2( 5) & s2( 5) & s2(15) & s2( 9) & s2(22) & s2(21) & s2(17));
    s4 <= s3 xor (s3( 7) & s3(19) & s3(24) & s3(23) & s3(28) & s3( 8) & s3(11) & s3(25) & s3(28) & s3(16) & s3( 6) & s3( 3) & s3( 6) & s3(16) & s3(25) & s3( 1) & s3(30) & s3(24) & s3(17) & s3( 0) & s3(23) & s3(19) & s3( 9) & s3(17) & s3( 6) & s3( 6) & s3( 5) & s3( 0) & s3(19) & s3(10) & s3( 8) & s3(24));
    s5 <= s4 xor (s4( 3) & s4(20) & s4(18) & s4(11) & s4(21) & s4( 8) & s4( 6) & s4(10) & s4( 5) & s4( 5) & s4( 3) & s4(25) & s4(15) & s4( 6) & s4(17) & s4(12) & s4(13) & s4( 0) & s4(12) & s4(29) & s4(23) & s4( 9) & s4(30) & s4(28) & s4(29) & s4( 8) & s4(12) & s4(29) & s4(31) & s4(15) & s4(18) & s4(27));
    s6 <= s5 xor (s5(30) & s5( 2) & s5(29) & s5( 4) & s5( 7) & s5(24) & s5(13) & s5(21) & s5( 0) & s5(16) & s5( 0) & s5(31) & s5( 5) & s5( 0) & s5( 9) & s5(10) & s5(14) & s5( 2) & s5(14) & s5(13) & s5(10) & s5(23) & s5( 9) & s5(24) & s5(14) & s5(31) & s5(27) & s5(25) & s5(30) & s5(22) & s5(28) & s5(31));
    s7 <= s6 xor (s6( 8) & s6( 1) & s6(29) & s6(30) & s6(14) & s6( 7) & s6(31) & s6(14) & s6(12) & s6(21) & s6(30) & s6(23) & s6(21) & s6(30) & s6(30) & s6(31) & s6(19) & s6(15) & s6(24) & s6(24) & s6(29) & s6( 8) & s6(11) & s6( 4) & s6( 5) & s6(21) & s6(19) & s6(25) & s6(25) & s6( 2) & s6( 7) & s6(14));
    s8 <= s7 xor (s7(12) & s7(11) & s7(28) & s7(14) & s7(19) & s7(14) & s7(17) & s7(13) & s7(28) & s7(17) & s7( 0) & s7( 2) & s7(17) & s7(23) & s7(12) & s7(21) & s7(27) & s7(28) & s7(28) & s7( 9) & s7(14) & s7( 0) & s7( 1) & s7( 3) & s7(26) & s7(29) & s7( 7) & s7( 8) & s7( 9) & s7(18) & s7(17) & s7( 8));
    
    gx <= s8(30) & s8(28) & s8(26) & s8(24) & s8(22) & s8(20) & s8(18) & s8(16) & s8(14) & s8(12) & s8(10) & s8( 8) & s8( 6) & s8( 4) & s8( 2) & s8( 0);
    gy <= s8(31) & s8(29) & s8(27) & s8(25) & s8(23) & s8(21) & s8(19) & s8(17) & s8(15) & s8(13) & s8(11) & s8( 9) & s8( 7) & s8( 5) & s8( 3) & s8( 1);
    
end architecture rtl;