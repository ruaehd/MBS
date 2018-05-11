package com.mbs.mvc.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.MainDAO;

@Controller
public class MainController {
	
	@Autowired
	private MainDAO maDAO = null;

	@RequestMapping(value="/index.do", method= RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/map_main.do", method= RequestMethod.GET)
	public String map_main(HttpSession httpsession) {
		System.out.println(httpsession.getAttribute("Mem_Grade"));
		return "map_main";
	}
	
	@RequestMapping(value="/web_main.do", method= RequestMethod.GET)
	public String web_main() {
		return "web_main";
	}
	
	@RequestMapping(value="/getBlobImg.do",method = {RequestMethod.GET,RequestMethod.POST})
	public ResponseEntity<byte[]> getBlobImg(@RequestParam(value="no") int no,HttpServletRequest request) {
		
		Map<String,Object> map= maDAO.selectImgOne(no);
		byte[] imgData = null;
		imgData = (byte[]) map.get("str_image");
		try {
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(org.springframework.http.MediaType.IMAGE_JPEG);
			return new ResponseEntity<byte[]>(imgData, headers,HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
}
