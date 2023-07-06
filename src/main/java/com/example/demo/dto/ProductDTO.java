package com.example.demo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDTO {
	private int num;
	private String id;
	private String name;
	private String title;
	private String date;
	private String category;
	private int price;
	private int saleprice;
	private float rate;
	private String content;
	private String mainImg;
	private String contentImg;
	private int available;
		
	@Override
	public String toString() {
		return "Data : " + num + id + name + title + date + category + price +
				saleprice + rate + content + mainImg + contentImg + available + "]\n";
	}
}
