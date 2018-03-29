package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.V1_ReservationDAO;
import com.mbs.mvc.dao.V1_UserContentDAO;
import com.mbs.mvc.vo.V1_Menu;
import com.mbs.mvc.vo.V1_Reservation;

@Controller
public class ReservationController {
	
	@Autowired private V1_UserContentDAO ucDAO = null;
	@Autowired private V1_ReservationDAO rDAO = null;
	
	/*
	 * 예약하기
	 */
	@RequestMapping(value="/usr_content_pay.do", method = RequestMethod.POST)
	public String userContentPay(@ModelAttribute("rvo") V1_Reservation vo) {
		
		//세션아이디
		vo.setRsv_sub_id("user");
		//param
		vo.setStr_number(1234567890);
		int ret = rDAO.insertReservation(vo);
		if(ret!=0) {
			return "redirect:usr_rsv_list.do";
		}
		return "redirect:usr_content_pay.do";
	}
	
	/*
	 * 예약 리스트
	 */
	@RequestMapping(value="/usr_rsv_list.do", method = RequestMethod.GET)
	public String userReservationList(Model model,  @RequestParam(value="rsv_code", defaultValue="0") int rsv_code) {
		
		//세션 아이디
		V1_Reservation vo = new V1_Reservation();
		vo.setRsv_sub_id("user");
		
		int tot = rDAO.countRsvTot();
		int exp = rDAO.countRsvExp(rsv_code);
		int com = rDAO.countRsvCom(rsv_code);
		int can = rDAO.countRsvCan(rsv_code);
		
		model.addAttribute("tot", tot);
		model.addAttribute("exp", exp);
		model.addAttribute("com", com);
		model.addAttribute("can", can);
		
		if(rsv_code==0) {
			List<V1_Reservation> rlist = rDAO.selectRsvListTot(vo);
			model.addAttribute("rlist", rlist);
		}
		else {
			vo.setRsv_code(rsv_code);
			List<V1_Reservation> rlist = rDAO.selectRsvList(vo);
			model.addAttribute("rlist", rlist);
		}
		
		return "v1_usr_rsv_list";
	}
	
	/*
	 * 예약 내용
	 */
	@RequestMapping(value="/usr_rsv_content.do", method = RequestMethod.GET)
	public String userReservationContent(Model model, @RequestParam("rsv_no") int rsv_no) {
		
		V1_Reservation vo = new V1_Reservation();
		vo.setRsv_no(rsv_no);
		
		V1_Reservation rvo = rDAO.selectRsvOne(vo);
		List<V1_Menu> mlist = ucDAO.selectMenuList(1234567890);
		int cnt = ucDAO.selectImgCount(1234567890);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("mlist", mlist);
		model.addAttribute("vo", rvo);
		return "v1_usr_rsv_content";
	
	}
	
	@RequestMapping(value="/usr_rsv_edit.do", method = RequestMethod.GET)
	public String userReservationEdit(Model model, @RequestParam("rsv_no") int rsv_no, @RequestParam("str_num") int str_num) {
		
		V1_Reservation vo = new V1_Reservation();
		vo.setRsv_no(rsv_no);
		vo.setStr_number(str_num);
		V1_Reservation rvo = rDAO.selectRsvOne(vo);
		List<V1_Menu> mlist = ucDAO.selectMenuList(str_num);
		int cnt = ucDAO.selectImgCount(str_num);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("mlist", mlist);
		model.addAttribute("vo", rvo);
		
		return "v1_usr_rsv_edit";
	}
	
	@RequestMapping(value="/usr_rsv_edit.do", method = RequestMethod.POST)
	public String userReservationEdit(@ModelAttribute("vo") V1_Reservation vo) {
		System.out.println("AAAAAAAAA"+vo.getRsv_no());
		int ret = rDAO.updateRsv(vo);
		if(ret>0) {
			return "redirect:usr_rsv_content.do?rsv_no="+vo.getRsv_no();
		}
		return "redirect:usr_rsv_edit.do";
	}
	
	@RequestMapping(value="/usr_rsv_cancel.do", method = RequestMethod.GET)
	public String userRsvCancel(@RequestParam("rsv_no") int rsv_no) {
		System.out.println(rsv_no);
		
		rDAO.cancelRsv(rsv_no);
		
		return "redirect:usr_rsv_list.do";
	}
}
