ENTITY clock IS 
	PORT (CLK:INOUT BIT);
END clock;

ARCHITECTURE behavioral OF clock IS
BEGIN 
	CLK <= not CLK after 20 ns;
END behavioral;