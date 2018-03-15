package com.mbs.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value="/index.do", method= RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/map_main.do", method= RequestMethod.GET)
	public String map_main() {
		return "map_main";
	}
	
	@RequestMapping(value="/web_main.do", method= RequestMethod.GET)
	public String web_main() {
		return "web_main";
	}
}
