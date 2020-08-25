package edu.sjsu.crypto.ciphersys.hash;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class Md4SysTest {

	@Test
	void test() {
		Md4Sys sys = new Md4Sys();
		String message = "abcdefghijklmnopqrstuvwxyz";
		System.out.println("MD4 = [" + sys.MD4(message) + "]");
	}

}
