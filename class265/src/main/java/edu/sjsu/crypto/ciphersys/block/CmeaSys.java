package edu.sjsu.crypto.ciphersys.block;

import edu.sjsu.yazdankhah.crypto.util.abstracts.CmeaAbs;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.ConversionUtil;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.UByte;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.Word;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.StringUtil;

/**
 * CMEA cipher system
 * @author sida
   Customer: Yan Chen
 */
public class CmeaSys extends CmeaAbs {
	protected UByte[] K;
	
	public CmeaSys(String pass) {
		//generate key
		pass = StringUtil.toDividableByNRightPadZero(pass, 8).substring(0,8);
		K = ConversionUtil.binStrToUByteArr( ConversionUtil.textToBinStr(pass));
	}
	
	public String encrypt(String plaintext) {
		//cut text to blocks
		Word[] block_plaintext = ConversionUtil.textToWordArr(plaintext);
		Word[] block_ciphertext = new Word[block_plaintext.length];
		
		for (int i = 0; i < block_plaintext.length; i++) {
			block_ciphertext[i] = EncryptOneBlock(block_plaintext[i]);
		}
		
		String ciphertext = ConversionUtil.wordArrToHexStr(block_ciphertext);
		return ciphertext;
	}
	
	public String decrypt(String ciphertext) {
		//cut text to blocks
		Word[] block_ciphertext = ConversionUtil.hexStrToWordArr(ciphertext);
		Word[] block_plaintext = new Word[block_ciphertext.length];
		
		for (int i = 0; i < block_ciphertext.length; i++) {
			block_plaintext[i] = EncryptOneBlock(block_ciphertext[i]);
		}
		
		String plaintext = ConversionUtil.wordArrToText(block_plaintext).trim();
		return plaintext;
	}
	
	public Word EncryptOneBlock(Word block) {
		UByte[] pm = block.toUByteArr();
		
		Round_1(pm);
		Round_2(pm);
		UByte[] c = Round_3(pm);
		
		Word r = Word.constructFromUByteArr(c);
		
		return r;
	}
	
	public void Round_1(UByte[] pm) {
		UByte z = UByte.constructFromInteger(0);
		for (int i = 0; i < pm.length; i++) {
			UByte x = z.xor(UByte.constructFromInteger(i));
			pm[i].addMod256M((T(x)));
			z.addMod256M(pm[i]);
		}
	}
	
	public void Round_2(UByte[] pm) {
		int n = pm.length;
		int h = n/2;
		for (int i = 0; i < h; i++) {
			UByte t = pm[n-1-i].or(UByte.constructFromInteger(1));
			pm[i].xorM(t);
		}
	}
	
	public UByte[] Round_3(UByte[] pm) {
		UByte z = UByte.constructFromInteger(0);
		UByte[] c = new UByte[pm.length];
		
		for (int i = 0; i < pm.length; i++) {
			UByte k = T(z.xor(UByte.constructFromInteger(i)));
			z.addMod256M(pm[i]);
			c[i] = pm[i].subtractMod256(k);
		}
		
		return c;
	}
	
	public UByte T(UByte x) {
		UByte Q = CAVE_LOOKUP.lookUp( x.xor(K[0]).addMod256(K[1]) ).addMod256(x);
		UByte R = CAVE_LOOKUP.lookUp( Q.xor(K[2]).addMod256(K[3]) ).addMod256(x);
		UByte S = CAVE_LOOKUP.lookUp( R.xor(K[4]).addMod256(K[5]) ).addMod256(x);
		UByte r = CAVE_LOOKUP.lookUp( S.xor(K[6]).addMod256(K[7]) ).addMod256(x);
		
		return r;
	}
	

	
}























