package com.example.demo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmailDTO {
	private String authKey;
	private String email;
	
	@Override
	public String toString() {
		return "Data : " + authKey + email + "]\n";
	}
}
