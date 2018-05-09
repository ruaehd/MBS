package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mbs.mvc.dao.V1_ReviewDAO;
import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Reply;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_TourComment;

@RestController
public class V1_Ajax_Controller {

	@Autowired private V1_ReviewDAO reDAO = null;
	
	@RequestMapping(value="/ajax_reviewlist.do", method = RequestMethod.GET)
	public List<V1_Comment> reviewlist(@RequestParam(value="page", defaultValue="1") int page, @RequestParam("str_number") int str_number) {
		
		try{
			V1_Store vo1 = new V1_Store();
			vo1.setPage((page-1)*5);
			vo1.setStr_number(str_number);
			
			List<V1_Comment> clist = reDAO.selectCmtList(vo1);
			
			return clist;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
	@RequestMapping(value="/ajax_tourreviewlist.do", method = RequestMethod.GET)
	public List<V1_TourComment> tourReviewList(@RequestParam(value="page", defaultValue="1") int page, @RequestParam("str_number") int str_number) {
		
		try {
			V1_Store vo1 = new V1_Store();
			vo1.setPage((page-1)*5);
			vo1.setStr_number(str_number);
			
			List<V1_TourComment> clist = reDAO.selectTourCmtList(vo1);
			
			return clist;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
	@RequestMapping(value="/ajax_replylist.do", method = RequestMethod.GET)
	public V1_Reply replylist(@RequestParam("rsv_cmt_no") int rsv_cmt_no) {
		
		try {
			V1_Reply vo = reDAO.selectReplyList(rsv_cmt_no);
			
			return vo;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
}
