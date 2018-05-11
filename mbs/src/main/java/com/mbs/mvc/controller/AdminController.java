package com.mbs.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
	@RequestMapping(value="/admin.do", method= RequestMethod.GET)
	public String admin() {
	
		
		return "admin";
	}
	
	
}
