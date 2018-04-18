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

@Controller
public class ReviewController {
	@Autowired private V1_ReviewDAO reDAO = null;
	
	@RequestMapping(value="/usr_rsv_comment.do", method = RequestMethod.GET)
	public String usrRsvComment(Model model, @RequestParam("rsv_no") int rsv_no) {
		
		V1_Comment vo1 = reDAO.selectPreReview(rsv_no); 
		
		V1_Comment vo = new V1_Comment();
		vo.setStr_name(vo1.getStr_name());
		vo.setRsv_day(vo1.getRsv_day());
		
		model.addAttribute("vo", vo);
		return "v1_usr_rsv_review";
	}
	
	@RequestMapping(value="/usr_rsv_comment.do", method = RequestMethod.POST)
	public String usrRsvComment(Model model, @RequestParam("rsv_no") int rsv_no, @ModelAttribute("vo") V1_Comment vo) {
		vo.setRsv_no(rsv_no);
		vo.setRsv_cmt_writer("user");
		reDAO.insertComment(vo);
		
		model.addAttribute("message", "후기가 작성되었습니다.");
		
		return "alert";
	}
	
	@RequestMapping(value="/usr_rsv_comment_edit.do", method = RequestMethod.GET)
	public String usrRsvCommentEdit(Model model, @RequestParam("rsv_no") int rsv_no) {
		
		V1_Comment vo1 = reDAO.selectPreReview(rsv_no); 
		V1_Comment vo = new V1_Comment();
		
		vo.setRsv_no(rsv_no);
		vo.setRsv_cmt_writer("user");
		
		V1_Comment rvo = reDAO.selectReviewOne(vo);
		rvo.setStr_name(vo1.getStr_name());
		rvo.setRsv_day(vo1.getRsv_day());
		
		model.addAttribute("vo", rvo);
		return "v1_usr_rsv_review_edit";
	}
	
	@RequestMapping(value="/usr_rsv_comment_edit.do", method = RequestMethod.POST)
	public String usrRsvCommentEdit(Model model, @ModelAttribute("vo") V1_Comment vo, @RequestParam("cmt_no") int cmt_no) {
		vo.setRsv_cmt_no(cmt_no);		
		reDAO.updateComment(vo);
		
		model.addAttribute("message", "후기가 수정되었습니다.");
		
		return "alert";
	}
}
