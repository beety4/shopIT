package com.example.demo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartDTO {
	private String id;
	private int num;
	private int count;
	private String title;
	private int price;
	private int saleprice;
	private String mainImg;
	
	@Override
	public String toString() {
		return "Data : " + id + num + count + title + price + saleprice + mainImg + "]\n";
	}
}
