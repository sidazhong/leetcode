ENTITY counter IS 
	PORT (clk1,clk2,clk3:INOUT BIT);
END counter;

ARCHITECTURE behavioral OF counter IS
BEGIN 
	clk1 <= not clk1 after 20 ns;
	clk2 <= not clk2 after 40 ns;
	clk3 <= not clk3 after 80 ns;
END behavioral;