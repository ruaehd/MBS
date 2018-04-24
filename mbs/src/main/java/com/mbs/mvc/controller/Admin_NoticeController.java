package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.Admin_NoticeDAO;
import com.mbs.mvc.vo.NoticeVO;

@Controller
public class Admin_NoticeController {
	
	@Autowired
	private Admin_NoticeDAO anDAO = null;
	
	@RequestMapping(value="/admin_notice.do", method= RequestMethod.GET)
	public String notice(Model model, @RequestParam(value="page", defaultValue="1") int page1, 
			@RequestParam(value = "type", defaultValue="ntc_title") String type, @RequestParam(value = "text", defaultValue="") String text) {
		int page = (page1-1)*10;
		NoticeVO vo = new NoticeVO();
		vo.setNtc_sc_type(type);
		vo.setNtc_sc_text(text);
		vo.setNtc_page(page);
		
		List<NoticeVO> list = anDAO.NoticeList(vo);
		model.addAttribute("list", list);
		int totPage = anDAO.NoticePage();
		model.addAttribute("totPage", (totPage-1)/10+1);
		return "admin_notice";
	}


	
}