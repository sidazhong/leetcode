package edu.sjsu.crypto.ciphersys.publicKey;

import java.math.BigInteger;
import java.util.Random;

import edu.sjsu.yazdankhah.crypto.util.abstracts.KnapsackAbs;
import edu.sjsu.yazdankhah.crypto.util.ciphersysdatatypes.Knapsack;
import edu.sjsu.yazdankhah.crypto.util.ciphersysdatatypes.KnapsackPrivateKey;
import edu.sjsu.yazdankhah.crypto.util.ciphersysdatatypes.KnapsackPublicKey;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.ConversionUtil;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.Function;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.StringUtil;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.Bit;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.Word;


/**
 * KnapsackSys cipher system
 * @author sida
 * Customer: Yan Chen
 */
public class KnapsackSys extends KnapsackAbs {
	protected String pass;
	protected String keyHolderName;
	
	protected KnapsackPublicKey publicKey = new KnapsackPublicKey(null,null);
	protected KnapsackPrivateKey privateKey = new KnapsackPrivateKey(null,null,null);
	protected BigInteger m;
	protected BigInteger p;

	public String encrypt(String plaintext, KnapsackPublicKey publicKey) {
		this.publicKey=publicKey;
		
		Word[] block_plaintext = ConversionUtil.textToWordArr(plaintext);
		BigInteger[] block_ciphertext = new BigInteger[block_plaintext.length];
		
		for (int i = 0; i < block_plaintext.length; i++) {
			block_ciphertext[i] = EncryptOneBlock(block_plaintext[i],publicKey.getWp());
		}
		
		String ciphertext = ConversionUtil.bigIntegerArrToHexStr(block_ciphertext, CIPHER_BLOCK_SIZE_BITS );
		
		return ciphertext;
	}
	
	public BigInteger EncryptOneBlock(Word block_plaintext, Knapsack wp) {
		Bit[] bit_block = block_plaintext.toBitArr();
		BigInteger CSum = wp.sumSelective(bit_block);
		
		return CSum;
	}
	
	public String decrypt(String ciphertext, KnapsackPrivateKey privateKey) {
		this.privateKey=privateKey;
		
		BigInteger[] block_ciphertext = ConversionUtil.hexStrToBigIntegerArr(ciphertext, CIPHER_BLOCK_SIZE_BITS);
		String block_plaintext = "";
		
		BigInteger m = this.privateKey.getM();
		BigInteger p = this.privateKey.getP();
		BigInteger mr = m.modInverse(p);
		BigInteger sum;
		
		for (int i = 0; i < block_ciphertext.length; i++) {
			sum = block_ciphertext[i].multiply(mr).mod(p);
			block_plaintext += ConversionUtil.bitArrToText(solveSuperIncreasingKnapsack(this.privateKey.getW(), sum));
		}
		
		return block_plaintext.trim();
	}

	public Bit[] solveSuperIncreasingKnapsack(Knapsack su_knapsack, BigInteger c) {
		BigInteger[] w = su_knapsack.getW();
		
		Bit[] rs = new Bit[w.length];
		for (int i = w.length-1; i >= 0; i--) {
			if(c.compareTo(w[i])==-1) {
				rs[i]=Bit.constructFromBoolean(false);
			}else {
				rs[i]=Bit.constructFromBoolean(true);
				c = c.subtract(w[i]);
			}
		}
		return rs;
	}
	
	
	public void generateKeys(String pass, String keyHolderName) {
		this.pass = StringUtil.rightTruncRightPadWithZeros(ConversionUtil.textToBinStr(pass), KEY_SIZE_BITS );
		this.keyHolderName=keyHolderName;
		
		Random rnd = Function.getRandomGenerator64(this.pass);
		
		Knapsack knapsack = new Knapsack(KNAPSACK_SIZE, rnd);
		
		//generate superIncreaseing Array
		Knapsack su_knapsack = Knapsack.constructFromSuperIncreasingArr(knapsack.getW());
		
		//generate regular Array
		this.m = Function.generateRandomPositiveInteger(rnd);
		this.p = Function.generateRandomPrimeBigIntegerBiggerThan(su_knapsack.memberAt(31), rnd);
		Knapsack re_knapsack = su_knapsack.toRegularKnapsack(this.m, this.p);
		
		this.publicKey = new KnapsackPublicKey(keyHolderName,re_knapsack);
		this.privateKey = new KnapsackPrivateKey(this.m,this.p,su_knapsack);
	}
	
	public KnapsackPrivateKey getPrivateKey() {
		return this.privateKey;
	}

	public KnapsackPublicKey getPublicKey() {
		return this.publicKey;
	}
}






































