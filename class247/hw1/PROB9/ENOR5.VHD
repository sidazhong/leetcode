ENTITY ENOR5 IS 
	PORT (a,b : IN BIT ; c : OUT BIT);
END ENOR5;
ARCHITECTURE behavioral OF ENOR5 IS
BEGIN 
	c <= a NOR b AFTER 4 ns;
END behavioral;