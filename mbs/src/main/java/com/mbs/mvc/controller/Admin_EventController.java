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
import com.mbs.mvc.dao.EventDAO;
import com.mbs.mvc.vo.EventVO;

@Controller
public class Admin_EventController {
	@Autowired
	private Admin_EventDAO aeDAO = null;
	
	@Autowired
	private EventDAO eDAO = null;
	
	@RequestMapping(value="/event_update.do", method= RequestMethod.POST)
	public String event_update(@ModelAttribute("vo") EventVO vo, MultipartHttpServletRequest request, 
			@RequestParam(value = "type") String type, @RequestParam(value = "text") String text, 
			@RequestParam(value = "sel_type") String sel_type, @RequestParam(value = "begin") String begin, 
			@RequestParam(value = "end") String end, @RequestParam(value = "page") int page) {
		try {
			MultipartFile tmp = request.getFile("evt_image1");
			MultipartFile tmp1 = request.getFile("evt_content1");
			if(tmp != null && !tmp.getOriginalFilename().equals("")) {
				vo.setEvt_image(tmp.getBytes());
			}
			if(tmp1 != null && !tmp1.getOriginalFilename().equals("")) {
				vo.setEvt_content(tmp1.getBytes());
			}
			System.out.println(vo.getEvt_image());
			aeDAO.Update_Event(vo);
		
			return "redirect:admin_event.do?type="+type+"&text="+text+"&sel_type="+sel_type+"&begin="+begin+"&end="+end+"&page="+page;
		
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
	public String adminEvent(Model model, @RequestParam(value = "sel_type", defaultValue="all") String sel_type, 
			@RequestParam(value = "begin", defaultValue="null") String begin, @RequestParam(value = "end", defaultValue="") String end, 
			@RequestParam(value = "type", defaultValue="all") String type, @RequestParam(value = "text", defaultValue="") String text, 
			@RequestParam(value = "page", defaultValue="-1") int page1) {
		
		if(page1 == -1) {
			return "redirect:admin_event.do?type=all&text=&sel_type=all&begin=null&end=&page=1";
		}
		eDAO.eventAutoDelete();
		EventVO vo = new EventVO();
		int page = (page1-1)*10;
		vo.setEvt_page(page);
		vo.setEvt_sc_text(text);	
		vo.setEvt_sc_type(type);
		vo.setEvt_begintime(begin);
		vo.setEvt_endtime(end);
		vo.setSel_type(sel_type);
		System.out.println(vo.toString());
		List<EventVO> list = aeDAO.Admin_EventImgList(vo);
		int totPage = aeDAO.EventPage(vo);
		model.addAttribute("totPage", (totPage-1)/10+1);
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
