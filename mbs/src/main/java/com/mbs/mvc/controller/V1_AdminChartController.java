package com.mbs.mvc.controller;

import java.util.Calendar;

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
		 Calendar oCalendar = Calendar.getInstance( );
		 System.out.println("현재 년: " +  oCalendar.get(Calendar.YEAR));
		 System.out.println("현재 월: " + (oCalendar.get(Calendar.MONTH) + 1));
		 System.out.println("현재 일: " +  oCalendar.get(Calendar.DAY_OF_MONTH));
		return "v1_admin_memberchart";
	}
}
