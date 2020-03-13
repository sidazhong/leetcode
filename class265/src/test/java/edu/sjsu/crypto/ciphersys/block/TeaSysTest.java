package edu.sjsu.crypto.ciphersys.block;

import org.junit.jupiter.api.Test;

class TeaSysTest {

	@Test
	void test() {
		String plaintext = "defend the east wall!";
		String ciphertext = "b02283722e3e1e115231392306f46170dbf0a4c908b4f6e2";
		String pass = "GoToHell#007";
		//String pass = "abcdefghijklmnop";
		
		TeaSys sys1 = new TeaSys(pass);
		System.out.println("Ciphertext = [" + sys1.encrypt(plaintext)+ "]");
		
		TeaSys sys2 = new TeaSys(pass);
		System.out.println("Plaintext = [" + sys2.decrypt(ciphertext)+ "]");
		
	}

}
