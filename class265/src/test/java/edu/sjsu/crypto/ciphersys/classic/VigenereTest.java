package edu.sjsu.crypto.ciphersys.classic;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class VigenereTest {

	@Test
	void test() {
		String pass="lemon";
		
		
		SimpleSubSys Caesar_en = new SimpleSubSys(pass.length());
		String Caesar_plaintext = "attack at dawn!";
		System.out.println("Ptext = [" + Caesar_plaintext+ "]");
		System.out.println("Ctext = [" +Caesar_en.encrypt(Caesar_plaintext)+ "]");
		
		System.out.println();
		
		SimpleSubSys Caesar_de = new SimpleSubSys(pass.length());
		String Caesar_ciphertext = "FYYFHP FY IFBS!";
		System.out.println("Ctext = [" + Caesar_ciphertext+ "]");
		System.out.println("Ptext = [" + Caesar_de.decrypt(Caesar_ciphertext)+ "]");
		
		
		
		System.out.println();
		System.out.println("=====================================");
		System.out.println();
		
		
		int demo=1;
		
		String Vigenere_plaintext = "attack at dawn!";
		Vigenere Vigenere_en = new Vigenere(pass,demo);
		if(demo==0) {
			System.out.println("Ptext = [" + Vigenere_plaintext+ "]");
		}
		System.out.println("Ctext = [" + Vigenere_en.encrypt(Vigenere_plaintext)+ "]");
		
		
		System.out.println();
		
		String Vigenere_ciphertext = "ZACIIJ JB CHFV!";
		Vigenere Vigenere_de = new Vigenere(pass,demo);
		if(demo==0) {
			System.out.println("Ctext = [" + Vigenere_ciphertext+ "]");
		}
		System.out.println("Ptext = [" + Vigenere_de.decrypt(Vigenere_ciphertext)+ "]");
	}

}
