package com.example.demo.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.dto.ProductDTO;
import com.example.demo.service.ProductService;
import com.example.demo.dto.UserDTO;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	@Autowired
	ProductService pservice;
	@Autowired
	UserService uservice;
	
	@GetMapping("/itemList")
	public String item() {
		return "itemList";
	}
	@GetMapping("/sign")
	public String sign() {
		return "sign";
	}
	@GetMapping("/about")
	public String about() {
		return "about";
	}
	@GetMapping("/manage")
	public ModelAndView manage(String id, HttpSession session) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		UserDTO userinfo = new UserDTO();
		ModelAndView mv = new ModelAndView();
		
		String whatid = (String)session.getAttribute("sID");
		if(!id.equals(whatid)) {
			mv.setViewName("action/errorPage");
			return mv;
		}
		
		
		list = pservice.boardListUser(id);
		userinfo = uservice.getUserinfo(id);
		
		mv.addObject("list", list);
		mv.addObject("userinfo", userinfo);
		mv.setViewName("manage");
		return mv;
	}
	
	

}
