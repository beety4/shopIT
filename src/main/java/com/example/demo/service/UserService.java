package com.example.demo.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dao.UserMapper;
import com.example.demo.dto.UserDTO;
import com.example.demo.config.Encrypt;

@Service
public class UserService {
	@Autowired
	UserMapper mapper;
	
	public List<UserDTO> getAllUserList() {
		return mapper.getAllUserList();
	}
	
	public void createUser(UserDTO userDTO) {
		userDTO.setPw(Encrypt.getSHA512(userDTO.getPw()));
		mapper.createUser(userDTO);
	}
	
	public String loginUser(String lid, String lpw) {
		String digest = Encrypt.getSHA512(lpw);
		String db = mapper.loginUser(lid);
		return (digest.equals(db)) ? "1" : "0";
	}
	
	public String getUserName(String lid) {
		String name = mapper.getUserName(lid);
		return name;
	}
	
	public void lastlogin(String id) {
		mapper.lastlogin(id);
	}
	
	public UserDTO getUserinfo(String id) {
		return mapper.getUserinfo(id);
	}
	
	public void editUser(UserDTO userDTO) {
		String repw = Encrypt.getSHA512(userDTO.getPw());
		userDTO.setPw(repw);
		mapper.editUser(userDTO);
	}
	
	
}
