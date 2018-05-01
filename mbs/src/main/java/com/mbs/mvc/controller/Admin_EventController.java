package com.mbs.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Admin_EventController {
	@RequestMapping(value="/admin_event.do", method= RequestMethod.GET)
	public String adminEvent() {
	
		
		return "admin_event";
	}
	
	
}
