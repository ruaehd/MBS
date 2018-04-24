package com.mbs.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.conf.V1_EmailConfigure;
import com.mbs.mvc.dao.V1_ReservationDAO;
import com.mbs.mvc.dao.V1_ReviewDAO;
import com.mbs.mvc.dao.V1_UserContentDAO;
import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Menu;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_RsvMenu;

@Controller
public class V1_ReservationController {
	
	@Autowired private V1_UserContentDAO ucDAO = null;
	@Autowired private V1_ReservationDAO rDAO = null;
	@Autowired private V1_ReviewDAO reDAO = null;
	
	/*
	 * 예약
	 */
	@RequestMapping(value="/usr_content_pay.do", method = RequestMethod.POST)
	public String userContentPay(@ModelAttribute("rvo") V1_Reservation vo, @RequestParam("mn_name[]") String[] name, @RequestParam("mn_price[]") int[] price, @RequestParam("mn_cnt[]") int[] cnt) {
		//세션아이디
		vo.setRsv_sub_id("user");
		//param
		vo.setStr_number(1234567890);
		System.out.println(vo.getRsv_day());
		
		List<V1_RsvMenu> list = new ArrayList<V1_RsvMenu>();
		
		for(int i=0; i<name.length; i++) {
			V1_RsvMenu vo1 = new V1_RsvMenu();
			vo1.setRsv_mn_name(name[i]);
			vo1.setRsv_mn_price(price[i]);
			vo1.setRsv_mn_cnt(cnt[i]);
			vo1.setRsv_mn_idx(i);
			list.add(vo1);
		}
		vo.setRmlist(list);
		int ret = rDAO.insertReservation(vo);
		
		if(ret!=0) {
			return "redirect:usr_rsv_list.do";
		}
		
		return "redirect:usr_content_pay.do";
	}
	
	/*
	 * 예약목록
	 */
	@RequestMapping(value="/usr_rsv_list.do", method = RequestMethod.GET)
	public String userReservationList(Model model,  @RequestParam(value="rsv_code", defaultValue="-1") int rsv_code, @RequestParam(value="page", defaultValue="1") int page) {
		
		if(rsv_code == -1) {	//menu값이 없을 경우
			return "redirect:usr_rsv_list.do?rsv_code=0";
		}
		
		//세션아이디
		V1_Reservation vo = new V1_Reservation();
		vo.setRsv_sub_id("user");
		vo.setPage((page-1)*10);
		vo.setRsv_code(rsv_code);
		Map<String, Integer> map = rDAO.countRsvTot(vo);
		Map<String, Integer> map1 = new LinkedHashMap<String, Integer>();
		
		int tot = Integer.parseInt(String.valueOf(map.get("exp")))
				+Integer.parseInt(String.valueOf(map.get("com")))
				+Integer.parseInt(String.valueOf(map.get("can")));
		
		map1.put("전체", tot);
		map1.put("이용예정", Integer.parseInt(String.valueOf(map.get("exp"))));
		map1.put("이용완료", Integer.parseInt(String.valueOf(map.get("com"))));
		map1.put("취소환불", Integer.parseInt(String.valueOf(map.get("can"))));
		
		
		model.addAttribute("map", map1);
		
		List<V1_Reservation> rlist = rDAO.selectRsvList(vo);
		model.addAttribute("rlist", rlist);
		
		
		return "v1_usr_rsv_list";
	}
	
	/*
	 * 예약내용
	 */
	@RequestMapping(value="/usr_rsv_content.do", method = RequestMethod.GET)
	public String userReservationContent(Model model, @RequestParam("rsv_no") int rsv_no, @RequestParam("str_number") int str_number) {
		
		V1_Reservation vo = new V1_Reservation();
		vo.setRsv_no(rsv_no);
		
		V1_Comment revo = new V1_Comment();
		revo.setRsv_cmt_writer("user");
		revo.setRsv_no(rsv_no);
		
		V1_Reservation rvo = rDAO.selectRsvOne(vo);
		List<V1_RsvMenu> rmlist = rDAO.selectRsvMenuList(rsv_no);
		int cnt = ucDAO.selectImgCount(str_number);
		int chk = reDAO.selectReviewChk(revo);
		
		model.addAttribute("chk", chk);
		model.addAttribute("cnt", cnt);
		model.addAttribute("rmlist", rmlist);
		model.addAttribute("vo", rvo);
		return "v1_usr_rsv_content";
	
	}
	
	@RequestMapping(value="/usr_rsv_edit.do", method = RequestMethod.GET)
	public String userReservationEdit(Model model, @RequestParam("rsv_no") int rsv_no, @RequestParam("str_number") int str_number) {
		
		V1_Reservation vo = new V1_Reservation();
		vo.setRsv_no(rsv_no);
		vo.setStr_number(str_number);
		V1_Reservation rvo = rDAO.selectRsvOne(vo);
		List<V1_RsvMenu> rmlist = rDAO.selectRsvMenuList(rsv_no);
		int cnt = ucDAO.selectImgCount(str_number);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("rmlist", rmlist);
		model.addAttribute("vo", rvo);
		
		return "v1_usr_rsv_edit";
	}
	
	@RequestMapping(value="/usr_rsv_edit.do", method = RequestMethod.POST)
	public String userReservationEdit(@ModelAttribute("vo") V1_Reservation vo, 
			@RequestParam("mn_name[]") String[] name, 
			@RequestParam("mn_price[]") int[] price, 
			@RequestParam("mn_cnt[]") int[] cnt, Model model) {
		
		List<V1_RsvMenu> list = new ArrayList<V1_RsvMenu>();
		for(int i=0; i<name.length; i++) {
			V1_RsvMenu vo1 = new V1_RsvMenu();
			vo1.setRsv_mn_name(name[i]);
			vo1.setRsv_mn_price(price[i]);
			vo1.setRsv_mn_cnt(cnt[i]);
			vo1.setRsv_no(vo.getRsv_no());
			vo1.setRsv_mn_idx(i);
			list.add(vo1);
			
			System.out.println(list.get(i).getRsv_mn_cnt());
		}
		vo.setRmlist(list);
		
		
		
		int ret = rDAO.updateRsv(vo);
		if(ret>0) {
			
			String email = "ruaehdehddk@naver.com";
			String title = "예약수정";
			String text = "확인하셈";
			String title1 = "예약바뀜";
			String text1 = "확인ㄱㄱ";
			
			V1_EmailConfigure.sendEmail(email.toString(), title, text);
			V1_EmailConfigure.sendEmail(email.toString(), title1, text1);
			
			String url = "usr_rsv_content.do?str_number="+vo.getStr_number()+"&rsv_no="+vo.getRsv_no();
			model.addAttribute("message", "예약을 수정했습니다.");
			model.addAttribute("url", url);
			return "alert";
		}
		return "redirect:usr_rsv_edit.do";
	}
	
	@RequestMapping(value="/usr_rsv_cancel.do", method = RequestMethod.GET)
	public String userRsvCancel(@RequestParam("rsv_no") int rsv_no, Model model, HttpServletRequest request) {
		rDAO.cancelRsv(rsv_no);
		
		String email = "ruaehdehddk@naver.com";
		String title = "예약취소";
		String text = "확인하셈";
		
		
		V1_EmailConfigure.sendEmail(email.toString(), title, text);
		
		model.addAttribute("message", "예약을 취소했습니다.");
		String url = (String)request.getHeader("REFERER");
		model.addAttribute("url", url);
		
		return "alert";
	}
}
