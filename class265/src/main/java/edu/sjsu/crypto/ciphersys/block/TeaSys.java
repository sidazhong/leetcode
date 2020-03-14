package edu.sjsu.crypto.ciphersys.block;

import edu.sjsu.yazdankhah.crypto.util.abstracts.TeaAbs;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.ConversionUtil;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.DWord;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.Word;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.StringUtil;
/**
 * TeaSys cipher system
 * @author sida
   Customer: Yan Chen
 */
public class TeaSys extends TeaAbs {
	protected Word[] SK;
	
	public TeaSys(String pass) {
		//generate key
		pass = StringUtil.rightTruncRightPadWithZeros(ConversionUtil.textToBinStr(pass), KEY_SIZE_BITS );
		SK = ConversionUtil.binStrToWordArr(pass);
		//printSubKeysArray();
	}
	
	public String encrypt(String plaintext) {
		//cut text to blocks
		DWord[] block_plaintext = ConversionUtil.textToDWordArr(plaintext);
		DWord[] block_ciphertext = new DWord[block_plaintext.length];
		
		for (int i = 0; i < block_plaintext.length; i++) {
			block_ciphertext[i] = EncryptOneBlock(block_plaintext[i]);
		}
		
		String ciphertext = ConversionUtil.dwordArrToHexStr(block_ciphertext);
		return ciphertext;
	}
	
	public DWord EncryptOneBlock(DWord P) {
		Word L = P.leftWord();
		Word R = P.rightWord();
		Word sum = Word.ZERO();
		
		for(int i=0; i<ROUNDS; i++) {
			sum.addMod2p32M(DELTA_WORD);
			
			//(R≪4 + SK[0])
			Word L1 = R.shiftLeft(4).addMod2p32(SK[0]);
			//(R+sum)
			Word L2 = R.addMod2p32(sum);
			//(R≫5 + SK[1])
			Word L3 = R.shiftRight(5).addMod2p32(SK[1]);
			//L = L + ((R≪4 + SK[0]) ⊕(R+sum) ⊕(R≫5 + SK[1]))
			Word L4 = L1.xor(L2.xor(L3));
			L.addMod2p32M(L4);
			
			//(L≪4 + SK[2])
			Word R1 = L.shiftLeft(4).addMod2p32(SK[2]);
			//(L+sum)
			Word R2 = L.addMod2p32(sum);
			//(L≫5 + SK[3])
			Word R3 = L.shiftRight(5).addMod2p32(SK[3]);
			//R = R + ((L≪4 + SK[2]) ⊕(L+sum) ⊕(L≫5 + SK[3]))
			Word R4 = R1.xor(R2.xor(R3));
			R.addMod2p32M(R4);
		}
		
		return DWord.constructFrom2Words(L, R);
	}
	
	public String decrypt(String ciphertext) {
		//cut text to blocks
		DWord[] block_ciphertext = ConversionUtil.hexStrToDWordArr(ciphertext);
		DWord[] block_plaintext = new DWord[block_ciphertext.length];
		
		for (int i = 0; i < block_ciphertext.length; i++) {
			block_plaintext[i] = DecryptOneBlock(block_ciphertext[i]);
		}
		
		String plaintext = ConversionUtil.dwordArrToText(block_plaintext).trim();
		return plaintext;
	}

	public DWord DecryptOneBlock(DWord P) {
		Word L = P.leftWord();
		Word R = P.rightWord();
		Word sum = DELTA_WORD.shiftLeft(5);
		
		for(int i=0; i<ROUNDS; i++) {
			//(L≪4 + SK[2])
			Word R1 = L.shiftLeft(4).addMod2p32(SK[2]);
			//(L+sum)
			Word R2 = L.addMod2p32(sum);
			//(L≫5 + SK[3])
			Word R3 = L.shiftRight(5).addMod2p32(SK[3]);
			//R = R -((L≪4 + SK[2]) ⊕(L+sum) ⊕(L≫5 + SK[3]))
			Word R4 = R1.xor(R2).xor(R3);
			R.subtractMod2p32M(R4);
			
			//(R≪4 + SK[0])
			Word L1 = R.shiftLeft(4).addMod2p32(SK[0]);
			//(R+sum)
			Word L2 = R.addMod2p32(sum);
			//(R≫5 + SK[1])
			Word L3 = R.shiftRight(5).addMod2p32(SK[1]);
			//L = L -((R≪4 + SK[0]) ⊕(R+sum) ⊕(R≫5 + SK[1]))
			Word L4 = L1.xor(L2).xor(L3);
			L.subtractMod2p32M(L4);
		
			sum.subtractMod2p32M(DELTA_WORD);
		}
		
		return DWord.constructFrom2Words(L, R);
	}
	
	public void printSubKeysArray() {
		for (int i = 0; i < SK.length; i++) {
			SK[i].printHexStr();
		}
	}
	
}


































