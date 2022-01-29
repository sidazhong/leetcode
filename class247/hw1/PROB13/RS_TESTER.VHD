Entity RS_tester IS 
	PORT (R,S : OUT BIT ; Q,QBAR : IN BIT);
END RS_tester;
ARCHITECTURE behavioral OF RS_tester IS
BEGIN 
	R <= 
		'1' AFTER 0 ns,
		'0' AFTER 1 ns,
		'1' AFTER 2 ns,
		'0' AFTER 3 ns,
		'1' AFTER 4 ns,
		'0' AFTER 5 ns,
		'1' AFTER 6 ns,
		'0' AFTER 7 ns,
		'1' AFTER 8 ns,
		'0' AFTER 9 ns,
		'1' AFTER 10 ns,
		'0' AFTER 11 ns,
		'1' AFTER 12 ns,
		'0' AFTER 13 ns,
		'1' AFTER 14 ns,
		'0' AFTER 15 ns,
		'1' AFTER 16 ns;
	S <= 
		'0' AFTER 0 ns,
		'1' AFTER 1 ns,
		'0' AFTER 2 ns,
		'1' AFTER 3 ns,
		'0' AFTER 4 ns,
		'1' AFTER 5 ns,
		'0' AFTER 6 ns,
		'1' AFTER 7 ns,
		'0' AFTER 8 ns,
		'1' AFTER 9 ns,
		'0' AFTER 10 ns,
		'1' AFTER 11 ns,
		'0' AFTER 12 ns,
		'1' AFTER 13 ns,
		'0' AFTER 14 ns,
		'1' AFTER 15 ns,
		'0' AFTER 16 ns;
END behavioral;