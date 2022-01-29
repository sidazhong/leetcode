ENTITY EXOR IS 
	PORT (a,b : IN BIT ; c : OUT BIT);
END EXOR;

ARCHITECTURE behavioral OF EXOR IS
BEGIN 
	c <= a XOR b AFTER 10 ns;
END behavioral;