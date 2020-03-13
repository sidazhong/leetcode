package edu.sjsu.crypto.ciphersys.block;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class CmeaSysTest {

	@Test
	void CmeaSys() {
		String plaintext = "sida like this class!";
		String pass = "v!ru5";
		String ciphertext = "20c6a5f7cec9bda39f9a5d11249fcd24";
		
		CmeaSys sys1 = new CmeaSys(pass);
		System.out.println("Ciphertext = [" + sys1.encrypt(plaintext)+ "]");
		
		CmeaSys sys2 = new CmeaSys(pass);
		System.out.println("Plaintext = [" + sys2.decrypt(ciphertext)+ "]");
	}

}
