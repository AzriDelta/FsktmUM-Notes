library ieee;
use ieee.std_logic_1164.all;

entity rotate_All is
	port (
		CLOCK_50: in std_logic;
		SW: in std_logic_vector (1 downto 0);
		LEDR: out std_logic_vector (7 downto 0)
	
	);
end entity;

architecture behav of rotate_All is
	
	component counter is
		port (
			clock_50: in std_logic;
			clock_out: out std_logic
		);
	end component;
	
	component rotate is
		port (
			CLOCK: in std_logic;
			SW: in std_logic;
			RST: in std_logic;
			LEDR: out std_logic_vector (7 downto 0)
		
		);
	end component;
	
	signal S_CLOCKOUT: std_logic;
	signal S_LEDR: std_logic_vector (7 downto 0);
	
	begin
	
		counter_0: counter port map (CLOCK_50, S_CLOCKOUT);
		rotate_0: rotate port map (S_CLOCKOUT, SW(0), SW(1), S_LEDR);
	
	LEDR <= S_LEDR;

end behav;