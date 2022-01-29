ENTITY EAND_1 IS 
	PORT (a,b : IN BIT ; c : OUT BIT);
END EAND_1;
ARCHITECTURE behavioral OF EAND_1 IS
BEGIN 
	c <= a AND b AFTER 1 ns;
END behavioral;