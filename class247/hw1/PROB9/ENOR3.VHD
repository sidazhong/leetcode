ENTITY ENOR3 IS 
	PORT (a,b : IN BIT ; c : OUT BIT);
END ENOR3;
ARCHITECTURE behavioral OF ENOR3 IS
BEGIN 
	c <= a NOR b AFTER 4 ns;
END behavioral;