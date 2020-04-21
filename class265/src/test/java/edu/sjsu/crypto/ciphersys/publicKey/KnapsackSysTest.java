package edu.sjsu.crypto.ciphersys.publicKey;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Scanner;

import org.junit.jupiter.api.Test;

class KnapsackSysTest {

	@Test
	void test() throws FileNotFoundException {
		
		String pass = "I like this class";
		String keyHolderName = "sidazhong";
		String publicKeyFile = "knapsackPublicKey.txt";
		String privateKeyFile = "knapsackPrivateKey.txt";
		KnapsackSys sys = new KnapsackSys();
		
		sys.generateKeys(pass, keyHolderName);
		//sys.getPrivateKey().save(privateKeyFile);
		//sys.getPublicKey().save(publicKeyFile);
		
		System.out.println("Private Key = [\n" + sys.getPrivateKey() + "\n]\n");
		System.out.println("Public Key = [\n" + sys.getPublicKey() + "\n]\n");
		
		String plaintext = "defend the east wall!";
		String ciphertext ="0df0057b3c5352e3d0b5c0da3e6e26957d09fa969a75e80d7250b20cac24fe788af90e5eca34894d19f9605690961fedb446ba";	
		
		sys.getPublicKey().restore(publicKeyFile);
		System.out.println("ciphertext = [" + sys.encrypt(plaintext, sys.getPublicKey())+ "]");
			
		sys.getPrivateKey().restore(privateKeyFile);
		System.out.println("PlaintextR = [" + sys.decrypt(ciphertext, sys.getPrivateKey())+ "]");
	}
	

}































