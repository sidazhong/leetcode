ENTITY ENOR IS 
	PORT (a,b : IN BIT ; c : OUT BIT);
END ENOR;
ARCHITECTURE behavioral OF ENOR IS
BEGIN 
	c <= a NOR b AFTER 4 ns;
END behavioral;