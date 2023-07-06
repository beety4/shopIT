package com.example.demo.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.service.CartService;
import jakarta.servlet.http.HttpSession;
import com.example.demo.dto.CartDTO;
import com.example.demo.dto.ProductDTO;
import com.example.demo.service.ProductService;


@Controller
public class CartController {
	@Autowired
	CartService service;
	@Autowired
	ProductService pservice;
	
	@GetMapping("cart")
	public ModelAndView cart(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String id = "x";
		
		try {
			id = (String)session.getAttribute("sID");
		} catch (Exception e) {
			mv.setViewName("action/errorPage");
			return mv;
		}
		
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
		list = service.cartListShow(id);
		
		mv.addObject("list", list);
		mv.setViewName("cart");
		return mv;
	}
	@PostMapping("cartDelete")
	public ModelAndView cartDelete(HttpSession session, int num) {
		ModelAndView mv = new ModelAndView();
		CartDTO cartDTO = new CartDTO();
		String id = (String)session.getAttribute("sID");
		
		cartDTO.setId(id);
		cartDTO.setNum(num);
		service.cartDelete(cartDTO);
		
		int manyCount = service.cartCount(id);
		
		ArrayList<CartDTO> list = new ArrayList<CartDTO>();
		list = service.cartListShow(id);
		
		mv.addObject("list", list);
		mv.addObject("count", manyCount);
		mv.setViewName("cart");
		return mv;
	}
	@PostMapping("cartADD")
	public ModelAndView cartADD(HttpSession session, int num, int count) {
		ProductDTO productDTO = new ProductDTO();
		productDTO = pservice.readBoard(num);
		
		CartDTO cartDTO = new CartDTO();
		cartDTO.setId((String)session.getAttribute("sID"));
		cartDTO.setNum(num);
		cartDTO.setCount(count);
		cartDTO.setTitle(productDTO.getTitle());
		cartDTO.setPrice(productDTO.getPrice());
		cartDTO.setSaleprice(productDTO.getSaleprice());
		cartDTO.setMainImg(productDTO.getMainImg());
		service.cartADD(cartDTO);
		
		int manyCount = service.cartCount((String)session.getAttribute("sID"));
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = pservice.categoryListRandom(productDTO.getCategory());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("count", manyCount);
		mv.addObject("data", productDTO);
		mv.addObject("list", list);
		mv.setViewName("itemPage");
		return mv;
	}
	
	
}
