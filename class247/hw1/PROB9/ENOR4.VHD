ENTITY ENOR4 IS 
	PORT (a,b : IN BIT ; c : OUT BIT);
END ENOR4;
ARCHITECTURE behavioral OF ENOR4 IS
BEGIN 
	c <= a NOR b AFTER 4 ns;
END behavioral;