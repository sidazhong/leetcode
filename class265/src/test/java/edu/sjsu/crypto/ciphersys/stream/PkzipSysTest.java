package edu.sjsu.crypto.ciphersys.stream;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class PkzipSysTest {

	@Test
	void test() {
		String plaintext = "Sida love this class!";
		String pass = "CDC";
		String ciphertext = "320c67794ea36a81b6";
		
		PkzipSys sys = new PkzipSys (pass);
		System.out.println("ciphertext = [" + sys.encrypt(plaintext)+ "]");
		
		PkzipSys sysR = new PkzipSys (pass);
		System.out.println("Recovered Plaintext = [" + sysR.decrypt(ciphertext)+ "]");
	}

}

