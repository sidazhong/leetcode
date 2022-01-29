ENTITY ENOR2 IS 
	PORT (a,b : IN BIT ; c : OUT BIT);
END ENOR2;
ARCHITECTURE behavioral OF ENOR2 IS
BEGIN 
	c <= TRANSPORT a NOR b after 4 ns;
END behavioral;