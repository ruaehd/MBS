package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.Admin_NoticeDAO;
import com.mbs.mvc.vo.NoticeVO;

@Controller
public class Admin_NoticeController {
	
	@Autowired
	private Admin_NoticeDAO anDAO = null;
	
	@RequestMapping(value="/notice_delete.do", method= RequestMethod.GET)
	public String notice_delete(@ModelAttribute("ntc_no")int ntc_no, @ModelAttribute("ntc_delete")int ntc_delete) {
		NoticeVO vo = new NoticeVO();
		vo.setNtc_no(ntc_no);
		if (ntc_delete == 0) {
			vo.setNtc_delete(1);
		}
		else if (ntc_delete == 1) {
			vo.setNtc_delete(0);
		}
		anDAO.NoticeDelete(vo);
		return "redirect:admin_notice.do";
	}
	
	@RequestMapping(value="/admin_notice.do", method= RequestMethod.GET)
	public String notice(Model model, @RequestParam(value="page", defaultValue="1") int page1, 
			@RequestParam(value = "type", defaultValue="all") String type, @RequestParam(value = "text", defaultValue="") String text, 
			@RequestParam(value = "sel_type", defaultValue="all") String sel_type) {
		int page = (page1-1)*10;
		NoticeVO vo = new NoticeVO();
		vo.setNtc_sc_type(type);
		vo.setNtc_sc_text(text);
		vo.setNtc_page(page);
		vo.setSel_type(sel_type);
		
		List<NoticeVO> list = anDAO.NoticeList(vo);
		
		for(NoticeVO tmp:list) {
			tmp.setNtc_content(   nl2br(tmp.getNtc_content())  );
		}
		
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		int totPage = anDAO.NoticePage(vo);
		model.addAttribute("totPage", (totPage-1)/10+1);
		return "admin_notice";
	}
	
	@RequestMapping(value="/admin_notice.do", method= RequestMethod.POST)
	public String notice(@ModelAttribute("vo") NoticeVO vo) {
		
		vo.setMb_id("admin");
		anDAO.NoticeInsert(vo);
		return "redirect:admin_notice.do";
	}
	
	@RequestMapping(value="/notice_update.do", method= RequestMethod.POST)
	public String updateNotice(@ModelAttribute("vo") NoticeVO vo) {
		anDAO.NoticeUpdate(vo);
		return "redirect:admin_notice.do";
	}


	private String nl2br(String str) {
		  str = str.replaceAll("\r\n", "<br>");
		  str = str.replaceAll("\r", "<br>");
		  str = str.replaceAll("\n", "<br>");
		  
		  return str;
	}


}