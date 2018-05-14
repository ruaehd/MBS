package com.mbs.mvc.controller;

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

import com.mbs.mvc.dao.V1_BusinessStoreManagementDAO;
import com.mbs.mvc.dao.V1_ReservationDAO;
import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Reply;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_RsvMenu;
import com.mbs.mvc.vo.V1_Store;

@Controller
public class V1_BusinessStoreManagementController {
	
	@Autowired private V1_BusinessStoreManagementDAO bsmDAO = null;
	
	@RequestMapping(value="/biz_str_management.do", method = RequestMethod.GET)
	public String BusinessStoreManagement(
			Model model, HttpSession httpSession,
			@RequestParam(value="text", defaultValue="") String text,
			@RequestParam(value="page", defaultValue="1") int page
			) {
		
		try{
			String id = (String)httpSession.getAttribute("Mem_Id");
			
			V1_Store vo = new V1_Store();
			
			vo.setMb_id(id);
			vo.setPage((page-1)*6);
			vo.setText(text);
			
			List<V1_Store> list = bsmDAO.selectMyStoreList(vo);
			int tot = bsmDAO.selectMyStoreCount(vo);
			
			model.addAttribute("list", list);
			model.addAttribute("tot", (tot-1)/6+1);
			
			return "v1_biz_str_management";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "v1_biz_str_management";
		}
		
	}
	
	@RequestMapping(value="biz_rsv_management.do", method = RequestMethod.GET)
	public String BusinessRsvManagement(
			Model model,
			@RequestParam(value="rsv_code", defaultValue="-1") int rsv_code,
			@RequestParam("str_number") int str_number,
			@RequestParam(value="text", defaultValue="") String text,
			@RequestParam(value="type", defaultValue="rsv_no") String type,
			@RequestParam(value="page", defaultValue="1") int page
			) {
		
		try {
			if(rsv_code == -1) {	//menu값이 없을 경우
				return "redirect:biz_rsv_management.do?str_number="+str_number+"&rsv_code=0";
			}
			
			V1_Reservation vo = new V1_Reservation();
			
			vo.setStr_number(str_number);
			vo.setRsv_code(rsv_code);
			vo.setPage((page-1)*10);
			vo.setText(text);
			vo.setType(type);

			List<V1_Reservation> list = bsmDAO.selectBizRsvList(vo);
			
			Map<String, Object> map = bsmDAO.countBizRsvTot(vo);
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

			model.addAttribute("list", list);
			model.addAttribute("map", map1);
			
			return "v1_biz_rsv_management";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "v1_biz_rsv_management";
		}
	}
	
	@RequestMapping(value="biz_rsv_info.do", method = RequestMethod.GET)
	public String BizRsvInformation(Model model, @RequestParam("rsv_no") int rsv_no) {
		
		try {
			V1_Reservation rvo = bsmDAO.selectBizRsvOne(rsv_no);
			List<V1_RsvMenu> rmlist = bsmDAO.selectBizRsvMenuList(rsv_no);
			
			model.addAttribute("rmlist", rmlist);
			model.addAttribute("vo", rvo);
			
			return "v1_biz_rsv_info";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "v1_biz_rsv_info";
		}
		
	}
	
	@RequestMapping(value="biz_cmt_list.do", method = RequestMethod.GET)
	public String BizCommentList(Model model, 
			@RequestParam("str_number") int str_number,
			@RequestParam(value="text", defaultValue="") String text,
			@RequestParam(value="type", defaultValue="rsv_cmt_content") String type,
			@RequestParam(value="page", defaultValue="1") int page) {
		
		try {
			V1_Comment vo = new V1_Comment();
			vo.setStr_number(str_number);
			vo.setText(text);
			vo.setType(type);
			vo.setPage((page-1)*10);
			
			List<V1_Comment> list = bsmDAO.selectBizCmtiewList(vo);
			int tot = bsmDAO.selectBizCmtCount(vo);
			
			
			model.addAttribute("list", list);
			model.addAttribute("tot", (tot-1)/10+1);
			return "v1_biz_cmt_list";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "v1_biz_cmt_list";
		}
		
	}
	
