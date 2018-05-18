package com.mbs.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mbs.mvc.dao.UserDAO;
import com.mbs.mvc.vo.MemberVO;
import com.mbs.mvc.vo.QuestionVO;

@RestController
public class UserAjaxController {
	
	@Autowired
	private UserDAO uDAO = null;
	
	@RequestMapping(value="/ajax_memberquestion.do",method = {RequestMethod.GET,RequestMethod.POST})
	public List<QuestionVO> ajax_memberquestion(@RequestParam(value="mb_id",required=false)String mb_id) {
		List<QuestionVO> list = uDAO.selectMemberQuestionList(mb_id);
		return list;
	}
	
	@RequestMapping(value="/ajax_memberPwCheck.do",method = {RequestMethod.GET,RequestMethod.POST})
	public MemberVO ajax_memberPwCheck(
			@RequestParam(value="mb_id",required=false)String mb_id,
			@RequestParam(value="mb_pw",required=false)String mb_pw,
			MemberVO vo) {
		vo.setMb_id(mb_id);
		vo.setMb_pw(mb_pw);
		MemberVO vo1 = uDAO.selectMemberLogin(vo);
		return vo1;
	}
	
	@RequestMapping(value="/ajax_memberlogin.do",method = {RequestMethod.GET,RequestMethod.POST})
	public MemberVO ajax_memberlogin(
			@RequestParam(value="id",required=false)String id,
			@RequestParam(value="pw",required=false)String pw,
			MemberVO vo) {
		vo.setMb_id(id);
		vo.setMb_pw(pw);
		MemberVO vo1 = uDAO.selectMemberLogin(vo);
		return vo1;
	}
	
	@RequestMapping(value="/ajax_idcheck.do",method = {RequestMethod.GET,RequestMethod.POST})
	public int ajaxidcheck(@RequestParam(value="id",required=false) String mb_id) {
		int ret = uDAO.selectMemberCheck(mb_id);
		return ret;
	}
	
	@RequestMapping(value="/ajax_emailcheck.do",method = {RequestMethod.GET,RequestMethod.POST})
	public int ajaxEmailCheck(
			@RequestParam(value="email") String mb_email, 
			@RequestParam(value="mb_id") String mb_id, 
			HttpSession httpSession) {
		
		MemberVO vo = new MemberVO();
		/*vo.setMb_id(String.valueOf((String)httpSession.getAttribute("Mem_Id")));*/
		vo.setMb_id(mb_id);
		vo.setMb_email(mb_email);
		int ret = uDAO.selectEmailCheck(vo);
		return ret;
	}
	
}
