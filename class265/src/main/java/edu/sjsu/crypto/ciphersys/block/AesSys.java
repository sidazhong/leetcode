package edu.sjsu.crypto.ciphersys.block;

import edu.sjsu.yazdankhah.crypto.util.abstracts.AesAbs;
import edu.sjsu.yazdankhah.crypto.util.ciphersysdatatypes.AesState;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.ConversionUtil;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.StringUtil;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.UByte;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.Word;

public class AesSys extends AesAbs{
	protected AesState[] SK = new AesState[SUBKEYS_ARRAY_SIZE ];
	
	public AesSys (String pass) {
		pass = StringUtil.rightTruncRightPadWithZeros(ConversionUtil.textToBinStr(pass), AES_KEY_SIZE_BITS);
		AesState K = AesState.constructFromBinStr(pass);
		
		SK = GenerateSubKey(K);
		//printSubKeysArray();
	}
	
	private AesState[] GenerateSubKey(AesState K) {
		SK[0]=K;
		for (int r = 1; r <= AES_ROUND; r++) {
			SK[r] = OneRoundKeyGeneration(SK[r-1],r);
		}
		
		return SK;
	}
	
	private AesState OneRoundKeyGeneration(AesState Q, int r) {
		
		Word[] WArr = Q.toWordArr();
		WArr[0] = WArr[0].xor(g(WArr[3],r));
		WArr[1] = WArr[1].xor(WArr[0]);
		WArr[2] = WArr[2].xor(WArr[1]);
		WArr[3] = WArr[3].xor(WArr[2]);
		
		AesState rs = AesState.constructFromWordArr(WArr);
		
		return rs;
	}
	
	private Word g(Word W0, int r) {
		
		Word W1 = W0.rotateLeft(8);
		
		UByte[] U1 = W1.toUByteArr();
		for (int i = 0; i < U1.length; i++) {
			U1[i]=AES_SBOX.lookUp(U1[i]);
		}
		
		U1[0] = U1[0].xor(RC[r-1]);
		W1 = Word.constructFromUByteArr(U1);
		
		return W1;
	}
	
	
	public String encrypt(String plaintext) {
		AesState[] block_plaintext = ConversionUtil.textToAesStateArr(plaintext);
		AesState[] block_ciphertext = new AesState[block_plaintext.length];
		for (int i = 0; i < block_plaintext.length; i++) {
			block_ciphertext[i] = EncryptOneBlock(block_plaintext[i]);
		}
		
		String ciphertext = ConversionUtil.aesStateArrToHexStr(block_ciphertext);
		return ciphertext;
	}
	
	
	private AesState EncryptOneBlock(AesState P) {
		P = P.addRoundKey(SK[0]);
		
		for (int i = 1; i < AES_ROUND; i++) {
			P = P.byteSub(AES_SBOX);
			P = P.shiftRow();
			P = P.mixColumn(AES_MIX_COLUMN_CONSTANT_STATE);
			P = P.addRoundKey(SK[i]);
		}
		
		P = P.byteSub(AES_SBOX);
		P = P.shiftRow();
		P = P.addRoundKey(SK[10]);
		
		return P;
	}
	
	public String decrypt(String ciphertext) {
		//cut text to blocks
		AesState[] block_ciphertext = ConversionUtil.hexStrToAesStateArr(ciphertext);
		AesState[] block_plaintext = new AesState[block_ciphertext.length];
		for (int i = 0; i < block_ciphertext.length; i++) {
			block_plaintext[i] = DecryptOneBlock(block_ciphertext[i]);
		}
		
		String plaintext = ConversionUtil.aesStateArrToText(block_plaintext).trim();
		return plaintext;
	}

	private AesState DecryptOneBlock(AesState C) {
		C = C.addRoundKey(SK[10]);
		C = C.invShiftRow();
		C = C.byteSub(AES_INVERSE_SBOX);
		
		for (int i = 9; i > 0; i--) {
			C = C.addRoundKey(SK[i]);
			C = C.mixColumn(AES_INV_MIX_COLUMN_CONSTANT_STATE );
			C = C.invShiftRow();
			C = C.byteSub(AES_INVERSE_SBOX);
		}
	
		C = C.addRoundKey(SK[0]);
		
		return C;
	}
	
	public void printSubKeysArray() {
		for (int i = 0; i < SK.length; i++) {
			SK[i].printHexStrFormatted();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
