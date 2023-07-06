package com.example.demo.dao;

import java.util.List;
import com.example.demo.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserMapper {
	public List<UserDTO> getAllUserList();
	public void createUser(UserDTO userDTO);
	public String loginUser(String lid);
	public String getUserName(String lid);
	public void lastlogin(String id);
	
	public UserDTO getUserinfo(String id);
	public void editUser(UserDTO userDTO);
	
	
}
