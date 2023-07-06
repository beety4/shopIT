package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.example.demo.dto.EmailDTO;

@Repository
@Mapper
public interface EmailMapper {
	public void inputKey(EmailDTO emailDTO);
	public void setValidate(String email);
	public String getValidate(String id);
	
}
