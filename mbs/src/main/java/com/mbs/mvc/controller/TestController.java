package com.mbs.mvc.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class TestController {
	
	@RequestMapping(value="/test.do", method = RequestMethod.GET)
	public String test(Model model) {
		return "test";
	}
	
	@RequestMapping(value="/test.do", method = RequestMethod.POST)
	public String test(@RequestParam("aaa[]") MultipartHttpServletRequest request) {

		Map<String, MultipartFile> map = request.getFileMap();
		System.out.println(map.size());
		
		return "redirect:test.do";
	}
}
