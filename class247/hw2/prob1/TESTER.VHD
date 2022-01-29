Entity TESTER IS 
	PORT (A : OUT BIT ; C : IN BIT);
END TESTER;
ARCHITECTURE behavioral OF TESTER IS
BEGIN 
	A <= '0' AFTER 0 ns,
				'1' AFTER 20 ns;
END behavioral;	