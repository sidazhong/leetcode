ENTITY ENOT_4 IS 
	PORT (a: IN BIT ; c : OUT BIT);
END ENOT_4;
ARCHITECTURE behavioral OF ENOT_4 IS
BEGIN 
	c <= NOT a AFTER 4 ns;
END behavioral;	