package edu.sjsu.crypto.ciphersys.block;

import org.junit.jupiter.api.Test;

class TeaSysTest {

	@Test
	void test() {
		String plaintext = "sida love this class!";
		String ciphertext = "0667ad148a7283f9321e4644de186af00c26c00058feff88";
		String pass = "v!ru5";
		//String pass = "abcdefghijklmnop";
		
		TeaSys sys1 = new TeaSys(pass);
		System.out.println("Ciphertext = [" + sys1.encrypt(plaintext)+ "]");
		
		TeaSys sys2 = new TeaSys(pass);
		System.out.println("Plaintext = [" + sys2.decrypt(ciphertext)+ "]");
		
	}

}
