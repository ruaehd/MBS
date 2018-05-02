package com.mbs.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.UserDAO;
import com.mbs.mvc.dao.V1_AdminUserDAO;
import com.mbs.mvc.vo.MemberVO;
import com.mbs.mvc.vo.V1_Admin_SearchVO;

@Controller
public class V1_AdminUserController {
	
	@Autowired
	private V1_AdminUserDAO auDAO;
	
	@Autowired
	private UserDAO uDAO;

	@RequestMapping(value="/admin_user.do",method = RequestMethod.GET)
	public String admin_user(
			@RequestParam(value="searchcol",defaultValue="1")int searchcol,
			@RequestParam(value="searchval",defaultValue="")String searchval,
			@RequestParam(value="page",defaultValue="-1")int page,
			MemberVO mvo,
			V1_Admin_SearchVO svo,
			Model model) {
		
		if(page == -1) {
			return "redirect:admin_user.do?page=1&searchcol=1&searchval=";
		}
		//리스트 객체 지정
		List<MemberVO> list = new ArrayList<MemberVO>();
		int pagecount = 0;
		int count = 0;
		svo.setSearchval(searchval);
		svo.setPage((page-1)*10);
		svo.setGubun(1);
				//이름으로 검색
				if(searchcol == 1) {
					list = auDAO.selectSearchNameUserList(svo);
					count = auDAO.selectSearchNameUserCount(svo);
					pagecount = (count-1)/10+1;
				}
				//아이디로 검색
				else if(searchcol == 2) {
					 list = auDAO.selectSearchIdUserList(svo);
					 count = auDAO.selectSearchIdUserCount(svo);
					pagecount = (count-1)/10+1;
				}
			model.addAttribute("svo", svo);
			model.addAttribute("count", count);
			model.addAttribute("pagecount", pagecount);
			model.addAttribute("list",list);
			model.addAttribute("mvo",mvo);
			return "v1_admin_userlist";
	}
	
	@RequestMapping(value="/admin_insertMember.do",method = RequestMethod.POST)
	public String admin_insertMember(@ModelAttribute("mvo")MemberVO vo,Model model) {
		try {
			int ret = uDAO.insertMemberJoin(vo);
				if(ret == 1) {

					return "redirect:admin_user.do?page=1";
				}
				else {
					model.addAttribute("message", "회원추가에 실패하셨습니다 다시 시도해주세요");
					model.addAttribute("url", "admin_user.do?page=1");
					return "alert";
				}
			}
			catch(Exception e) {
				System.out.println(e.getMessage());
				model.addAttribute("message", "회원가입이 실패하셨습니다 다시 시도해주세요");
				model.addAttribute("url", "admin_user.do?page=1");
				return "alert";
			}
	}
	
	@RequestMapping(value="/admin_reportuser.do",method = RequestMethod.GET)
	public String admin_reportuser(
			@RequestParam(value="searchcol",defaultValue="1")int searchcol,
			@RequestParam(value="searchval",defaultValue="")String searchval,
			@RequestParam(value="page",defaultValue="-1")int page,
			MemberVO mvo,
			V1_Admin_SearchVO svo,
			Model model) {
		
		if(page == -1) {
			return "redirect:admin_reportuser.do?page=1&searchcol=1&searchval=";
		}
		//리스트 객체 지정
		List<MemberVO> list = new ArrayList<MemberVO>();
		int pagecount = 0;
		int count = 0;
		svo.setSearchval(searchval);
		svo.setPage((page-1)*10);
		svo.setGubun(0);
						//이름으로 검색
						if(searchcol == 1) {
							list = auDAO.selectSearchNameUserList(svo);
							count = auDAO.selectSearchNameUserCount(svo);
							pagecount = (count-1)/10+1;
						}
						//아이디로 검색
						else if(searchcol == 2) {
							 list = auDAO.selectSearchIdUserList(svo);
							 count = auDAO.selectSearchIdUserCount(svo);
							pagecount = (count-1)/10+1;
						}
					model.addAttribute("svo", svo);
					model.addAttribute("count", count);
					model.addAttribute("pagecount", pagecount);
					model.addAttribute("list",list);
					model.addAttribute("mvo",mvo);
					return "v1_admin_reportuser";
	}
}
