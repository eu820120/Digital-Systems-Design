library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ksa is
  port(
    CLOCK_50            : in  std_logic;  -- Clock pin
    KEY                 : in  std_logic_vector(3 downto 0);  -- push button switches
    SW                 : in  std_logic_vector(9 downto 0);  -- slider switches
    LEDR : out std_logic_vector(9 downto 0);  -- red lights
    HEX0 : out std_logic_vector(6 downto 0);
    HEX1 : out std_logic_vector(6 downto 0);
    HEX2 : out std_logic_vector(6 downto 0);
    HEX3 : out std_logic_vector(6 downto 0);
    HEX4 : out std_logic_vector(6 downto 0);
    HEX5 : out std_logic_vector(6 downto 0));
end ksa;

architecture rtl of ksa is
   COMPONENT SevenSegmentDisplayDecoder IS	
    PORT
    (
        ssOut : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        nIn : IN STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
    END COMPONENT;
	 
	--s_memory component 
	-- first s mem
	component s_memory is
	port
	(
	   address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;
	
	
	-- s2 mem
	component s_memory2 is
	port
	(
	   address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;
	
	
	-- s3 mem
	component s_memory3 is
	port
	(
	   address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;
	
	-- s4 mem
	component s_memory4 is
	port
	(
	   address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;

	--fsm component 
	--write_mem
	component write_mem is
	port
	(
	   clk		: IN STD_LOGIC ;
		readd    : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		data		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		write_en  : out STD_LOGIC; 
		si        : out std_logic_vector (7 DOWNTO 0);
		j_next    : out std_logic_vector (7 DOWNTO 0);
		j         : out std_logic_vector (7 DOWNTO 0);
		i         : out std_logic_vector (7 DOWNTO 0);
		state    : out std_logic_vector (7 DOWNTO 0);
		
		--task 2B
		read_m    : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_m    : out STD_LOGIC_VECTOR (4 DOWNTO 0);
		
		address_d    : out STD_LOGIC_VECTOR (4 DOWNTO 0);
		data_d       : out std_logic_vector (7 downto 0);
		wren_d  : out STD_LOGIC;
		
		--task3
		secret_key : out std_logic_vector (23 downto 0);
		bad : out std_logic;
		good : out std_logic;
		read_d : in std_logic_vector (7 downto 0)
	);
	end component;
	
	--write_mem2
	component write_mem2 is
	port
	(
	   clk		: IN STD_LOGIC ;
		readd    : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		data		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		write_en  : out STD_LOGIC; 
		si        : out std_logic_vector (7 DOWNTO 0);
		j_next    : out std_logic_vector (7 DOWNTO 0);
		j         : out std_logic_vector (7 DOWNTO 0);
		i         : out std_logic_vector (7 DOWNTO 0);
		state    : out std_logic_vector (7 DOWNTO 0);
		
		--task 2B
		read_m    : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_m    : out STD_LOGIC_VECTOR (4 DOWNTO 0);
		
		address_d    : out STD_LOGIC_VECTOR (4 DOWNTO 0);
		data_d       : out std_logic_vector (7 downto 0);
		wren_d  : out STD_LOGIC;
		
		--task3
		secret_key : out std_logic_vector (23 downto 0);
		bad : out std_logic;
		good : out std_logic;
		read_d : in std_logic_vector (7 downto 0)
	);
	end component;
	
	--write_mem3
	component write_mem3 is
	port
	(
	   clk		: IN STD_LOGIC ;
		readd    : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		data		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		write_en  : out STD_LOGIC; 
		si        : out std_logic_vector (7 DOWNTO 0);
		j_next    : out std_logic_vector (7 DOWNTO 0);
		j         : out std_logic_vector (7 DOWNTO 0);
		i         : out std_logic_vector (7 DOWNTO 0);
		state    : out std_logic_vector (7 DOWNTO 0);
		
		--task 2B
		read_m    : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_m    : out STD_LOGIC_VECTOR (4 DOWNTO 0);
		
		address_d    : out STD_LOGIC_VECTOR (4 DOWNTO 0);
		data_d       : out std_logic_vector (7 downto 0);
		wren_d  : out STD_LOGIC;
		
		--task3
		secret_key : out std_logic_vector (23 downto 0);
		bad : out std_logic;
		good : out std_logic;
		read_d : in std_logic_vector (7 downto 0)
	);
	end component;
	
	--write_mem4
	component write_mem4 is
	port
	(
	   clk		: IN STD_LOGIC ;
		readd    : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		data		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		write_en  : out STD_LOGIC; 
		si        : out std_logic_vector (7 DOWNTO 0);
		j_next    : out std_logic_vector (7 DOWNTO 0);
		j         : out std_logic_vector (7 DOWNTO 0);
		i         : out std_logic_vector (7 DOWNTO 0);
		state    : out std_logic_vector (7 DOWNTO 0);
		
		--task 2B
		read_m    : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_m    : out STD_LOGIC_VECTOR (4 DOWNTO 0);
		
		address_d    : out STD_LOGIC_VECTOR (4 DOWNTO 0);
		data_d       : out std_logic_vector (7 downto 0);
		wren_d  : out STD_LOGIC;
		
		--task3
		secret_key : out std_logic_vector (23 downto 0);
		bad : out std_logic;
		good : out std_logic;
		read_d : in std_logic_vector (7 downto 0)
	);
	end component;
	
	--input message ROM
	--rom
	component input_message is
	port
	(
	   address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
	end component;

	
	--output message RAM
	--out
	component ouput_message is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
   end component;
	
   --out2
	component output_message2 is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
   end component;
	
	--out3
	component output_message3 is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
   end component;
	
	--out4
	component output_message4 is
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
   end component;

	--pp
	component pp is
	PORT
	(
		secret		: IN STD_LOGIC_VECTOR (23 DOWNTO 0);
		secret2		: IN STD_LOGIC_VECTOR (23 DOWNTO 0);
		secret3		: IN STD_LOGIC_VECTOR (23 DOWNTO 0);
		secret4		: IN STD_LOGIC_VECTOR (23 DOWNTO 0);
		good		: IN STD_LOGIC ;
		good2		: IN STD_LOGIC ;
		good3		: IN STD_LOGIC ;
		good4		: IN STD_LOGIC ;
		bad		: IN STD_LOGIC ;
		bad2		: IN STD_LOGIC ;
		bad3		: IN STD_LOGIC ;
		bad4		: IN STD_LOGIC ;
		clk		: IN STD_LOGIC  := '1';
		led_good : out std_logic;
		led_bad  : out std_logic;
		secret_key		: out STD_LOGIC_VECTOR (23 DOWNTO 0)
	);
   end component;


    --signals for s_memory
	 signal addr: std_logic_vector (7 DOWNTO 0);
	 signal dataa: std_logic_vector (7 DOWNTO 0);
	 signal qq: std_logic_vector (7 DOWNTO 0);
	 signal wr_en: std_logic;
	 signal secret: std_logic_vector (23 downto 0);
	 
	 --signals for input ROM
	 signal addr_m: std_logic_vector (4 DOWNTO 0);
	 signal input_code: std_logic_vector (7 DOWNTO 0);
	 
	 --signals for output RAM
	 signal addr_d: std_logic_vector (4 DOWNTO 0);
	 signal output_code: std_logic_vector (7 DOWNTO 0);
	 signal wren_d: std_logic;
	 
    -- clock and reset signals  
	 signal clk, reset_n : std_logic;
	 signal secret_key: std_logic_vector (23 downto 0);
	 signal final_data: std_logic_vector (7 downto 0);
	 
	 
	 --pp and bonus ram/roms
	 signal addr2: std_logic_vector (7 DOWNTO 0);
	 signal dataa2: std_logic_vector (7 DOWNTO 0);
	 signal qq2: std_logic_vector (7 DOWNTO 0);
	 signal wr_en2: std_logic;
	 signal secret2: std_logic_vector (23 downto 0);
	 signal addr_m2: std_logic_vector (4 DOWNTO 0);
	 signal input_code2: std_logic_vector (7 DOWNTO 0);
	 signal addr_d2: std_logic_vector (4 DOWNTO 0);
	 signal output_code2: std_logic_vector (7 DOWNTO 0);
	 signal wren_d2: std_logic;
	 signal final_data2: std_logic_vector (7 downto 0);
	 
	 signal addr3: std_logic_vector (7 DOWNTO 0);
	 signal dataa3: std_logic_vector (7 DOWNTO 0);
	 signal qq3: std_logic_vector (7 DOWNTO 0);
	 signal wr_en3: std_logic;
	 signal secret3: std_logic_vector (23 downto 0);
	 signal addr_m3: std_logic_vector (4 DOWNTO 0);
	 signal input_code3: std_logic_vector (7 DOWNTO 0);
	 signal addr_d3: std_logic_vector (4 DOWNTO 0);
	 signal output_code3: std_logic_vector (7 DOWNTO 0);
	 signal wren_d3: std_logic;
	 signal final_data3: std_logic_vector (7 downto 0);
	 
	 signal addr4: std_logic_vector (7 DOWNTO 0);
	 signal dataa4: std_logic_vector (7 DOWNTO 0);
	 signal qq4: std_logic_vector (7 DOWNTO 0);
	 signal wr_en4: std_logic;
	 signal secret4: std_logic_vector (23 downto 0);
	 signal addr_m4: std_logic_vector (4 DOWNTO 0);
	 signal input_code4: std_logic_vector (7 DOWNTO 0);
	 signal addr_d4: std_logic_vector (4 DOWNTO 0);
	 signal output_code4: std_logic_vector (7 DOWNTO 0);
	 signal wren_d4: std_logic;
	 signal final_data4: std_logic_vector (7 downto 0);
	 
	 signal good, good2, good3, good4, bad, bad2, bad3, bad4: std_logic;
	 

	
begin
    
    clk <= CLOCK_50;
    reset_n <= KEY(3);
	 
	 
	 fsmm: write_mem port map(clk=>CLOCK_50, readd=>qq, address=>addr, data=>dataa, write_en=>wr_en, secret_key=>secret, 
	                          read_m=>input_code, address_m=>addr_m,
									  address_d=>addr_d, wren_d=>wren_d, data_d=>output_code,
									  good=>good,bad=>bad,
									  read_d=>final_data);
									  
	 fsmm2: write_mem2 port map(clk=>CLOCK_50, readd=>qq2, address=>addr2, data=>dataa2, write_en=>wr_en2, secret_key=>secret2, 
	                          read_m=>input_code2, address_m=>addr_m2,
									  address_d=>addr_d2, wren_d=>wren_d2, data_d=>output_code2,
									  good=>good2,bad=>bad2,
									  read_d=>final_data2);
									  
  	fsmm3: write_mem3 port map(clk=>CLOCK_50, readd=>qq3, address=>addr3, data=>dataa3, write_en=>wr_en3, secret_key=>secret3, 
	                          read_m=>input_code3, address_m=>addr_m3,
									  address_d=>addr_d3, wren_d=>wren_d3, data_d=>output_code3,
									  good=>good3,bad=>bad3,
									  read_d=>final_data3);
									  
	fsmm4: write_mem4 port map(clk=>CLOCK_50, readd=>qq4, address=>addr4, data=>dataa4, write_en=>wr_en4, secret_key=>secret4, 
	                          read_m=>input_code4, address_m=>addr_m4,
									  address_d=>addr_d4, wren_d=>wren_d4, data_d=>output_code4,
									  good=>good4,bad=>bad4,
									  read_d=>final_data4);
									  
	 memoryy: s_memory port map(address=>addr, clock=>CLOCK_50, data=>dataa, wren=>wr_en, q=>qq);
	 
	 memoryy2: s_memory2 port map(address=>addr2, clock=>CLOCK_50, data=>dataa2, wren=>wr_en2, q=>qq2);
	 
	 memoryy3: s_memory3 port map(address=>addr3, clock=>CLOCK_50, data=>dataa3, wren=>wr_en3, q=>qq3);
	 
	 memoryy4: s_memory4 port map(address=>addr4, clock=>CLOCK_50, data=>dataa4, wren=>wr_en4, q=>qq4);
	 
	 inputt: input_message port map(clock=>CLOCK_50, address=>addr_m, q=>input_code);
	 
	 inputt2: input_message port map(clock=>CLOCK_50, address=>addr_m2, q=>input_code2);
	 
	 inputt3: input_message port map(clock=>CLOCK_50, address=>addr_m3, q=>input_code3);
	 
	 inputt4: input_message port map(clock=>CLOCK_50, address=>addr_m4, q=>input_code4);
	 
	 outputt: ouput_message port map(address=>addr_d, clock=>CLOCK_50, data=>output_code, wren=>wren_d, q=>final_data);
	 
	 outputt2: output_message2 port map(address=>addr_d2, clock=>CLOCK_50, data=>output_code2, wren=>wren_d2, q=>final_data2);
	 
	 outputt3: output_message3 port map(address=>addr_d3, clock=>CLOCK_50, data=>output_code3, wren=>wren_d3, q=>final_data3);
	 
	 outputt4: output_message4 port map(address=>addr_d4, clock=>CLOCK_50, data=>output_code4, wren=>wren_d4, q=>final_data4);
	 
	 outputlogicss: pp port map(secret=>secret, secret2=>secret2, secret3=>secret3, secret4=>secret4,
	                            good=>good, good2=>good2, good3=>good3, good4=>good4,
										 bad=>bad, bad2=>bad2, bad3=>bad3, bad4=>bad4,
										 clk=>CLOCK_50, secret_key=>secret_key,
										 led_good=>LEDR(0), led_bad=>LEDR(1));
	 
	 hexx0: SevenSegmentDisplayDecoder port map(nIn=>secret_key(3 downto 0), ssOut=>HEX0);
	 hexx1: SevenSegmentDisplayDecoder port map(nIn=>secret_key(7 downto 4), ssOut=>HEX1);
	 hexx2: SevenSegmentDisplayDecoder port map(nIn=>secret_key(11 downto 8), ssOut=>HEX2);
	 hexx3: SevenSegmentDisplayDecoder port map(nIn=>secret_key(15 downto 12), ssOut=>HEX3);
	 hexx4: SevenSegmentDisplayDecoder port map(nIn=>secret_key(19 downto 16), ssOut=>HEX4);
	 hexx5: SevenSegmentDisplayDecoder port map(nIn=>secret_key(23 downto 20), ssOut=>HEX5);
	 

end RTL;


