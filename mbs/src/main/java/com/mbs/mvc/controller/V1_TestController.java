package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbs.mvc.dao.V1_UserContentDAO;
import com.mbs.mvc.vo.V1_StrImg;

@Controller
public class V1_TestController {
	
	@Autowired private V1_UserContentDAO ucDAO = null;
	
	@RequestMapping(value="/test.do", method = RequestMethod.GET)
	public String test(Model model) {
		return "v1_test";
	}
	
	@RequestMapping(value="/test.do", method = RequestMethod.POST)
	public String test(MultipartHttpServletRequest request) {
		try {
			V1_StrImg vo = new V1_StrImg();
			List<MultipartFile> ilist = request.getFiles("imgs");
			
			vo.setStr_number(1234567890);
			
			for (int i = 0; i < ilist.size(); i++) {
				MultipartFile tmp = ilist.get(i);
				if (tmp != null && !tmp.getOriginalFilename().equals("")) {
					vo.setStr_image_idx(i);
					vo.setStr_image(tmp.getBytes());
					ucDAO.insertImgs(vo);
				}
			}
			return "redirect:test.do";
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
}
