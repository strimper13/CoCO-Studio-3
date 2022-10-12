library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel is
    Port ( clk, carry_in : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end toplevel;

architecture Structural of toplevel is


--COMPONENT DECLARATION
component bit_full_adder is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out STD_LOGIC);
end component bit_full_adder;
    
component display_driver is
    Port ( inputs : in  STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
end component display_driver;
    
component LEDdisplay is
	Port ( clk : IN  STD_LOGIC;
		   seg0,seg1,seg2,seg3 : IN  STD_LOGIC_VECTOR(6 downto 0);
           seg : OUT  STD_LOGIC_VECTOR(6  downto 0);
		   an : OUT STD_LOGIC_VECTOR(3 downto 0));		  
end component LEDdisplay;


--SIGNAL DECLARATION
    SIGNAL c0 : STD_LOGIC;
    SIGNAL c1 : STD_LOGIC;
    SIGNAL c2 : STD_LOGIC;
    SIGNAL c3 : STD_LOGIC;
    SIGNAL s0 : STD_LOGIC;
    SIGNAL s1 : STD_LOGIC;
    SIGNAL s2 : STD_LOGIC;
    SIGNAL s3 : STD_LOGIC;
    SIGNAL sig_segments1 : STD_LOGIC_VECTOR (6 downto 0);
    SIGNAL sig_segments2 : STD_LOGIC_VECTOR (6 downto 0);
    
begin
--7 PORT MAPPING statements
    bit_full_adder0: bit_full_adder port map
        (in1=>sw(0),
         in2=>sw(4),
         cin=>carry_in,
         cout=>c0,
         s=>s0);
    bit_full_adder1: bit_full_adder port map
        (in1=>sw(1),
         in2=>sw(5),
         cin=>c0,
         cout=>c1,
         s=>s1);
    bit_full_adder2: bit_full_adder port map
        (in1=>sw(2),
         in2=>sw(6),
         cin=>c1,
         cout=>c2,
         s=>s2);
    bit_full_adder3: bit_full_adder port map
        (in1=>sw(3),
         in2=>sw(7),
         cin=>c2,
         cout=>c3,
         s=>s3);
    display_driver1: display_driver port map
        (inputs(0)=>s0,
         inputs(1)=>s1,
         inputs(2)=>s2,
         inputs(3)=>s3,
         seg_out=>sig_segments1);
    display_driver2: display_driver port map
        (inputs(0)=>c3,
         inputs(1)=>'0',
         inputs(2)=>'0',
         inputs(3)=>'0',
         seg_out=>sig_segments2);
    LEDdisplay0: LEDdisplay port map
        (seg0=>sig_segments1,
         seg1=>sig_segments2,
         seg2=>"1111111",
         seg3=>"1111111",
         clk=>clk,
         an=>an,
         seg=>seg);
end Structural;