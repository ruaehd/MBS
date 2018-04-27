package com.mbs.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbs.mvc.dao.V1_AdminChartDAO;

@Controller
public class V1_AdminChartController {
	
	@Autowired
	private V1_AdminChartDAO acDAO = null;
	
	@RequestMapping(value="admin_memberchart.do",method=RequestMethod.GET)
	public String adminmemberchart() {
		
		return "v1_admin_memberchart";
	}
}
