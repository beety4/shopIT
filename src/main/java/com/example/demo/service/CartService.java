package com.example.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dao.CartMapper;
import com.example.demo.dto.CartDTO;

@Service
public class CartService {
	@Autowired
	CartMapper mapper;
	
	public void cartADD(CartDTO cartDTO) {
		mapper.cartADD(cartDTO);
	}
	public int cartCount(String id) {
		return mapper.cartCount(id);
	}
	public ArrayList<CartDTO> cartListShow(String id) {
		return mapper.cartListShow(id);
	}
	public void cartDelete(CartDTO cartDTO) {
		mapper.cartDelete(cartDTO);
	}
	
}
