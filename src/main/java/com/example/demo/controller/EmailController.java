package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.service.EmailService;
import com.example.demo.dto.EmailDTO;
import com.example.demo.config.CreateKey;

@Controller
public class EmailController {
	@Autowired
	private EmailService service;
	
	@PostMapping("/emailAuth")
	public ModelAndView emailAuth(EmailDTO emailDTO) {
		String authKey = CreateKey.newKey();
		emailDTO.setAuthKey(authKey);

		service.sendtoMail(emailDTO);
		service.inputKey(emailDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("email", emailDTO.getEmail());
		mv.addObject("authKey", authKey);
		mv.addObject("info", "1");
		mv.setViewName("emailAuth");
		return mv;
	}
	
	@PostMapping("/emailCheck")
	public String emailCheck(String email) {
		service.setValidate(email);
		return "action/signEnd";
	}

	
}
