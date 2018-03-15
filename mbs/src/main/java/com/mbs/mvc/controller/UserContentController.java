package com.mbs.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserContentController {
	
	@RequestMapping(value="/user_content.do", method = RequestMethod.GET)
	public String user_content(Model model) {
		
		return "user_content";
	}
	
	@RequestMapping(value="/user_content_pay.do", method = RequestMethod.GET)
	public String user_content_pay(Model model) {
		
		return "user_content_pay";
	}
}
