package com.example.demo.config;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Encrypt {
	public static String getSHA512(String value) {
		//암호화 완료된 값 보관할 변수
		String encPwd=null;
		//알고리즘 불러오기 위한 객체
		MessageDigest md = null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		//알고리즘을 이용해서 byte단위로 암호화 처리
		byte[] bytes=value.getBytes(Charset.forName("UTF-8"));
		//MessageDigest 객체에 있는 update 메소드를 활용해서 byte값을 단방향 암호화 처리 함
		md.update(bytes);
		//byte단위로 암호화한 내용을 String 값으로 변환해서 encPwd에 넣어줌.
		encPwd=Base64.getEncoder().encodeToString(md.digest());
		//encPwd 반환
		return encPwd;
	}
}
