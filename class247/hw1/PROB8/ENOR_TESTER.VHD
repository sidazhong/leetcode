Entity ENOR_tester IS 
	PORT (a,b : OUT BIT ; c : IN BIT);
END ENOR_tester;
ARCHITECTURE behavioral OF ENOR_tester IS
BEGIN 
	a <= '0' AFTER  0 ns,
		'0' AFTER 20 ns,
		'1' AFTER 40 ns,
		'1' AFTER 80 ns;
	
	b <= '0' AFTER  0 ns,
		'1' AFTER 20 ns,
		'0' AFTER 40 ns,
		'1' AFTER 80 ns;
END behavioral;