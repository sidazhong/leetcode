ENTITY testbench IS
END testbench;
ARCHITECTURE structure OF testbench IS
COMPONENT ENOR_tester PORT(a,b:OUT BIT;c:IN BIT); END COMPONENT;
COMPONENT ENOR PORT(a,b:IN BIT;c:OUT BIT); END COMPONENT;
SIGNAL a,b,c:BIT;
BEGIN
	tester: ENOR_tester PORT MAP (a,b,c);
	UUT: ENOR PORT MAP (a,b,c);
END structure;