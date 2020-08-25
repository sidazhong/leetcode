package edu.sjsu.crypto.ciphersys.publicKey;

import java.math.BigInteger;
import java.util.Random;

import edu.sjsu.yazdankhah.crypto.util.abstracts.RsaAbs;
import edu.sjsu.yazdankhah.crypto.util.ciphersysdatatypes.RsaPrivateKey;
import edu.sjsu.yazdankhah.crypto.util.ciphersysdatatypes.RsaPublicKey;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.ConversionUtil;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.Function;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.StringUtil;

/**
 * RsaSys cipher system
 * @author sida
 * Customer: Yan Chen
 */


public class RsaSys extends RsaAbs {
	protected String pass;
	protected String keyHolderName;
	
	protected RsaPublicKey publicKey = new RsaPublicKey(null, null, null);
	protected RsaPrivateKey privateKey = new RsaPrivateKey(null, null);
	
	public String encrypt(String plaintext, RsaPublicKey publicKey) {
		this.publicKey = publicKey;
		
		BigInteger[] block_plaintext = ConversionUtil.textToBigIntegerArr(plaintext,PLAIN_BLOCK_SIZE_BITS);
		BigInteger[] block_ciphertext = new BigInteger[block_plaintext.length];
		
		for (int i = 0; i < block_plaintext.length; i++) {
			block_ciphertext[i] = EncryptOneBlock(block_plaintext[i],this.publicKey);
		}
		
		String ciphertext = ConversionUtil.bigIntegerArrToHexStr(block_ciphertext, CIPHER_BLOCK_SIZE_BITS );
		
		return ciphertext;
	}
	
	public BigInteger EncryptOneBlock(BigInteger block_plaintext, RsaPublicKey publicKey){
		BigInteger e = publicKey.getE();
		BigInteger N = publicKey.getN();
		BigInteger C = block_plaintext.modPow(e, N);
		
		return C; 
	}
	
	public String decrypt(String ciphertext, RsaPrivateKey privateKey) {
		this.privateKey = privateKey;
		
		BigInteger[] block_ciphertext = ConversionUtil.hexStrToBigIntegerArr(ciphertext, CIPHER_BLOCK_SIZE_BITS );    
		BigInteger[] block_plaintext = new BigInteger[block_ciphertext.length];
		
		for (int i = 0; i < block_ciphertext.length; i++) {
			block_plaintext[i] = EncryptOneBlock(block_ciphertext[i],this.privateKey);
		}
		
		String plaintext = ConversionUtil.bigIntegerArrToText(block_plaintext, PLAIN_BLOCK_SIZE_BITS ); 
		
		return plaintext.trim();
	}
	
	public BigInteger EncryptOneBlock(BigInteger block_ciphertext, RsaPrivateKey privateKey){
		BigInteger d = privateKey.getD();
		BigInteger N = privateKey.getN();
		BigInteger M = block_ciphertext.modPow(d, N);
		
		return M;
	}

	public void printKey() {
		
	}

	public void generateKeys(String pass, String keyHolderName) {
		this.pass = StringUtil.rightTruncRightPadWithZeros(ConversionUtil.textToBinStr(pass), KEY_SIZE_BITS );
		Random rnd = Function.getRandomGenerator64(this.pass);
		
		BigInteger e = Function.generateRandomPrimeBigInteger(E_SIZE_BITS, rnd);
		BigInteger p = Function.generateRandomPrimeBigInteger(P_SIZE_BITS, rnd);
		BigInteger q = Function.generateRandomPrimeBigInteger(Q_SIZE_BITS, rnd);
		
		BigInteger N = p.multiply(q);
		
		BigInteger tmp_d1 = p.subtract(BigInteger.valueOf(1));
		BigInteger tmp_d2 = q.subtract(BigInteger.valueOf(1));
		BigInteger d = e.modInverse(tmp_d1.multiply(tmp_d2));
		
		this.publicKey = new RsaPublicKey(keyHolderName,N,e);
		this.privateKey = new RsaPrivateKey(N,d);
	}

	public RsaPublicKey getPublicKey() {
		return this.publicKey;
	}
	
	public RsaPrivateKey getPrivateKey() {
		return this.privateKey;
	}
}









































