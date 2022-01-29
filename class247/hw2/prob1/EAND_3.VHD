ENTITY EAND_3 IS 
	PORT (a,b : IN BIT ; c : OUT BIT);
END EAND_3;
ARCHITECTURE behavioral OF EAND_3 IS
BEGIN 
	c <= a AND b AFTER 3 ns;
END behavioral;