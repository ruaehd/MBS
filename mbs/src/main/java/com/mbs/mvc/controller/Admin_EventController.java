package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbs.mvc.dao.Admin_EventDAO;
import com.mbs.mvc.vo.EventVO;

@Controller
public class Admin_EventController {
	@Autowired
	private Admin_EventDAO aeDAO = null;
	
	@RequestMapping(value="/event_update.do", method= RequestMethod.POST)
	public String event_update(@ModelAttribute("vo") EventVO vo, MultipartHttpServletRequest request) {
		try {
			MultipartFile tmp = request.getFile("evt_image1");
			MultipartFile tmp1 = request.getFile("evt_content1");
			vo.setEvt_image(tmp.getBytes());
			vo.setEvt_content(tmp1.getBytes());
			aeDAO.Update_Event(vo);
		
			return "redirect:admin_event.do";
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:qna.do";
		}
			
		
	}
	
	@RequestMapping(value="/event_delete.do", method= RequestMethod.GET)
	public String notice_delete(@ModelAttribute("evt_no")int evt_no, @ModelAttribute("evt_delete")int evt_delete) {
		EventVO vo = new EventVO();
		vo.setEvt_no(evt_no);
		if (evt_delete == 0) {
			vo.setEvt_delete(2);
		}
		else if (evt_delete != 0) {
			vo.setEvt_delete(0);
		}
		aeDAO.EventDelete(vo);
		return "redirect:admin_event.do";
	}
	
	@RequestMapping(value="/admin_event.do", method= RequestMethod.GET)
	public String adminEvent(Model model, @RequestParam(value = "sel_type", defaultValue="all") String sel_type) {

		EventVO vo = new EventVO();
		vo.setSel_type(sel_type);
		List<EventVO> list = aeDAO.Admin_EventImgList(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return "admin_event";
	}
	
	@RequestMapping(value="/admin_event.do", method= RequestMethod.POST)
	public String adminEvent(@ModelAttribute("vo") EventVO vo, MultipartHttpServletRequest request) {
		try {
			MultipartFile tmp = request.getFile("evt_image1");
			MultipartFile tmp1 = request.getFile("evt_content1");
			vo.setEvt_image(tmp.getBytes());
			vo.setEvt_content(tmp1.getBytes());
			vo.setMb_id("admin");
			vo.setEvt_delete(2);
			System.out.println(vo.getEvt_delete());
			aeDAO.insertEvent(vo);
			return "redirect:admin_event.do";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:qna.do";
		}
		
	}
}
