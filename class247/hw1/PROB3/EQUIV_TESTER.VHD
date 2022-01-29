Entity equiv_tester IS 
	PORT (a,b : OUT BIT ; c : IN BIT);
END equiv_tester;

ARCHITECTURE behavioral OF equiv_tester IS
BEGIN 
	a <= '0' AFTER  0 ns,
		'0' AFTER 10 ns,
		'1' AFTER 20 ns,
		'1' AFTER 30 ns;
	
	b <= '0' AFTER  0 ns,
		'1' AFTER 10 ns,
		'0' AFTER 20 ns,
		'1' AFTER 30 ns;

END behavioral;