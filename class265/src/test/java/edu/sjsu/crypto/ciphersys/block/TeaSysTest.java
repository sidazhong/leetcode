package edu.sjsu.crypto.ciphersys.block;

import org.junit.jupiter.api.Test;

class TeaSysTest {

	@Test
	void test() {
		String plaintext = "sida love this class!";
		String ciphertext = "649578fe6bcb072d639dfc30bb4e2afd80eba712ab0db908";
		String pass = "v!ru5";
		
		TeaSys sys1 = new TeaSys(pass);
		System.out.println("Ciphertext = [" + sys1.encrypt(plaintext)+ "]");
		
		TeaSys sys2 = new TeaSys(pass);
		System.out.println("Plaintext = [" + sys2.decrypt(ciphertext)+ "]");
		
	}

}
