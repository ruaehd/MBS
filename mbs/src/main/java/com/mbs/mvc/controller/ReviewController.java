package com.mbs.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.V1_ReviewDAO;
import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Reservation;

@Controller
public class ReviewController {
	@Autowired private V1_ReviewDAO reDAO = null;
	
	@RequestMapping(value="/usr_rsv_review.do", method = RequestMethod.GET)
	public String usrRsvReview(Model model, @RequestParam("rsv_no") int rsv_no) {
		
		return "v1_usr_rsv_review";
	}
	
	@RequestMapping(value="/usr_rsv_review.do", method = RequestMethod.POST)
	public String usrRsvReview(@ModelAttribute("cvo") V1_Comment vo) {
		
		return "";
	}
	
	@RequestMapping(value="/usr_rsv_comment.do", method = RequestMethod.GET)
	public String usrRsvComment(Model model) {
		
		V1_Comment vo = new V1_Comment();
		
		model.addAttribute("vo", vo);
		return "v1_usr_rsv_comment";
	}
	
	@RequestMapping(value="/usr_rsv_comment.do", method = RequestMethod.POST)
	public String usrRsvComment(@ModelAttribute("vo") V1_Comment vo) {
		
		reDAO.insertComment(vo);
		
		return "";
	}
}
