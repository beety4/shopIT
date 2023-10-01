package com.example.demo.config;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;

public class Gmailconn extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("202244016@itc.ac.kr", "brjxolcmdymtukdu");
	}
}
