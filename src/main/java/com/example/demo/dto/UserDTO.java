package com.example.demo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {
	private String id;
	private String pw;
	private String name; 
	private String address;
	private String phone;
	private String gender;
	private String email;
	private String emailhash;
	private int emailcheck;
	private String joindate;
	private String lastlogin;
	private String img;
	
	@Override
	public String toString() {
		return "Data : " + id + pw + name + address + phone + gender + email + email + emailhash + emailcheck + joindate + lastlogin + img + "]\n";
	}
	
}
