ENTITY equiv IS 
	PORT (a,b:IN BIT; c:OUT BIT);
END equiv;

ARCHITECTURE behavioral OF equiv IS
SIGNAL tmp : BIT;
BEGIN 
	tmp <= a XOR b;
	c <= NOT tmp;
END behavioral;