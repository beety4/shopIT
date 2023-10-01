package com.example.demo.service;

import java.util.Properties;
import com.example.demo.config.Gmailconn;
import com.example.demo.dao.EmailMapper;
import com.example.demo.dto.EmailDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.Session;
import jakarta.mail.Address;
import jakarta.mail.Transport;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.InternetAddress;


@Service
public class EmailService {
	
	
	@Autowired
	EmailMapper mapper;
	
	public void sendtoMail(EmailDTO emailDTO) {
		String to = emailDTO.getEmail();
		String authKey = emailDTO.getAuthKey();
		
		String from = "202244016@itc.ac.kr";
		String subject = "[shopIT] 이메일 인증을 완료해주세요!";
		String content="";
		content+= "<div style='margin:20px;'>";
	    content+= "<h1> ShopIT 이메일 인증</h1>";
	    content+= "<br>";
	    content+= "<p>아래 코드를 복사해 입력해주세요<p>";
	    content+= "<br>";
	    content+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
	    content+= "<h3 style='color:blue;'>회원가입 인증 코드입니다.</h3>";
	    content+= "<div style='font-size:130%'>";
	    content+= "CODE : <strong>";
	    content+= authKey +"</strong><div><br/> ";
	    content+= "</div>";
	    
	    Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com"); // google SMTP 주소
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 코드
		p.put("mail.smtp.ssl.enable", "true");  // 추가된 코드
	        
		try{
			Authenticator auth = new Gmailconn();
		    Session ses = Session.getInstance(p, auth);
		    ses.setDebug(true);
		    MimeMessage msg = new MimeMessage(ses); 
		    msg.setSubject(subject);		// 메일 제목
		    Address fromAddr = new InternetAddress(from); 	// 보내는 사람 정보
		    msg.setFrom(fromAddr);
		    Address toAddr = new InternetAddress(to);		// 받는 사람 정보
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		    msg.setContent(content, "text/html;charset=UTF-8");
		    Transport.send(msg); // 메세지 전송
		    
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	

	
	// 키 생성 후 DB삽입
	public void inputKey(EmailDTO emailDTO) {
		mapper.inputKey(emailDTO);
	}
	
	// 유효성 check -> 1
	public void setValidate(String email) {
		mapper.setValidate(email);
	}
	
	// 유효성 get
	public String getValidate(String id) {
		String validate = mapper.getValidate(id);
		return validate;
	}
	
			
	
	
	
	
	
	
	
	
	
}
