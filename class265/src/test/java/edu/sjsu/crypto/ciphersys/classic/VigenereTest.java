package edu.sjsu.crypto.ciphersys.classic;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.Test;

class VigenereTest {
	/**
	 * demo attack	
	 * 1:caesar decode
	 * 2:caesar attack
	 * 3:vigenere decode 
	 * 4:vigenere attack
	 */
	public int show_demo=2;
	
	/**
	 * if it is a caesar attack, no limit to key size
	 * if it is a vigenere attack, key size has to be 6, only for demo purpose  
	 */
	
	public int caesar_key=5;
	public String vigenere_key="dell";
	
	
	
	
	
	//default test plaintext is "plain.txt", can also use "plain1.txt" , "plain2.txt", "plain3.txt" to see the different
	public String plain_text_filename = "plain.txt";	
	
	//result of caesar cipher text name
	public String caesar_cipher_text_filename = "c_cipher.txt";
	
	//result of vigenere cipher text name
	public String vigenere_cipher_text_filename = "v_cipher.txt";
	
	//test mode
	public Integer demo = 0;
	
	@Test
	void test() throws IOException, InterruptedException {
		//initialization
		String plaintext = this.read_text(this.plain_text_filename);
	    
		System.out.println();
		if(show_demo==1 || show_demo==3) {
			System.out.println("==================DECODE===================");
		}
		
		if(show_demo==1) {
			//start Caesar cipher encode, and save the cipher to "c_cipher.txt"
			SimpleSubSys caesar_en = new SimpleSubSys(caesar_key);
			this.save_text(caesar_cipher_text_filename, caesar_en.encrypt(plaintext));
			
			//start Caesar cipher decode
			SimpleSubSys caesar_de = new SimpleSubSys(caesar_key);
			String caesar_ciphertext = this.read_text(this.caesar_cipher_text_filename);
			System.out.println("Ptext = [" + caesar_de.decrypt(caesar_ciphertext)+ "]");
			System.out.println("Ctext = [" + caesar_ciphertext + "]");
		}
		
		//start Vigenere cipher decode
		if(show_demo==3) {
			Vigenere vigenere_en = new Vigenere(vigenere_key,demo);
			this.save_text(vigenere_cipher_text_filename, vigenere_en.encrypt(plaintext));
			
			Vigenere vigenere_de = new Vigenere(vigenere_key,this.demo);
			String vigenere_ciphertext = this.read_text(this.vigenere_cipher_text_filename);
			System.out.println("Ptext = [" + vigenere_de.decrypt(vigenere_ciphertext)+ "]");
			System.out.println("Ctext = [" + vigenere_ciphertext + "]");
		}
	
		System.out.println();
		if(show_demo==2 || show_demo==4) {
			System.out.println("==================ATTACK===================");
		}
		
		//start to attack caesar
		if(show_demo==2) {
			attack attack_cipher = new attack();
			attack_cipher.attack_caesar(this.read_text(caesar_cipher_text_filename));
		}
	
		//start to attack vigenere
		if(show_demo==4) {
			attack attack_vigenere = new attack();
			attack_vigenere.attack_vigenere(this.read_text(vigenere_cipher_text_filename));
		}
	}
	
	//read file
	public String read_text(String filename) throws IOException {
		BufferedReader r = new BufferedReader( new FileReader( filename ) );
		String s = "", line = null;
		while ((line = r.readLine()) != null) {
		    s += line;
		}
		r.close();
		return s;
	}
	
	//save file
	public void save_text(String filename, String text) throws IOException {
		FileWriter r = new FileWriter(filename);
	    r.write(text);
	    r.close();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
