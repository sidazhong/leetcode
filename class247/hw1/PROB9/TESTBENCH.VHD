ENTITY testbench IS
END testbench;
ARCHITECTURE structure OF testbench IS
COMPONENT EXOR_tester PORT(a,b:OUT BIT; c:IN BIT); END COMPONENT;
COMPONENT EXOR PORT(a,b:IN BIT; c:OUT BIT); END COMPONENT;
SIGNAL a,b,c:BIT;
BEGIN
	tester: EXOR_tester PORT MAP (a,b,c);
	UUT: EXOR PORT MAP (a,b,c);
END structure; 