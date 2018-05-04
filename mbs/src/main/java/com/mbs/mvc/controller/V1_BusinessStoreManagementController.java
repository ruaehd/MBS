package com.mbs.mvc.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.V1_BusinessStoreManagementDAO;
import com.mbs.mvc.dao.V1_ReservationDAO;
import com.mbs.mvc.vo.V1_Comment;
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
		
		String id = (String)httpSession.getAttribute("_id");
		
		V1_Store vo = new V1_Store();
		
		vo.setMb_id(id);
		vo.setPage((page-1)*6);
		vo.setText(text);
		
		List<V1_Store> list = bsmDAO.selectMyStoreList(vo);
		
		model.addAttribute("list", list);
		return "v1_biz_str_management";
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
	
	
	@RequestMapping(value="biz_rsv_info.do", method = RequestMethod.GET)
	public String BizRsvInformation(Model model, @RequestParam("rsv_no") int rsv_no) {
		
		V1_Reservation rvo = bsmDAO.selectBizRsvOne(rsv_no);
		List<V1_RsvMenu> rmlist = bsmDAO.selectBizRsvMenuList(rsv_no);
		
		model.addAttribute("rmlist", rmlist);
		model.addAttribute("vo", rvo);
		
		return "v1_biz_rsv_info";
	}
	
	@RequestMapping(value="biz_cmt_list.do", method = RequestMethod.GET)
	public String BizCommentList(Model model, 
			@RequestParam("str_number") int str_number,
			@RequestParam(value="text", defaultValue="") String text,
			@RequestParam(value="type", defaultValue="rsv_cmt_content") String type,
			@RequestParam(value="page", defaultValue="1") int page) {
		
		V1_Comment vo = new V1_Comment();
		vo.setStr_number(str_number);
		vo.setText(text);
		vo.setType(type);
		vo.setPage((page-1)*10);
		
		
		List<V1_Comment> list = bsmDAO.selectBizCmtiewList(vo);
		
		model.addAttribute("list", list);
		return "v1_biz_cmt_list";
	}
	
	@RequestMapping(value="biz_operate_convert.do", method = RequestMethod.GET)
	public String BizOperateConvert(Model model, HttpServletRequest request,
			@RequestParam("str_number") int str_number,
			@RequestParam("str_delete") int str_delete
			) {
		
		V1_Store vo = new V1_Store();
		vo.setStr_number(str_number);
		vo.setStr_delete(str_delete);
		
		bsmDAO.updateStoreChk(vo);
		
		model.addAttribute("url", request.getHeader("REFERER"));
		model.addAttribute("message", "정상적으로 처리 되었습니다.");
		model.addAttribute("title", "처리 완료");
		
		return "v1_alert";
	}
	
}