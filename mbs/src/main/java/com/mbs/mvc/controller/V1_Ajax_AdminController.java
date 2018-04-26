package com.mbs.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mbs.mvc.dao.V1_AdminReviewDAO;
import com.mbs.mvc.dao.V1_AdminUserDAO;
import com.mbs.mvc.vo.V1_AdminReviewVO;

@RestController
public class V1_Ajax_AdminController {

	@Autowired
	private V1_AdminUserDAO auDAO = null;
	
	@Autowired
	private V1_AdminReviewDAO arDAO = null;
	
	@RequestMapping(value="/ajax_adminuserdelete.do", method= {RequestMethod.GET,RequestMethod.POST})
	public int ajaxadminuserdelete(@RequestParam("mb_id")String mb_id) {
		int ret = auDAO.deleteUser(mb_id);
		return ret;
	}
	
	@RequestMapping(value="/ajax_adminuserdelete1.do", method= {RequestMethod.GET,RequestMethod.POST})
	public int ajaxadminuserdelete1(@RequestParam("mb_id")String mb_id) {
		int ret = auDAO.deleteUser1(mb_id);
		return ret;
	}
	
	@RequestMapping(value="/ajax_admin_updateReview.do", method= {RequestMethod.GET,RequestMethod.POST})
	public int adminupdateReview(@RequestParam("rsv_cmt_no")int rsv_cmt_no,@RequestParam("rsv_cmt_content")String rsv_cmt_content,V1_AdminReviewVO vo) {
		vo.setRsv_cmt_no(rsv_cmt_no);
		vo.setRsv_cmt_content(rsv_cmt_content);
		int ret = arDAO.adminUpdateReview(vo);
		return ret;
	}
	
	@RequestMapping(value="/ajax_admin_deleteReview.do",method= {RequestMethod.GET,RequestMethod.POST})
	public int ajaxadmindeleteRevew(@RequestParam("rsv_cmt_no")int  rsv_cmt_no) {
		int ret = arDAO.admindeleteReview(rsv_cmt_no);
		return ret;
	}
	
	@RequestMapping(value="/ajax_admin_reportReview.do",method= {RequestMethod.GET,RequestMethod.POST})
	public int ajaxadminreportReview(@RequestParam("rsv_cmt_no")int  rsv_cmt_no) {
		int ret = arDAO.adminReportReview(rsv_cmt_no);
		return ret;
	}
}
