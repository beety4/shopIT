package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.UserDTO;
import com.example.demo.service.UserService;
import com.example.demo.service.EmailService;
import com.example.demo.service.ProductService;
import com.example.demo.service.CartService;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	@Autowired
	private EmailService emailservice;
	@Autowired
	private ProductService productservice;
	@Autowired
	private CartService cservice;
	
	@RequestMapping("/dbplz")
	public ModelAndView dbplz() {
		ModelAndView mv = new ModelAndView();
		List<UserDTO> user = service.getAllUserList();
		mv.addObject("data", user.toString());
		mv.setViewName("dbplz");
		return mv;
	}
	@PostMapping("/register")
	public ModelAndView sign(@RequestParam("file") MultipartFile file, UserDTO userDTO) {
		if(!file.isEmpty()) {
			String realPath = "C:/Users/sysop/eclipse-workspace/shopIT/src/main/resources/static/user";
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			String fileExtension = StringUtils.getFilenameExtension(fileName);
			String newFileName = userDTO.getId() + "." + fileExtension;
			File newFile = new File(realPath + "/" + newFileName);
			userDTO.setImg("user/" + newFileName);
			
			try {
				file.transferTo(newFile);
			} catch(Exception e) {
				System.out.println(e);
			}
		} else {
			userDTO.setImg("user/default.png");
		}
			
		// DB 유저 생성
		service.createUser(userDTO);
		
		// 이메일 인증으로 변수전송 및 view 변경
		ModelAndView mv = new ModelAndView();
		mv.addObject("email", userDTO.getEmail());
		mv.setViewName("emailAuth");
		return mv;
	}
	@PostMapping("/login")
	public ModelAndView login(String lid, String lpw) {
		ModelAndView mv = new ModelAndView();
		// 비밀번호 검사
		String result = service.loginUser(lid, lpw);
		// 이메일 인증 여부 확인
		String emailcheck = emailservice.getValidate(lid);
		
		// 성공 시 메인페이지 이동 or Error 페이지
		if(result.equals("1") && emailcheck.equals("1")) {
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			list = productservice.boardList();
			service.lastlogin(lid);
			UserDTO u = new UserDTO();
			u = service.getUserinfo(lid);
			
			int count = cservice.cartCount(lid);
			
			String name = service.getUserName(lid);
			mv.addObject("sID", lid);
			mv.addObject("uID", name);
			mv.addObject("img", u.getImg());
			mv.addObject("count", count);
			mv.addObject("loginResult", "1");
			mv.addObject("list", list);
			mv.setViewName("index");
			return mv;
		} else {
			mv.addObject("loginResult", "0");
			mv.setViewName("sign");
			return mv;
		}
	}
	@PostMapping("/logout")
	public ModelAndView logout() {
		ModelAndView mv = new ModelAndView();
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = productservice.boardList();
		
		mv.addObject("list", list);
		mv.addObject("logout", "1");
		mv.setViewName("index");
		return mv;
	}
	
	@PostMapping("/editUser")
	public ModelAndView editUser(@RequestParam("file") MultipartFile file, UserDTO userDTO) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
		if(!file.isEmpty()) {
			String realPath = "C:/Users/sysop/eclipse-workspace/shopIT/src/main/resources/static/user";
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			String fileExtension = StringUtils.getFilenameExtension(fileName);
			String newFileName = userDTO.getId() + "." + fileExtension;
			File newFile = new File(realPath + "/" + newFileName);
			userDTO.setImg("user/" + newFileName);
			
			try {
				file.transferTo(newFile);
			} catch(Exception e) {
				System.out.println(e);
			}
		} else {
			userDTO.setImg("user/default.png");
		}
		
		list = productservice.boardList();
		service.editUser(userDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("index");
		return mv;
	}
	
	
	
	
}
