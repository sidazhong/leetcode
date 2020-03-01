package edu.sjsu.crypto.ciphersys.classic;

import edu.sjsu.yazdankhah.crypto.util.abstracts.A5_1Abs;
import edu.sjsu.yazdankhah.crypto.util.abstracts.PkzipAbs;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.ConversionUtil;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.Bit;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.UByte;
import edu.sjsu.yazdankhah.crypto.util.primitivedatatypes.Word;
import edu.sjsu.yazdankhah.crypto.util.shiftregisters.LFSR;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.Function;
import edu.sjsu.yazdankhah.crypto.util.cipherutils.StringUtil;

public class Test extends PkzipAbs {

	public static void main(String[] args) {
		String bin_pass = ConversionUtil.textToBinStr("test123456");
		
		Word test = Word.constructFromBinStr(bin_pass.substring(0,32));
		test = test.addMod2p32(Word.constructFromUByte((test.byteAt(3)))).multiplyMod2p32(UPDATE_CONST_WORD).addMod2p32(Word.ONE_WORD);   
		test.printBinStr(); // 01110100111111101110001110001001
		
		
		Word test1 = Word.constructFromBinStr(bin_pass.substring(0,32));
		test1.addMod2p32M(Word.constructFromUByte((test1.byteAt(3)))).multiplyMod2p32M(UPDATE_CONST_WORD).addMod2p32M(Word.ONE_WORD);   
		test1.printBinStr(); // 01110100111111101110001110001001
	}

	@Override
	public void CRC(Word arg0, UByte arg1) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String decrypt(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String encrypt(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UByte generateKey(Word arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Word arg0, Word arg1, Word arg2, UByte arg3) {
		// TODO Auto-generated method stub
		
	}

}
