package edu.sjsu.crypto.ciphersys.hash;

import edu.sjsu.yazdankhah.crypto.util.abstracts.Md4Abs;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.ConversionUtil;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.GeneralUtil;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.Word;

/**
 * @author Sida Zhong
 */
public class Md4Sys extends Md4Abs {

	public String MD4(String message) {
		//Step1
		String origin_Mb = ConversionUtil.textToBinStr(message);
		String Mb = md4Padding(origin_Mb);
		
		//Step2
		String L = md4SizeToBinStrLittleEndian(origin_Mb.length());
		
		//Step3
		Word[] msgArr = ConversionUtil.binStrToWordArrLittleEndian(Mb);
		Word[] sizeArr = ConversionUtil.binStrToWordArr(L);
		
		Word[] M = GeneralUtil.appendWordArrs(msgArr, sizeArr);
		
		//Step4
		Word[][] X = ConversionUtil.wordArrToWordMatrix(M, MD4_BLOCK_SIZE_WORDS);
		
		//Step5
		Word A = A_INIT;
		Word B = B_INIT;
		Word C = C_INIT;
		Word D = D_INIT;
		
		//Step6
		for (int i = 0; i < X.length; i++) {
			HashOneBlock(A, B, C, D, X[i]);
		}
		
		//Step7
		String A_rs = A.toLittleEndianFormat().toHexStr();
		String B_rs = B.toLittleEndianFormat().toHexStr();
		String C_rs = C.toLittleEndianFormat().toHexStr();
		String D_rs = D.toLittleEndianFormat().toHexStr();
		String rs = A_rs + B_rs + C_rs + D_rs;
		
		return rs;
	}
	
	public void HashOneBlock(Word A, Word B, Word C, Word D, Word[] X) {
		Word AA = A.clone();
		Word BB = B.clone();
		Word CC = C.clone();
		Word DD = D.clone();
		
		for (int r = 0; r < 3; r++) {
			Round(r, A, B, C, D, X);
		}
		
		A.addMod2p32M(AA);
		B.addMod2p32M(BB);
		C.addMod2p32M(CC);
		D.addMod2p32M(DD);
	}
	
	public void Round(int r, Word Ai, Word Bi, Word Ci, Word Di, Word[] X) {
		for (int j = 0; j < X.length; j++) {
			Word Ai_1 = Ai.clone();
			Word Bi_1 = Bi.clone();
			Word Ci_1 = Ci.clone();
			Word Di_1 = Di.clone();
			
			Ai.setM(Di_1);
			Ci.setM(Bi_1);
			Di.setM(Ci_1);
			
			Word Bi_tmp1 = Ai_1.addMod2p32(func(r, Bi_1, Ci_1, Di_1));
			Word Bi_tmp2 = Bi_tmp1.addMod2p32(X[PERMUTATION[r][j]]);
			Word Bi_tmp3 = Bi_tmp2.addMod2p32(K[r]);
			Bi.setM(Bi_tmp3.rotateLeft(ROTATE[r][j]));
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}














































