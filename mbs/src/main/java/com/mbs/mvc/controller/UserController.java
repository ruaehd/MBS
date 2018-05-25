package com.mbs.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mbs.mvc.conf.V1_AuthEmail;
import com.mbs.mvc.conf.V1_RandomNumber;
import com.mbs.mvc.dao.UserDAO;
import com.mbs.mvc.vo.MemberVO;
import com.mbs.mvc.vo.NoticeVO;
import com.mbs.mvc.vo.QuestionVO;
import com.mbs.mvc.vo.User_EventVO;
import com.mbs.mvc.vo.User_ResoverVO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO uDAO;
	@RequestMapping(value="/user_joinsuc.do",method=RequestMethod.GET)
	public String userjoinsuc() {
		return "v1_user_joinsuccess";
	}
	
	@RequestMapping(value="/user_forgetpw.do",method=RequestMethod.GET)
	public String user_forgetpw(Model model,MemberVO vo) {
		model.addAttribute("vo", vo);
		return "user_member_forgetpassword";
	}
	
	@RequestMapping(value="/user_forgetpw.do",method=RequestMethod.POST)
	public String user_forgetpw(@RequestParam("mb_pw") String mb_pw,@RequestParam("mb_id") String id,MemberVO vo,Model model) {
		try {
			vo.setMb_id(id);
			vo.setMb_pw(mb_pw);
		int ret = uDAO.userChangePw(vo);
			if(ret == 1) {
			model.addAttribute("message", "비밀번호 변경이 완료되었습니다");
			model.addAttribute("url", "user_main.do");
			return "alert";
			}
			else {
				model.addAttribute("message", "비밀번호 변경에 실패하셨습니다 다시 시도해주세요");
				model.addAttribute("url", "user_forgetpw.do");
				return "alert";
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@RequestMapping(value="/user_login.do",method=RequestMethod.GET)
	public String user_login(Model model,MemberVO vo) {
		model.addAttribute("vo",vo);
		return "user_member_login";
	}
	
	@RequestMapping(value="/user_logout.do",method=RequestMethod.GET)
	public String user_logout(HttpSession session,Model model,HttpServletRequest request) {
		if(session.getAttribute("Mem_Id") == null) {
			return  "redirect:map_main.do";
		}
		
		String url = null;
		url = (String)request.getHeader("REFERER");
		if((Integer)session.getAttribute("Mem_Grade") == 3) {
			url = "map_main.do";
		}
		session.invalidate();
		model.addAttribute("message", "로그아웃 되었습니다");
		model.addAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping(value="/user_login.do",method=RequestMethod.POST)
	public String user_login(
			@ModelAttribute("vo")MemberVO vo,
			HttpSession httpsession,
			HttpServletResponse response,
			HttpServletRequest request,
			Model model){
		MemberVO vo1 = uDAO.selectMemberLogin(vo);
		
		if(vo1 != null){
			String tmp = (String)httpsession.getAttribute("back_url");
			if(vo1.getMb_grade() == 3) {
				tmp = "admin_user.do";
			}
			if(tmp == null) {
				tmp = "map_main.do";
			}
			httpsession.setAttribute("Mem_Id", vo1.getMb_id());
			httpsession.setAttribute("Mem_Name", vo1.getMb_name());
			httpsession.setAttribute("Mem_Grade", vo1.getMb_grade());
			return "redirect:"+tmp;
		}
		else {
			model.addAttribute("message","아이디 또는 암호가 틀립니다.");
			model.addAttribute("url", "user_login.do");
			return "alert";
		}
	}
	
	@RequestMapping(value="/user_join.do",method=RequestMethod.GET)
	public String user_join(Model model,MemberVO vo) {
		model.addAttribute("vo",vo);
		return "user_member_join";
	}
	
	@RequestMapping(value="/user_join.do",method=RequestMethod.POST)
	public String user_join(@ModelAttribute("vo") MemberVO vo,Model model) {
		try {
		int ret = uDAO.insertMemberJoin(vo);
			if(ret == 1) {
				return "redirect:user_joinsuc.do";
			}
			else {
				model.addAttribute("message", "회원가입이 실패하셨습니다 다시 시도해주세요");
				model.addAttribute("url", "user_join.do");
				return "alert";
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "회원가입이 실패하셨습니다 다시 시도해주세요");
			model.addAttribute("url", "user_join.do");
			return "alert";
		}
	}
	
	@RequestMapping(value="/user_edit.do",method=RequestMethod.GET)
	public String user_edit(Model model,HttpSession session,MemberVO vo) {
		try {
			vo.setMb_id((String) session.getAttribute("Mem_Id"));
			MemberVO vo1 = uDAO.selectMemberOne(vo.getMb_id());
			model.addAttribute("vo", vo1);
			return "user_member_edit";
		}
		catch(Exception e) {
			model.addAttribute("message", "회원정보를 불러오는데 실패했습니다. 다시 시도해주세요.");
			model.addAttribute("url", "user_main.do");
			return "alert";
			
		}
	}
	
	@RequestMapping(value="/user_edit.do",method=RequestMethod.POST)
	public String user_edit(@ModelAttribute("vo")MemberVO vo,Model model) {
		try {
		int ret = uDAO.updateMemberOne(vo);
			if(ret == 1) {
				model.addAttribute("message", "회원수정이 완료되었습니다.");
				model.addAttribute("url", "user_main.do");
				return "alert";
			}
			else {
				model.addAttribute("message", "회원수정이 실패하셨습니다 다시 시도해주세요");
				model.addAttribute("url", "user_edit.do");
				return "alert";
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@RequestMapping(value="/user_changepw.do",method=RequestMethod.GET)
	public String userChangePw(Model model,HttpSession session,MemberVO vo) {
		try {
			
			vo.setMb_id((String) session.getAttribute("Mem_Id"));
			MemberVO vo1 = uDAO.selectMemberOne(vo.getMb_id());
			model.addAttribute("vo", vo1);
			return "user_member_changepw";
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return "redirect:user_login.do";
		}
	}
	
	@RequestMapping(value="/user_changepw.do",method=RequestMethod.POST)
	public String userChangePw(@RequestParam("mb_pw") String mb_pw,HttpSession httpsession,MemberVO vo,Model model) {
		try {
			vo.setMb_id((String)httpsession.getAttribute("Mem_Id"));
			vo.setMb_pw(mb_pw);
			int ret = uDAO.userChangePw(vo);
			
			if(ret == 1) {
			model.addAttribute("message", "비밀번호 변경이 완료되었습니다");
			model.addAttribute("url", "user_main.do");
			return "alert";
			}
			else {
				model.addAttribute("message", "비밀번호 변경에 실패하셨습니다 다시 시도해주세요");
				model.addAttribute("url", "user_changepw.do");
				return "alert";
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@RequestMapping(value="/user_main.do", method = RequestMethod.GET)
	public String user_main(
			HttpSession httpsession,
			MemberVO mvo,
			Model model,
			HttpServletResponse response,
			HttpServletRequest request
			) {
		try {
			String mb_id = (String)httpsession.getAttribute("Mem_Id");
			if(mb_id == null) {
				return "redirect:user_login.do";
			}
			else {
	
			List<User_ResoverVO> rvo = new ArrayList<User_ResoverVO>();
			List<NoticeVO> nvo = new ArrayList<NoticeVO>();
			List<QuestionVO> qvo = new ArrayList<QuestionVO>();
			List<User_EventVO> evo = new ArrayList<User_EventVO>();
			
			mvo = uDAO.selectMemberOne(mb_id);
			rvo = uDAO.selectResoverList(mb_id);
			qvo = uDAO.selectQuestionList(mb_id);
			nvo = uDAO.selectNoticeList();
			evo = uDAO.selectEventList();
			
			model.addAttribute("mvo",mvo);
			model.addAttribute("rlist", rvo);
			model.addAttribute("qlist", qvo);
			model.addAttribute("nlist", nvo);
			model.addAttribute("elist", evo);
			return "user_main";
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	@RequestMapping(value="emailAuth.do", method = RequestMethod.GET)
	public String emailAuth(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
		
		String email = request.getParameter("email");
		String authNum = "";
		
		authNum = V1_RandomNumber.RandomNum();
		V1_AuthEmail.authEmail(email.toString(), authNum);
		
		System.out.println(authNum);
		model.addAttribute("email", email);
		model.addAttribute("authNum", authNum);
		return "emailAuth";
	}
	
}
