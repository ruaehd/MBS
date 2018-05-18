package com.mbs.mvc.conf;

public class V1_RandomNumber {
	public static String RandomNum() {
		// TODO Auto-generated method stub
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i <=6; i++) {
			int n = (int) (Math.random() * 10 );
			buffer.append(n);
		}
		return buffer.toString();
	}
}
