package com.mbs.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.V1_AdminReviewDAO;
import com.mbs.mvc.vo.V1_AdminReviewVO;
import com.mbs.mvc.vo.V1_Admin_SearchVO;

@Controller
public class V1_AdminReviewController {

	@Autowired
	private V1_AdminReviewDAO arDAO;
	
	@RequestMapping(value="/admin_review.do",method = RequestMethod.GET)
	public String adminreviewlist(
			V1_AdminReviewVO vo,V1_Admin_SearchVO svo, Model model,
			@RequestParam(value="searchcol",defaultValue="1")int searchcol,
			@RequestParam(value="searchval",defaultValue="")String searchval,
			@RequestParam(value="page",defaultValue="-1")int page) {
		if(page == -1) {
			return "redirect:admin_review.do?page=1&searchcol=1&searchval=";
		}
		
		List<V1_AdminReviewVO> list = new ArrayList<V1_AdminReviewVO>();
		int pagecount = 0;
		int count = 0;
		svo.setSearchval(searchval);
		svo.setPage((page-1)*10);
		svo.setGubun(1);
				//업체명으로 검색
				if(searchcol == 1) {
					list = arDAO.selectReviewSearchNameList(svo);
					count = arDAO.selectReviewSearchNameCount(svo);
					pagecount = (count-1)/10+1;
				}
				//작성자로 검색
				else if(searchcol == 2) {
					list = arDAO.selectReviewSearchUserList(svo);
					count = arDAO.selectReviewSearchUserCount(svo);
					pagecount = (count-1)/10+1;
				}
			model.addAttribute("svo", svo);
			model.addAttribute("list", list);
			model.addAttribute("count", count);
			model.addAttribute("pagecount", pagecount);
		
		return "v1_admin_reviewlist";
	}
	
	@RequestMapping(value="/admin_reportreview.do",method = RequestMethod.GET)
	public String adminreportreview(
			V1_AdminReviewVO vo,V1_Admin_SearchVO svo, Model model,
			@RequestParam(value="searchcol",defaultValue="1")int searchcol,
			@RequestParam(value="searchval",defaultValue="")String searchval,
			@RequestParam(value="page",defaultValue="-1")int page) {
		if(page == -1) {
			return "redirect:admin_reportreview.do?page=1&searchcol=1&searchval=";
		}
		
		List<V1_AdminReviewVO> list = new ArrayList<V1_AdminReviewVO>();
		int pagecount = 0;
		int count = 0;
		svo.setSearchval(searchval);
		svo.setPage((page-1)*10);
		svo.setGubun(2);
				//업체명으로 검색
				if(searchcol == 1) {
					list = arDAO.selectReviewSearchNameList(svo);
					count = arDAO.selectReviewSearchNameCount(svo);
					pagecount = (count-1)/10+1;
				}
				//작성자로 검색
				else if(searchcol == 2) {
					list = arDAO.selectReviewSearchUserList(svo);
					count = arDAO.selectReviewSearchUserCount(svo);
					pagecount = (count-1)/10+1;
				}
			model.addAttribute("svo", svo);
			model.addAttribute("list", list);
			model.addAttribute("count", count);
			model.addAttribute("pagecount", pagecount);
			
			return "v1_admin_reportreview";
	}
}
