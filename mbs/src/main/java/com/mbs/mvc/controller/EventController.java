package com.mbs.mvc.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.EventDAO;
import com.mbs.mvc.vo.EventVO;

@Controller
public class EventController {
	
	@Autowired
	private EventDAO eDAO = null;

	@RequestMapping(value="/event_content.do", method= RequestMethod.GET)
	public String event_content() {
		return "user_custcenter_event_content";
	}
	
	@RequestMapping(value="/event.do", method= RequestMethod.GET)
	public String event(Model model) {
		eDAO.eventAutoDelete();
		List<EventVO> list_begin = eDAO.selectEventImgBegin();
		List<EventVO> list_end = eDAO.selectEventImgEnd();
		
		model.addAttribute("eventend", list_end.size());
		model.addAttribute("eventbegin", list_begin.size());
		model.addAttribute("list_begin", list_begin);
		model.addAttribute("list_end", list_end);
		return "user_custcenter_event";
	}
	
	@RequestMapping(value = "/eventImgList.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> selectEventImg(@RequestParam("evt_no") int evt_no, HttpServletRequest request){
		EventVO vo = eDAO.selectEventImg(evt_no);
		byte[] eventImg = null;
		try {
			InputStream is= request.getSession().getServletContext().getResourceAsStream("/resources/imgs/default.jpg");
			eventImg = IOUtils.toByteArray(is);	
			if(vo.getEvt_image() != null) {
				eventImg = vo.getEvt_image();
			}
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			return new ResponseEntity<byte[]>(eventImg,headers,HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
	@RequestMapping(value = "/eventImgContent.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> selectEventContent(@RequestParam("evt_no") int evt_no, HttpServletRequest request){
		EventVO vo1 = new EventVO();
		vo1.setEvt_no(evt_no);
		EventVO vo = eDAO.selectEventContent(evt_no);
		byte[] eventContent = null;
		
		
		
		try {
			InputStream is= request.getSession().getServletContext().getResourceAsStream("/resources/imgs/default.jpg");
			eventContent = IOUtils.toByteArray(is);	
			if(vo.getEvt_content() != null) {
				eventContent = vo.getEvt_content();
			}
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			return new ResponseEntity<byte[]>(eventContent,headers,HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	

}