ENTITY ENOT_2 IS 
	PORT (a: IN BIT ; c : OUT BIT);
END ENOT_2;
ARCHITECTURE behavioral OF ENOT_2 IS
BEGIN 
	c <= NOT a AFTER 2 ns;
END behavioral;