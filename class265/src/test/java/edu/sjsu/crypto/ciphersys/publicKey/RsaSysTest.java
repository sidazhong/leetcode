package edu.sjsu.crypto.ciphersys.publicKey;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class RsaSysTest {

	@Test
	void test() {
		String pass = "GoToHell#007";
		String keyHolderName = "Ahmad";
		String publicKeyFile = "YanRsaPublicKey.txt";
		String privateKeyFile = "rsaPrivateKey.txt";
		RsaSys sys = new RsaSys();
		
		/*
		sys.generateKeys(pass, keyHolderName);
		sys.getPublicKey().save(publicKeyFile);
		sys.getPrivateKey().save(privateKeyFile);
		System.out.println("Public Key = [\n" + sys.getPublicKey() + "\n]\n");
		System.out.println("Private Key = [\n" + sys.getPrivateKey() + "\n]\n");
		*/
		
		String plaintext = "I love this class!";
		sys.getPublicKey().restore(publicKeyFile);
		System.out.println("ciphertext = [" + sys.encrypt(plaintext, sys.getPublicKey())+ "]");
		
		String ciphertext ="3d23ca292b772cc13d3a357a39da9d26";
		sys.getPrivateKey().restore(privateKeyFile);
		System.out.println("PlaintextR = [" + sys.decrypt(ciphertext, sys.getPrivateKey())+ "]");
	}
	

}
