package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbs.mvc.dao.Admin_EventDAO;
import com.mbs.mvc.vo.EventVO;

@Controller
public class Admin_EventController {
	@Autowired
	private Admin_EventDAO aeDAO = null;
	
	@RequestMapping(value="/admin_event.do", method= RequestMethod.GET)
	public String adminEvent(Model model) {
		List<EventVO> list = aeDAO.Admin_EventImgList();
		model.addAttribute("list", list);
		return "admin_event";
	}
	
	
}
