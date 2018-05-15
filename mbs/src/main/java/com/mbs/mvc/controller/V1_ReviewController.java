package com.mbs.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.V1_ReviewDAO;
import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_TourComment;

@Controller
public class V1_ReviewController {
	@Autowired private V1_ReviewDAO reDAO = null;
	
	@RequestMapping(value="/usr_rsv_comment.do", method = RequestMethod.GET)
	public String usrRsvComment(Model model, @RequestParam("rsv_no") int rsv_no) {
		
		try {
			V1_Comment vo1 = reDAO.selectPreReview(rsv_no); 
			
			V1_Comment vo = new V1_Comment();
			vo.setStr_name(vo1.getStr_name());
			vo.setRsv_day(vo1.getRsv_day());
			
			model.addAttribute("vo", vo);
			return "v1_usr_rsv_review";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "v1_usr_rsv_review";
		}
		
	}
	
	@RequestMapping(value="/usr_rsv_comment.do", method = RequestMethod.POST)
	public String usrRsvComment(Model model, HttpSession httpSession, @RequestParam("rsv_no") int rsv_no, @ModelAttribute("vo") V1_Comment vo) {
		try {
			vo.setRsv_no(rsv_no);
			String id = (String)httpSession.getAttribute("Mem_Id");
			vo.setRsv_cmt_writer(id);
			reDAO.insertComment(vo);
			
			model.addAttribute("message", "후기가 작성되었습니다.");
			model.addAttribute("title", "후기 작성 완료");
			
			return "v1_alert_pop";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "후기가 작성이 실패하였습니다.");
			model.addAttribute("title", "후기 작성 실패");
			
			return "v1_alert_pop";
		}
		
	}
	
	@RequestMapping(value="/usr_rsv_comment_edit.do", method = RequestMethod.GET)
	public String usrRsvCommentEdit(Model model, HttpSession httpSession, @RequestParam("rsv_no") int rsv_no) {
		
		try {
			V1_Comment vo1 = reDAO.selectPreReview(rsv_no); 
			V1_Comment vo = new V1_Comment();
			String id = (String)httpSession.getAttribute("Mem_Id");
			
			vo.setRsv_no(rsv_no);
			vo.setRsv_cmt_writer(id);
			
			V1_Comment rvo = reDAO.selectReviewOne(vo);
			rvo.setStr_name(vo1.getStr_name());
			rvo.setRsv_day(vo1.getRsv_day());
			
			model.addAttribute("vo", rvo);
			return "v1_usr_rsv_review_edit";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "v1_usr_rsv_review_edit";
		}
		
	}
	
	@RequestMapping(value="/usr_rsv_comment_edit.do", method = RequestMethod.POST)
	public String usrRsvCommentEdit(Model model, @ModelAttribute("vo") V1_Comment vo, @RequestParam("cmt_no") int cmt_no) {
		try {
			vo.setRsv_cmt_no(cmt_no);		
			reDAO.updateComment(vo);
			
			model.addAttribute("message", "후기가 수정되었습니다.");
			model.addAttribute("title", "후기 수정 완료");
			return "v1_alert_pop";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "후기 수정이 실패하였습니다.");
			model.addAttribute("title", "후기 수정 실패");
			return "v1_alert_pop";
		}
		
	}
	
	@RequestMapping(value="/usr_tour_comment.do", method = RequestMethod.GET)
	public String usrTourComment(Model model, @RequestParam("str_number") int str_number) {
		
		try {
			V1_Store vo1 = reDAO.selectTourPreReview(str_number); 
			
			V1_TourComment vo = new V1_TourComment();
			vo.setStr_name(vo1.getStr_name());
			vo.setStr_number(vo1.getStr_number());
			
			model.addAttribute("vo", vo);
			return "v1_usr_tour_comment";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "v1_usr_tour_comment";
		}
		
	}
	
	@RequestMapping(value="/usr_tour_comment.do", method = RequestMethod.POST)
	public String usrTourComment(Model model, @ModelAttribute("vo") V1_TourComment vo, HttpSession httpSession) {
		
		try {
			vo.setTour_cmt_writer((String)httpSession.getAttribute("Mem_Id"));
			reDAO.insertTourCmt(vo);
			
			model.addAttribute("message", "후기 작성이 완료되었습니다.");
			model.addAttribute("title", "후기 작성 완료");
			return "v1_alert_pop";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "후기 작성이 실패하였습니다.");
			model.addAttribute("title", "후기 작성 실패");
			return "v1_alert_pop";
		}
		
	}
	
	@RequestMapping(value="/usr_tour_comment_edit.do", method = RequestMethod.GET)
	public String usrTourRsvCommentEdit(Model model, @RequestParam("str_number") int str_number, HttpSession httpSession) {
		
		try{
			V1_Store vo1 = reDAO.selectTourPreReview(str_number);
			V1_TourComment vo = new V1_TourComment();
			vo.setStr_number(vo1.getStr_number());
			vo.setTour_cmt_writer((String) httpSession.getAttribute("Mem_Id"));
			
			V1_TourComment rvo = reDAO.selectTourReviewOne(vo);
			rvo.setStr_name(vo1.getStr_name());
			
			model.addAttribute("vo", rvo);
			return "v1_usr_tour_comment_edit";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "v1_usr_tour_comment_edit";
		}
		
	}
	
	@RequestMapping(value="/usr_tour_comment_edit.do", method = RequestMethod.POST)
	public String usrTourRsvCommentEdit(Model model, @ModelAttribute("vo") V1_TourComment vo) {
		
		try {
			reDAO.updateTourReview(vo);
			
			model.addAttribute("message", "후기 수정이 완료되었습니다.");
			model.addAttribute("title", "후기 수정 완료");
			return "v1_alert_pop";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "후기 수정이 실패하였습니다.");
			model.addAttribute("title", "후기 수정 실패");
			return "v1_alert_pop";
		}
		
	}
	
	@RequestMapping(value="/usr_comment_delete.do", method = RequestMethod.GET)
	public String usrRsvCommentDelete(Model model, @RequestParam("rsv_cmt_no") int rsv_cmt_no, HttpSession httpSession) {
		
		try{
			reDAO.deleteReview(rsv_cmt_no);
			
			model.addAttribute("message", "리뷰 삭제가 완료되었습니다.");
			model.addAttribute("title", "후기 삭제 완료");
			
			return "v1_alert_pop";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "리뷰 삭제가 실패하였습니다.");
			model.addAttribute("title", "후기 삭제 실패");
			
			return "v1_alert_pop";
		}
		
	}
	
	
	
	@RequestMapping(value="/usr_tour_comment_delete.do", method = RequestMethod.GET)
	public String usrTourRsvCommentDelete(Model model, @RequestParam("tour_cmt_no") int tour_cmt_no, HttpSession httpSession) {
		
		try{
			reDAO.deleteTourReview(tour_cmt_no);
			
			model.addAttribute("message", "리뷰 삭제가 완료되었습니다.");
			model.addAttribute("title", "리뷰 삭제 완료");
			
			return "v1_alert_pop";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "리뷰 삭제가 실패하였습니다.");
			model.addAttribute("title", "리뷰 삭제 실패");
			
			return "v1_alert_pop";
		}
		
	}
}
