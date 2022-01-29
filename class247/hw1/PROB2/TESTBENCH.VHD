ENTITY testbench IS
END testbench;

ARCHITECTURE structure OF testbench IS
COMPONENT equiv_tester PORT(a,b:OUT BIT; c:IN BIT); END COMPONENT;
COMPONENT equiv PORT(a,b:IN BIT; c:OUT BIT); END COMPONENT;
SIGNAL a,b,c:BIT;
BEGIN
	tester: equiv_tester PORT MAP (a,b,c);
	UUT: equiv PORT MAP (a,b,c);
END structure;