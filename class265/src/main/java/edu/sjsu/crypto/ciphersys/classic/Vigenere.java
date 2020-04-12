package edu.sjsu.crypto.ciphersys.classic;
import edu.sjsu.yazdankhah.crypto.util.shiftregisters.CSR;

/**
 * Vigenere Cipher
 * @author sida
 */
public class Vigenere {
	protected char[][] lookupTable = new char[26][26];
	protected String ALPHRA = "abcdefghijklmnopqrstuvwxyz";
	protected String pass;
	protected String key;
	protected int demo;
	
	
	public Vigenere(String pass, int demo) {
		this.pass=pass.toLowerCase();
		this.buildLookuptable();
		this.demo=demo;
		if(this.demo==1) {
			this.printLookuptable();
		}
	}
	
	public String encrypt(String plaintext) {
		this.generateKey(plaintext);
		
		if(this.demo==1) {
			System.out.println("pass = [" + this.pass+ "]");
			System.out.println("key = [" + this.key+ "]");
			System.out.println("Ptext = [" + plaintext+ "]");
		}
		
		
		char[] plaintext_array = plaintext.toLowerCase().toCharArray();
		char[] key_array = this.key.toLowerCase().toCharArray();
		char[] ciphertext_array = new char[plaintext_array.length];
		
		for (int i = 0; i < plaintext_array.length; i++) {
			if(Character.isLetter(plaintext_array[i])) {
				int index1=this.encrypt_look(ALPHRA,plaintext_array[i]);
				int index2=this.encrypt_look(ALPHRA,key_array[i]);
				ciphertext_array[i]=this.lookupTable[index1][index2];
			}else {
				ciphertext_array[i]=plaintext_array[i];
			}
		}
		
		String ciphertext = new String(ciphertext_array).toUpperCase();
		
		return ciphertext;
	}
	
	public int encrypt_look(String text,char c) {
		return (text.indexOf(c)+26-this.pass.length())%26;
	}
	
	public int decrypt_look(char[] text,char c) {
		String tmp = new String(text);
		return (tmp.indexOf(c)+26)%26;
	}
	
	public String decrypt(String ciphertext) {
		this.generateKey(ciphertext);
		if(this.demo==1) {
			System.out.println("pass = [" + this.pass+ "]");
			System.out.println("key = [" + this.key+ "]");
			System.out.println("Ctext = [" + ciphertext+ "]");
		}
		
		
		ciphertext = ciphertext.toLowerCase();
		
		char[] ciphertext_array = ciphertext.toLowerCase().toCharArray();
		char[] key_array = this.key.toLowerCase().toCharArray();
		char[] plaintext_array = new char[ciphertext_array.length];
		
		for (int i = 0; i < ciphertext_array.length; i++) {
			if(Character.isLetter(ciphertext_array[i])) {
				int index1=0;
				int index2=this.decrypt_look(lookupTable[this.encrypt_look(ALPHRA,key_array[i])],ciphertext_array[i]);
				plaintext_array[i]=this.lookupTable[index1][index2];
			}else {
				plaintext_array[i]=ciphertext_array[i];
			}
		}
		
		String plaintext = new String(plaintext_array).toLowerCase();
		
		return plaintext;
	}
	
	public void generateKey(String text) {
		char[] text_array=text.toCharArray();
		char[] pass_array=this.pass.toCharArray();
		char[] key_array=new char[text.length()];
		
		int ii=0;
		for(int i = 0; i < text_array.length; i++) {
			if(pass_array.length-1==i%pass_array.length) {
				ii=0;
			}else {
				ii++;
			}
			key_array[i]=pass_array[ii];
		}
		
		this.key=new String(key_array);
	}
	
	public void buildLookuptable() {
		CSR alpha_csr = CSR.constructFromText(ALPHRA);
		
		for(int i = 0; i < 26; i++) {
			char[] alpha_array = alpha_csr.rotateLeft(i+pass.length()).toCharArr();
			for(int ii = 0; ii < 26; ii++) {
				this.lookupTable[i][ii]=alpha_array[ii];
			}
		}
	}
	
	public void printLookuptable() {
		for (int i = 0; i < this.lookupTable.length; i++) {
		    for (int j = 0; j < this.lookupTable[i].length; j++) {
		        System.out.print(this.lookupTable[i][j] + " ");
		    }
		    System.out.println();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
