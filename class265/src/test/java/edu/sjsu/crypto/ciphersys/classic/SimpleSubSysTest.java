package edu.sjsu.crypto.ciphersys.classic;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class SimpleSubSysTest {

	@Test
	void SimpleSubSys() {
		int pass = 6;
		SimpleSubSys sys_en = new SimpleSubSys(pass);
		String plaintext = "attack at dawn!";
		System.out.println(plaintext);
		System.out.println("Ciphertext = [" + sys_en.encrypt(plaintext)+ "]");
		
		System.out.println();
		
		SimpleSubSys sys_de = new SimpleSubSys(pass);
		String ciphertext = "PIIPRZ PI SPLC!";
		System.out.println(ciphertext);
		System.out.println("Recovered Plaintext = [" + sys_de.decrypt(ciphertext)+ "]");
	}

}
