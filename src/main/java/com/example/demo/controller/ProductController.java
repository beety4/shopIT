package com.example.demo.controller;

import java.util.ArrayList;
import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.UserDTO;
import com.example.demo.service.UserService;
import com.example.demo.service.ProductService;

import jakarta.servlet.http.HttpSession;


@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	@Autowired
	private UserService uservice;
	
	@GetMapping("/")
	public ModelAndView index() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = service.boardList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("index");
		return mv;
	}
	
	@PostMapping("writeBoard")
	public ModelAndView writeBoard(@RequestParam("file") MultipartFile file, String sID, String uID, String title, String content, String category, String price, String saleprice) {
		ProductDTO productDTO = new ProductDTO();
		
		if(!file.isEmpty()) {
			int lastNum = service.lastNum() + 1;
			//int lastNum = 1;
			
			String realPath = "C:/Users/sysop/eclipse-workspace/shopIT/src/main/resources/static/board";
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			String fileExtension = StringUtils.getFilenameExtension(fileName);
			String newFileName = lastNum + "." + fileExtension;
			File newFile = new File(realPath + "/" + newFileName);
			
			try {
				file.transferTo(newFile);
			} catch(Exception e) {
				System.out.println(e);
			}
				
			productDTO.setMainImg("board/" + newFileName);
		} else {
			productDTO.setMainImg("board/mainImg.png");
		}
		

		productDTO.setId(sID);
		productDTO.setName(uID);
		productDTO.setTitle(title);
		productDTO.setContent(content);
		productDTO.setCategory(category);
		
		
		try {
			int num = Integer.parseInt(price);
			productDTO.setPrice(num);
		} catch (NumberFormatException e) {
			productDTO.setPrice(0);
		}
		try {
			int num = Integer.parseInt(saleprice);
			productDTO.setSaleprice(num);
		} catch (NumberFormatException e) {
			productDTO.setSaleprice(0);
		}
		service.writeBoard(productDTO);
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = service.boardList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("readBoard")
	public ModelAndView readBoard(int num) {
		ProductDTO productDTO;
		productDTO = service.readBoard(num);
		service.viewADD(num);
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = service.categoryListRandom(productDTO.getCategory());
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", productDTO);
		mv.addObject("list", list);
		mv.setViewName("itemPage");
		return mv;
	}
	@PostMapping("modifyBoardRead")
	public ModelAndView modifyBoardRead(String id, String num,  HttpSession session) {
		ProductDTO productDTO = new ProductDTO();
		int boardNum;
		try {
			boardNum = Integer.parseInt(num);
		} catch (NumberFormatException e) {
			boardNum = 0;
		}
		
		productDTO = service.readBoard(boardNum);
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		UserDTO userinfo = new UserDTO();
		String whatid = (String)session.getAttribute("sID");
		userinfo = uservice.getUserinfo(whatid);
		list = service.boardListUser(whatid);

		
		ModelAndView mv = new ModelAndView();
		mv.addObject("userinfo", userinfo);
		mv.addObject("list", list);
		mv.addObject("p", productDTO);
		mv.setViewName("modifyBoard");
		return mv; 
	}
	@PostMapping("modifyBoard")
	public ModelAndView modifyBoard(@RequestParam("file") MultipartFile file, String sID, String uID, String num, String title, String content, String category, String price, String saleprice) {
		ProductDTO productDTO = new ProductDTO();
		
		if(!file.isEmpty()) {
			String realPath = "C:/Users/sysop/eclipse-workspace/shopIT/src/main/resources/static/board";
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			String fileExtension = StringUtils.getFilenameExtension(fileName);
			String newFileName = num + "." + fileExtension;
			File newFile = new File(realPath + "/" + newFileName);
			
			try {
				file.transferTo(newFile);
			} catch(Exception e) {
				System.out.println(e);
			}
			productDTO.setMainImg(newFileName);
		} else {
			productDTO.setMainImg("board/mainImg.png");
		}
		
		productDTO.setId(sID);
		productDTO.setName(uID);
		productDTO.setTitle(title);
		productDTO.setContent(content);
		productDTO.setCategory(category);
		
		
		try {
			int numa = Integer.parseInt(num);
			productDTO.setNum(numa);
		} catch (NumberFormatException e) {
			productDTO.setNum(0);
		}
		try {
			int pricea = Integer.parseInt(price);
			productDTO.setPrice(pricea);
		} catch (NumberFormatException e) {
			productDTO.setPrice(0);
		} 
		try {
			int salepricea = Integer.parseInt(saleprice);
			productDTO.setSaleprice(salepricea);
		} catch (NumberFormatException e) {
			productDTO.setSaleprice(0);
		}
		
		service.modifyBoard(productDTO);
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		UserDTO userinfo = new UserDTO();
		list = service.boardListUser(sID);
		userinfo = uservice.getUserinfo(sID);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("userinfo", userinfo);
		mv.setViewName("manage");
		return mv;
	}
	@PostMapping("deleteBoard")
	public ModelAndView deleteBoard(String id, int num) {
		ModelAndView mv = new ModelAndView();
		ProductDTO productDTO = new ProductDTO();
		productDTO = service.readBoard(num);
		
		if(!productDTO.getId().equals(id)) {
			mv.setViewName("action/errorPage");
			return mv;
		}
		
		service.deleteBoard(num);
	
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		ArrayList<ProductDTO> boardListUser = new ArrayList<ProductDTO>();
		UserDTO userinfo = new UserDTO();
		list = service.boardListUser(id);
		userinfo = uservice.getUserinfo(id);
		boardListUser = service.boardListUser(id);
		
		
		mv.addObject("list", list);
		mv.addObject("userinfo", userinfo);
		mv.addObject("boardListUser", boardListUser);
		mv.setViewName("manage");
		return mv;
	}
	@GetMapping("popular")
	public ModelAndView popular() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = service.popularList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("popular");
		return mv;
	}
	@GetMapping("all")
	public ModelAndView all() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = service.allList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("all");
		return mv;
	}
	@GetMapping("category")
	public ModelAndView category(String category) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = service.categoryList(category);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("category", category);
		mv.setViewName("category");
		return mv;
	}
	
	
}
