Entity RS_tester IS 
	PORT (R,S : OUT BIT ; Q,QBAR : IN BIT);
END RS_tester;
ARCHITECTURE behavioral OF RS_tester IS
BEGIN 
	R <= '1' AFTER  0 ns;
	S <= '0' AFTER  0 ns;
END behavioral;