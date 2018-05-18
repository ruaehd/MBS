package com.mbs.mvc.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String userContentPay(@ModelAttribute("rvo") V1_Reservation vo, 
			@RequestParam("mn_name[]") String[] name, 
			@RequestParam("mn_price[]") int[] price, 
			@RequestParam("mn_cnt[]") int[] cnt,
			@RequestParam("str_number") int str_number,
			@RequestParam("mb_id") String mb_id,
			@RequestParam("str_email") String str_email,
			HttpSession httpSession,
			HttpServletRequest request,
			Model model) {
		
		try{
			//세션아이디
			if(Integer.valueOf((String)httpSession.getAttribute("Mem_Grade"))>2) {	//관리자라면
				vo.setRsv_sub_id(mb_id);
			}
			else {	//관리자가 아니라면
				vo.setRsv_sub_id(String.valueOf((String)httpSession.getAttribute("Mem_Id")));
			}
			vo.setStr_number(str_number);
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
			
			rDAO.insertReservation(vo);
			System.out.println("AAAAAA"+vo.getRsv_no());
			vo.setRsv_no(vo.getRsv_no());
			
			rDAO.insertMenuReservation(vo);
			
			
			String rsv_email = vo.getRsv_sub_email();
			String rsv_title = "예약완료";
			String rsv_text = "확인하셈";
			
			String str_title = "신규예약";
			String str_text = "확인ㄱㄱ";
			
			V1_EmailConfigure.sendEmail(rsv_email.toString(), rsv_title, rsv_text);	//예약자
			V1_EmailConfigure.sendEmail(str_email.toString(), str_title, str_text);	//사업자

			model.addAttribute("message", "신규 예약이 완료 되었습니다.");
			model.addAttribute("title", "예약 완료");
			
			if(Integer.valueOf((String)httpSession.getAttribute("Mem_Grade"))>2) {	//관리자라면
				model.addAttribute("url", "admin_rsv_management.do");
			}
			else {	//관리자가 아니라면
				model.addAttribute("url", "usr_rsv_list.do");
			}
			
			return "v1_alert";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("title", "예약 실패");
			model.addAttribute("message", "예약이 실패하였습니다.");
			model.addAttribute("url", request.getHeader("REFERER"));
			return "v1_alert";
		}
	}
	
	/*
	 * 예약목록
	 */
	@RequestMapping(value="/usr_rsv_list.do", method = RequestMethod.GET)
	public String userReservationList(Model model,  
			@RequestParam(value="rsv_code", defaultValue="-1") int rsv_code, 
			@RequestParam(value="page", defaultValue="1") int page,
			HttpSession httpSession) {
		try {
		
			if(rsv_code == -1) {	//menu값이 없을 경우
				return "redirect:usr_rsv_list.do?rsv_code=0";
			}
			String rsv_id = (String)httpSession.getAttribute("Mem_Id");
			
			//세션아이디
			V1_Reservation vo = new V1_Reservation();
			vo.setRsv_sub_id(rsv_id);
			vo.setPage((page-1)*10);
			vo.setRsv_code(rsv_code);
			Map<String, Integer> map = rDAO.countRsvTot(vo);
			Map<String, Integer> map1 = new LinkedHashMap<String, Integer>();
			
			if(map.get("exp") == null) {
				map.put("exp", 0);
				map.put("com", 0);
				map.put("can", 0);
			}
			
			int tot = Integer.parseInt(String.valueOf(map.get("exp")))
					+Integer.parseInt(String.valueOf(map.get("com")))
					+Integer.parseInt(String.valueOf(map.get("can")));
			
			map1.put("전체", tot);
			map1.put("이용예정", Integer.parseInt(String.valueOf(map.get("exp"))));
			map1.put("이용완료", Integer.parseInt(String.valueOf(map.get("com"))));
			map1.put("예약취소", Integer.parseInt(String.valueOf(map.get("can"))));
			
			
			model.addAttribute("map", map1);
			
			List<V1_Reservation> rlist = rDAO.selectRsvList(vo);
			model.addAttribute("rlist", rlist);
			
			return "v1_usr_rsv_list";
		}
		catch(Exception e){
			System.out.println(e.getMessage());
			return "v1_usr_rsv_list";
		}
	}
	
	/*
	 * 예약내용
	 */
	@RequestMapping(value="/usr_rsv_content.do", method = RequestMethod.GET)
	public String userReservationContent(Model model, HttpSession httpSession,
			@RequestParam("rsv_no") int rsv_no, 
			@RequestParam("str_number") int str_number) {
		
		try {
			V1_Reservation vo = new V1_Reservation();
			vo.setRsv_no(rsv_no);
			String id = (String)httpSession.getAttribute("Mem_Id");
			V1_Comment revo = new V1_Comment();
			revo.setRsv_cmt_writer(id);
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
		catch(Exception e) {
			System.out.println(e.getMessage());
			return "v1_usr_rsv_content";
		}
	
	}
	
	@RequestMapping(value="/usr_rsv_edit.do", method = RequestMethod.GET)
	public String userReservationEdit(Model model, HttpServletRequest request,
			@RequestParam("rsv_no") int rsv_no, 
			@RequestParam("str_number") int str_number) {
		
		try {
			V1_Reservation vo = new V1_Reservation();
			vo.setRsv_no(rsv_no);
			vo.setStr_number(str_number);
			V1_Reservation rvo = rDAO.selectRsvOne(vo);
			List<V1_RsvMenu> rmlist = rDAO.selectRsvMenuList(rsv_no);
			int cnt = ucDAO.selectImgCount(str_number);
			
			String back_url = request.getHeader("REFERER");
			
			
			model.addAttribute("cnt", cnt);
			model.addAttribute("rmlist", rmlist);
			model.addAttribute("vo", rvo);
			model.addAttribute("url", back_url);
			
			return "v1_usr_rsv_edit";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "v1_usr_rsv_edit";
		}
		
	}
	
	@RequestMapping(value="/usr_rsv_edit.do", method = RequestMethod.POST)
	public String userReservationEdit(@ModelAttribute("vo") V1_Reservation vo, 
			@RequestParam("mn_name[]") String[] name, 
			@RequestParam("mn_price[]") int[] price, 
			@RequestParam("mn_cnt[]") int[] cnt, 
			@RequestParam("str_email") String str_email,
			Model model) {
		
		try {
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
			
			rDAO.updateRsv(vo);
			
			String rsv_email = vo.getRsv_sub_email();
			String rsv_title = "예약수정";
			String rsv_text = "확인하셈";
			
			String str_title = "예약바뀜";
			String str_text = "확인ㄱㄱ";
			
			V1_EmailConfigure.sendEmail(rsv_email.toString(), rsv_title, rsv_text);	//예약자
			V1_EmailConfigure.sendEmail(str_email.toString(), str_title, str_text);	//사업자
			
			String url = "usr_rsv_content.do?str_number="+vo.getStr_number()+"&rsv_no="+vo.getRsv_no();
			model.addAttribute("title", "수정 완료");
			model.addAttribute("message", "예약 수정이 완료 되었습니다.");
			model.addAttribute("url", url);
			return "v1_alert";
			
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("title", "수정 실패");
			model.addAttribute("message", "예약 수정이 실패하였습니다.");
			model.addAttribute("url", "redirect:usr_rsv_edit.do");
			return "v1_alert";
		}
		
	}
	
	@RequestMapping(value="/usr_rsv_cancel.do", method = RequestMethod.GET)
	public String userRsvCancel(@RequestParam("rsv_no") int rsv_no, Model model, HttpServletRequest request) {
		
		try{
			rDAO.cancelRsv(rsv_no);
			
			V1_Reservation vo = rDAO.rsvEmail(rsv_no);
			
			String rsv_email = vo.getRsv_sub_email();
			String rsv_title = "예약취소";
			String rsv_text = "확인하셈";
			
			String str_email = vo.getMb_email();
			String str_title = "예약취소1";
			String str_text = "확인ㄱㄱ";
			
			V1_EmailConfigure.sendEmail(rsv_email.toString(), rsv_title, rsv_text);	//예약자
			V1_EmailConfigure.sendEmail(str_email.toString(), str_title, str_text);	//사업자
			
			model.addAttribute("message", "예약을 취소했습니다.");
			model.addAttribute("title", "예약 취소 완료");
			String url = (String)request.getHeader("REFERER");
			model.addAttribute("url", url);
			
			return "v1_alert";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "예약 취소를 실패했습니다.");
			model.addAttribute("title", "예약 취소 실패");
			String url = (String)request.getHeader("REFERER");
			model.addAttribute("url", url);
			return "v1_alert";
		}
		
	}
}
