ENTITY ENOR1 IS 
	PORT (a,b : IN BIT ; c : OUT BIT);
END ENOR1;
ARCHITECTURE behavioral OF ENOR1 IS
BEGIN 
	c <= a NOR b AFTER 4 ns;
END behavioral;