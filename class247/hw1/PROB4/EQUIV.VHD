ENTITY equiv IS 
	PORT (a,b:IN BIT; c:OUT BIT);
END equiv;

ARCHITECTURE behavioral OF equiv IS
SIGNAL tmp : BIT;
BEGIN 
	c <= NOT tmp AFTER  3 ns;
	tmp <= a XOR b AFTER  2 ns;
END behavioral;