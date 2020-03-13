package edu.sjsu.crypto.ciphersys.block;

import edu.sjsu.yazdankhah.crypto.util.abstracts.TeaAbs;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.ConversionUtil;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.DWord;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.Word;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.StringUtil;

public class TeaSys extends TeaAbs {
	protected Word[] SK;
	
	public TeaSys(String pass) {
		//generate key
		pass = StringUtil.rightTruncRightPadWithZeros(pass, 16);
		SK = ConversionUtil.binStrToWordArr(ConversionUtil.textToBinStr(pass));
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
		Word DELTA = DELTA_WORD ;
		Word sum = Word.constructFromLong(0);
		
		for(int i=0; i<ROUNDS; i++) {
			sum = sum.addMod2p32(DELTA);
			
			//L = L + ((R≪4 + SK[0]) ⊕(R+sum) ⊕(R≫5 + SK[1]))
			L = L.addMod2p32( (R.shiftLeft(4).addMod2p32(SK[0])).xor(R.addMod2p32(sum)).xor(R.shiftRight(5).addMod2p32(SK[1])) );
			
			//R = R + ((L≪4 + SK[2]) ⊕(L+sum) ⊕(L≫5 + SK[3]))
			R = R.addMod2p32( (L.shiftLeft(4).addMod2p32(SK[2])).xor(L.addMod2p32(sum)).xor(L.shiftRight(5).addMod2p32(SK[3])) );
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
		Word DELTA = DELTA_WORD ;
		Word sum = DELTA.shiftLeft(5);
		
		for(int i=0; i<ROUNDS; i++) {
			//R = R -((L≪4 + SK[2]) ⊕(L+sum) ⊕(L≫5 + SK[3]))
			R = R.subtractMod2p32( (R.shiftLeft(4).addMod2p32(SK[2])).xor(L.addMod2p32(sum)).xor(L.shiftRight(5).addMod2p32(SK[3])) );
			
			//L = L -((R≪4 + SK[0]) ⊕(R+sum) ⊕(R≫5 + SK[1]))
			L = L.subtractMod2p32( (R.shiftLeft(4).addMod2p32(SK[0])).xor(R.addMod2p32(sum)).xor(L.shiftRight(5).addMod2p32(SK[1])) );
		
			sum = sum.subtractMod2p32(DELTA);
		}
		
		return DWord.constructFrom2Words(L, R);
	}
	
	public void printSubKeysArray() {
		for (int i = 0; i < SK.length; i++) {
			SK[i].printHexStr();
		}
	}
	
}


































