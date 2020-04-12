package edu.sjsu.crypto.ciphersys.block;

import org.junit.jupiter.api.Test;

class AesSysTest {

	@Test
	void test() {
		/*
		String plaintext = "defend the east wall!";
		String ciphertext= "1090004b37b36a6cef050d05b93cf07c8ce99892ee216cedca169ae6c586655e";
		String pass= "GoToHell#007";
		*/
		String plaintext = "1!@#$%^";
		String ciphertext= "f062c0ccea4e9735a21cb4d523cded5f";
		String pass= "1!@#$%^&%^&&";
		
		AesSys sys = new AesSys(pass);
		System.out.println("ciphertext = [" + sys.encrypt(plaintext)+ "]");
		
		AesSys sysR= new AesSys(pass);
		System.out.println("Recovered Plaintext= [" + sysR.decrypt(ciphertext)+ "]");
	}

}
