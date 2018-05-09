package com.mbs.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.conf.V1_EmailConfigure;
import com.mbs.mvc.dao.V1_AdminDAO;
import com.mbs.mvc.vo.V1_AdminReview;
import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_TourComment;

@Controller
public class V1_AdminRsvManagementController {
	
	@Autowired private V1_AdminDAO aDAO = null;
	
	@RequestMapping(value="/admin_rsv_management.do", method=RequestMethod.GET)
	public String AdminRsvManagement(Model model, 
			@RequestParam(value="rsv_code", defaultValue="-1") int rsv_code, 
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="type", defaultValue="str_name") String type,
			@RequestParam(value="text", defaultValue="") String text) throws UnsupportedEncodingException {
		
		try {
			if(rsv_code == -1) {
				return "redirect:admin_rsv_management.do?rsv_code=0";
			}
			
			V1_Reservation vo = new V1_Reservation();
			vo.setPage((page-1)*10);
			vo.setRsv_code(rsv_code);
			vo.setText(text);
			vo.setType(type);
			
			Map<String, Object> map = aDAO.countAdminRsvTot(vo);
			Map<String, Object> map1 = new LinkedHashMap<String, Object>();
		
			
			if(map.get("exp") == null) {
				map.put("exp", 0);
				map.put("com", 0);
				map.put("can", 0);
			}
			
			int tot = Integer.parseInt(String.valueOf(map.get("exp")))
					+Integer.parseInt(String.valueOf(map.get("com")))
					+Integer.parseInt(String.valueOf(map.get("can")));
			
			map1.put("합계", tot);
			map1.put("이용예정", Integer.parseInt(String.valueOf(map.get("exp"))));
			map1.put("이용완료", Integer.parseInt(String.valueOf(map.get("com"))));
			map1.put("예약취소", Integer.parseInt(String.valueOf(map.get("can"))));
			
			List<V1_Reservation> list = aDAO.selectAdminRsvList(vo);
			
			model.addAttribute("map", map1);
			model.addAttribute("list", list);
			
			return"v1_admin_rsv_management";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return"v1_admin_rsv_management";
		}
		
	}
	
	@RequestMapping(value="/admin_rev_management.do", method=RequestMethod.GET)
	public String AdminReviewManagement(Model model, 
			@RequestParam(value="page", defaultValue="1") int page, 
			@RequestParam(value="str_cat", defaultValue="-1") int str_cat,
			@RequestParam(value="text", defaultValue="") String text) {
		
		try {
			if(str_cat == -1) {
				return "redirect:admin_rev_management.do?str_cat=0";
			}
			
			V1_Store vo = new V1_Store();
			vo.setPage((page-1)*6);
			vo.setText(text);
			vo.setStr_category(str_cat);
			
			
			Map<String, Object> map = aDAO.countAdminStrTot(vo);
			Map<String, Object> map1 = new LinkedHashMap<String, Object>();
		
			
			if(map.get("usual") == null) {
				map.put("usual", 0);
				map.put("tour", 0);
			}
			
			int tot = Integer.parseInt(String.valueOf(map.get("usual")))
					+Integer.parseInt(String.valueOf(map.get("tour")));
			
			map1.put("전체", tot);
			map1.put("일반", Integer.parseInt(String.valueOf(map.get("usual"))));
			map1.put("관광지", Integer.parseInt(String.valueOf(map.get("tour"))));
			
			List<V1_Store> list = aDAO.selectStoreList(vo);
			
			model.addAttribute("map", map1);
			model.addAttribute("list", list);
			
			return"v1_admin_rev_management";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return"v1_admin_rev_management";
		}
	}
	
	@RequestMapping(value="/admin_rev_list.do", method=RequestMethod.GET)
	public String AdminReviewList(Model model, 
			@RequestParam(value="page", defaultValue="1") int page, 
			@RequestParam("str_number") int str_number,
			@RequestParam("str_cat") int str_category,
			@RequestParam(value="type", defaultValue="rsv_cmt_content") String type,
			@RequestParam(value="text", defaultValue="") String text) {
		
		try {
			V1_Comment vo = new V1_Comment();
			vo.setStr_number(str_number);
			vo.setPage((page-1)*10);
			vo.setType(type);
			vo.setText(text);
			
			if(str_category == 1) {
				List<V1_AdminReview> list = aDAO.selectReviewList(vo);
				int tot = aDAO.countReviewTot(vo);
				model.addAttribute("list", list);
				model.addAttribute("tot", (tot-1)/10+1);
			}
			
			if(str_category == 2) {
				vo.setType("tour_cmt_content");
				List<V1_AdminReview> list = aDAO.selectTourReviewList(vo);
				int tot = aDAO.countTourReviewTot(vo);
				model.addAttribute("list", list);
				model.addAttribute("tot", (tot-1)/10+1);
			}
			
			model.addAttribute("cat", str_category);
			return "v1_admin_rev_list";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "v1_admin_rev_list";
		}
	}
	
	@RequestMapping(value="/admin_rev_delete.do", method=RequestMethod.GET)
	public String AdminReviewDelete(
			Model model,
			@RequestParam("no") int no, 
			@RequestParam("str_cat") int str_category,
			HttpServletRequest request) {
		
		try {
			if(request.getHeader("REFERER") != null) {
				
				if(str_category == 1) {
					List<V1_Comment> list = new ArrayList<V1_Comment>();
					V1_Comment vo = new V1_Comment();
					vo.setRsv_cmt_no(no);
					list.add(vo);
					
					aDAO.multiDeleteReview(list);
				}
				if(str_category == 2) {
					List<V1_TourComment> list = new ArrayList<V1_TourComment>();
					V1_TourComment vo = new V1_TourComment();
					vo.setTour_cmt_no(no);
					list.add(vo);
					
					aDAO.multiDeleteTourReview(list);
				}
						
				model.addAttribute("url", request.getHeader("REFERER"));
				model.addAttribute("message", "후기 삭제가 완료 되었습니다.");
				model.addAttribute("title", "삭제 완료");
				
				return "v1_alert";
			}
			else {
				return "redirect:admin_rev_management.do";
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:admin_rev_management.do";
		}
		
		
	}
	
	@RequestMapping(value="/admin_rev_delete.do", method=RequestMethod.POST)
	public String AdminReviewDelete(
			Model model,
			@RequestParam("chk[]") int[] chk, 
			@RequestParam("str_cat") int str_category,
			HttpServletRequest request) {
		
		try {
			if(request.getHeader("REFERER") != null) {
				
				if(str_category == 1) {
					List<V1_Comment> list = new ArrayList<V1_Comment>();
					
					for(int i=0; i< chk.length; i++) {
						V1_Comment vo = new V1_Comment();
						vo.setRsv_cmt_no(chk[i]);
						list.add(vo);
					}
					
					aDAO.multiDeleteReview(list);
				}
				
				if(str_category == 2) {
					List<V1_TourComment> list = new ArrayList<V1_TourComment>();
					
					for(int i=0; i< chk.length; i++) {
						V1_TourComment vo = new V1_TourComment();
						vo.setTour_cmt_no(chk[i]);
						list.add(vo);
					}
					
					aDAO.multiDeleteTourReview(list);
				}
				
				model.addAttribute("url", request.getHeader("REFERER"));
				model.addAttribute("message", "후기 삭제가 완료 되었습니다.");
				model.addAttribute("title", "삭제 완료");
				
				return "v1_alert";
			}
			else {
				return "redirect:admin_rev_management.do";
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:admin_rev_management.do";
		}
		
		
	}
	
	@RequestMapping(value="/sendemail.do", method=RequestMethod.POST)
	public String sendEmail(HttpServletRequest request, Model model, 
			@RequestParam("email") String email, 
			@RequestParam("title") String title, 
			@RequestParam("text") String text) {
		
		try {
			V1_EmailConfigure.sendEmail(email.toString(), title, text);
			
			model.addAttribute("message", "메일을 보냈습니다.");
			model.addAttribute("url", request.getHeader("REFERER"));
			model.addAttribute("title", "이메일 전송 완료");
			
			return "v1_alert";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "메일을 전송을 실패했습니다.");
			model.addAttribute("url", request.getHeader("REFERER"));
			model.addAttribute("title", "이메일 전송 실패");
			
			return "v1_alert";
		}
		
	}
	
	
}
