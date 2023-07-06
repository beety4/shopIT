package com.example.demo.dao;

import java.util.ArrayList;
import com.example.demo.dto.CartDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CartMapper {
	public void cartADD(CartDTO cartDTO);
	public int cartCount(String id);
	public ArrayList<CartDTO> cartListShow(String id);
	public void cartDelete(CartDTO cartDTO);
	
}
