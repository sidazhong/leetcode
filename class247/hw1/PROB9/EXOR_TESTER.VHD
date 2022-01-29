Entity EXOR_tester IS 
	PORT (a,b : OUT BIT ; c : IN BIT);
END EXOR_tester;
ARCHITECTURE behavioral OF EXOR_tester IS
BEGIN 
	a <= '0' AFTER  0 ns,
		'0' AFTER 100 ns,
		'1' AFTER 200 ns,
		'1' AFTER 300 ns;
	
	b <= '0' AFTER  0 ns,
		'1' AFTER 100 ns,
		'0' AFTER 200 ns,
		'1' AFTER 300 ns;
END behavioral;