	@RequestMapping(value="biz_operate_convert.do", method = RequestMethod.GET)
	public String BizOperateConvert(Model model, HttpServletRequest request,
			@RequestParam("str_number") int str_number,
			@RequestParam("str_delete") int str_delete) {
		
		try {
			V1_Store vo = new V1_Store();
			vo.setStr_number(str_number);
			vo.setStr_delete(str_delete);
			
			bsmDAO.updateStoreChk(vo);
			
			model.addAttribute("url", request.getHeader("REFERER"));
			model.addAttribute("message", "정상적으로 처리 되었습니다.");
			model.addAttribute("title", "처리 완료");
			
			return "v1_alert";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("url", request.getHeader("REFERER"));
			model.addAttribute("message", "처리가 실패 하였습니다.");
			model.addAttribute("title", "처리 실패");
			return "v1_alert";
		}
		
	}
	
	
	@RequestMapping(value="write_reply.do", method = RequestMethod.GET)
	public String writeReply(Model model, 
			@RequestParam("rsv_cmt_no") int rsv_cmt_no,
			@RequestParam("chk") int chk) {
		
		try{
			if(chk == 0) {
				V1_Comment vo = bsmDAO.selectBizCmtOne(rsv_cmt_no);
				
				model.addAttribute("rvo", new V1_Reply());
				model.addAttribute("vo", vo);
				
				return "v1_biz_reply";
			}
			
			else{
				V1_Comment vo = bsmDAO.selectBizRepOne(rsv_cmt_no);

				V1_Reply rvo = new V1_Reply();
					
				rvo.setRep_content(vo.getRep_content());
				model.addAttribute("rvo", rvo);
				model.addAttribute("vo", vo);
				
				return "v1_biz_edit_reply";
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
			
	@RequestMapping(value="write_reply.do", method = RequestMethod.POST)
	public String writeReply(
			HttpServletRequest request, Model model,
			@ModelAttribute("rvo") V1_Reply vo){
		try{
			bsmDAO.insertReply(vo);
			
			model.addAttribute("message", "리뷰 답글 작성이 완료되었습니다.");
			model.addAttribute("title", "답글 작성 완료");
			
			return "v1_alert_pop";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "리뷰 답글 작성이 실패하였습니다.");
			model.addAttribute("title", "답글 작성 실패");
			
			return "v1_alert_pop";
		}
		
	}
	
	@RequestMapping(value="edit_reply.do", method = RequestMethod.POST)
	public String editReply(
			HttpServletRequest request, Model model,
			@ModelAttribute("rvo") V1_Reply vo){
		
		try {
			bsmDAO.updateReply(vo);
			
			model.addAttribute("message", "리뷰 답글 수정이 완료되었습니다.");
			model.addAttribute("title", "답글 수정 완료");
			
			return "v1_alert_pop";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("message", "리뷰 답글 수정이 실패하였습니다.");
			model.addAttribute("title", "답글 수정 실패");
			
			return "v1_alert_pop";
		}
		
	}
	
	@RequestMapping(value="delete_reply.do", method = RequestMethod.GET)
	public String deleteReply(Model model, 
			@RequestParam("rep_no") int rep_no) {
		
		try{
			bsmDAO.deleteReply(rep_no);
			
			model.addAttribute("message", "리뷰 답글 삭제 완료되었습니다.");
			model.addAttribute("title", "답글 삭제 완료");
			
			return "v1_alert_pop";
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			
			model.addAttribute("message", "리뷰 답글 삭제가 실패되었습니다.");
			model.addAttribute("title", "답글 삭제 실패");
			
			return "v1_alert_pop";
		}
		
	}
	
}
