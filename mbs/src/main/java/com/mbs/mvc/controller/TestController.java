package com.mbs.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbs.mvc.dao.TestDAO;
import com.mbs.mvc.vo.TestVO;



@Controller
public class TestController {
	
	@Autowired private TestDAO tDAO = null;
	
	@RequestMapping(value="/test.do", method = RequestMethod.GET)
	public String test(Model model) {
		TestVO vo = new TestVO();
		
		model.addAttribute("vo", vo);
		return "test";
	}
	
	@RequestMapping(value="/test.do", method = RequestMethod.POST)
	public String test(@ModelAttribute("vo") TestVO vo) {
		
		tDAO.insertTest(vo);
		
		return "redirect:test.do";
		
		
	}
}
