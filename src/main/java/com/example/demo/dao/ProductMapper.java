package com.example.demo.dao;

import java.util.ArrayList;
import com.example.demo.dto.ProductDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProductMapper {
	public ArrayList<ProductDTO> boardList();
	public ArrayList<ProductDTO> boardListUser(String id);
	public void writeBoard(ProductDTO productDTO);
	public ProductDTO readBoard(int num);
	public void modifyBoard(ProductDTO productDTO);
	public void deleteBoard(int num);
	
	public ArrayList<ProductDTO> popularList();
	public void viewADD(int num);
	public ArrayList<ProductDTO> allList();
	public ArrayList<ProductDTO> categoryList(String category);
	public ArrayList<ProductDTO> categoryListRandom(String category);
	public int lastNum();
	
}
