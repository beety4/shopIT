package com.example.demo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dao.ProductMapper;
import com.example.demo.dto.ProductDTO;

@Service
public class ProductService {
	@Autowired
	ProductMapper mapper;
	
	public ArrayList<ProductDTO> boardList() {
		return mapper.boardList();
	}
	
	public ArrayList<ProductDTO> boardListUser(String id) {
		return mapper.boardListUser(id);
	}
	
	public void writeBoard(ProductDTO productDTO) {
		mapper.writeBoard(productDTO);
	}
	
	public ProductDTO readBoard(int num) {
		return mapper.readBoard(num);
	}
	
	public void modifyBoard(ProductDTO productDTO) {
		mapper.modifyBoard(productDTO);
	}
	
	public void deleteBoard(int num) {
		mapper.deleteBoard(num);
	}
	
	public ArrayList<ProductDTO> popularList() {
		return mapper.popularList();
	}
	
	public void viewADD(int num) {
		mapper.viewADD(num);
	}
	
	public ArrayList<ProductDTO> allList() {
		return mapper.allList();
	}
	
	public ArrayList<ProductDTO> categoryList(String category) {
		return mapper.categoryList(category);
	}
	
	public ArrayList<ProductDTO> categoryListRandom(String category) {
		return mapper.categoryListRandom(category);
	}
	
	public int lastNum() {
		return mapper.lastNum();
	}
	
}
