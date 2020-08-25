package edu.sjsu.crypto.ciphersys.classic;

import java.util.Arrays;

public class attack {
	protected String alpha[] = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
	
	protected Integer finger_print[] = {849,149,220,425,1116,222,201,609,754,16,129,402,240,674,750,192,9,758,632,935,275,97,256,15,199,7};
	protected Integer cipher_print[] = new Integer[alpha.length];
	
	protected Integer finter_print_sortvalue[] = new Integer[alpha.length];
	protected Integer cipher_print_sortvalue[] = new Integer[alpha.length];
	
	protected Integer static_difference[] = new Integer[alpha.length];
	protected Integer word_length = 4;
	
	protected Integer pool[] = {0,0,0}; 
	
	protected Integer caesar = 0;
	
	/**
	 * 
	 * @param cipher_text
	 * @return
	 */
	public String[] attack_caesar(String cipher_text) {
		//initialization
		cipher_text = cipher_text.toLowerCase();
		char[] cipher_text_array = cipher_text.toCharArray();
		for(int i=0;i<cipher_print.length;i++) {cipher_print[i]=0;};
		for(int i=0;i<finter_print_sortvalue.length;i++) {finter_print_sortvalue[i]=0;}
		for(int i=0;i<cipher_print_sortvalue.length;i++) {cipher_print_sortvalue[i]=0;}
		
		//get cipher print
		for(int i=0;i<cipher_text_array.length;i++) {
			if(!Character.isLetter(cipher_text_array[i])) {
				continue;
			}
			int alpha_index =  Arrays.asList(alpha).indexOf(String.valueOf(cipher_text_array[i]));
			this.cipher_print[alpha_index]++;
		}
		
		//sort finger_print
		Integer finger_print_sort[] = finger_print.clone();
		Arrays.sort(finger_print_sort);
		for(int i=0;i<finger_print_sort.length;i++) {
			finter_print_sortvalue[i] = Arrays.asList(finger_print).indexOf(finger_print_sort[i]);
		}

		//sort cipher_print
		Integer cipher_print_sort[] = cipher_print.clone();
		Arrays.sort(cipher_print_sort);
		for(int i=0;i<cipher_print.length;i++) {
			cipher_print_sortvalue[i] = Arrays.asList(cipher_print).indexOf(cipher_print_sort[i]);
		}
		
		//static difference
		for(int i=0;i<finter_print_sortvalue.length;i++) {
			static_difference[i]=finter_print_sortvalue[i] - cipher_print_sortvalue[i];
		}
		
		//this.print_static_difference();
		
		//get most frequency value
		pool[0] = this.getPopularElement(static_difference,pool);
		pool[1] = this.getPopularElement(static_difference,pool);
		pool[2] = this.getPopularElement(static_difference,pool);
		
		String text[] = new String[3];
		for(int i=0;i<pool.length;i++) {
			if(caesar==0) {
				SimpleSubSys caesar_de = new SimpleSubSys(-pool[i]);
				text[i] = caesar_de.decrypt(cipher_text);
				System.out.println("possible key = [" + -pool[i] + "]");
				System.out.println("Ptext = [" + caesar_de.decrypt(cipher_text)+ "]");
				System.out.println("\n");
				break;
			}
		}
		
		return text;
	}
	
	
	protected String attack_vigenere(String cipher_text) {
		cipher_text = cipher_text.toLowerCase();
		char[] cipher_text_array = cipher_text.toCharArray();
		String key[] = new String[3];
		caesar = 1;
		
		//break the cipher_text into fragment
		for(int i=0;i<word_length;i++) {
			char[] fragment = new char[cipher_text_array.length];
			
			for(int ii=i;ii<cipher_text_array.length;ii++) {
				if((ii-i)%(word_length)!=0) {
					continue;
				}
				fragment[ii]+=cipher_text_array[ii];
			}
			
			//uion the fragment to a fragment_cipher
			String fragment_cipher = "";
			for(int iii=0;iii<fragment.length;iii++) {
				if(Character.isLetter(fragment[iii])) {
					fragment_cipher += fragment[iii];
				}
			}
			
			//use attack_caesar to break each fragment_cipher
			this.attack_caesar(fragment_cipher);
			System.out.println();
			System.out.println("key position "+(i+1)+", top 3 possible letter:");
			for(int k=0;k<key.length;k++) {
				key[k]="";
				
				if(pool[k]<0 || pool[k]==0) {
					key[k] = alpha[-pool[k]];
				}else {
					key[k] = alpha[pool[k]-1];
				}
				
				System.out.print("["+key[k]+"]");
			}
			
			System.out.println();
		}
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//get most frequency value
	public int getPopularElement(Integer[] a, Integer[] b){
		Integer count = 1, tempCount;
		Integer popular = a[0];
		Integer temp = 0;
		for (int i = 0; i < (a.length - 1); i++){
			temp = a[i];
			if(temp==b[0] || temp==b[1] || temp==b[2]) {
				continue;
			}
			tempCount = 0;
			for (int j = 1; j < a.length; j++){
				if (temp == a[j]) {
					tempCount++;
				}
			}
			if (tempCount > count){
				popular = temp;
				count = tempCount;
			}
		}
		return popular;
	}
	
	public void finger_print() {
	    String bar = ""; 
	    for(int i=0;i<this.finger_print.length;i++) {
	    	
	    	bar += this.alpha[i];
	    	for(int ii=0;ii<this.finger_print[i];ii++) {
	    		bar += "=";
	    	}
	    	
	    	bar += "\n";
	    	
	    	bar += this.alpha[i];
	    	for(int ii=0;ii<this.cipher_print[i];ii++) {
	    		bar += "-";
	    	}
	    	
	    	bar += "\n\n";
	    }
	    System.out.println(bar);
	}
	
	public void print_static_difference() {
		System.out.println("=================");
		for(int i=0;i<static_difference.length;i++) {
			System.out.println(static_difference[i]);
		}
		System.out.println("=================");
	}
	
}





























