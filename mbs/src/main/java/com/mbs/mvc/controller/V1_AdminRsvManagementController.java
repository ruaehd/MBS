package com.mbs.mvc.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.V1_AdminDAO;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_Store;

@Controller
public class V1_AdminRsvManagementController {
	
	@Autowired V1_AdminDAO aDAO = null;
	
	@RequestMapping(value="/admin_rsv_management.do", method=RequestMethod.GET)
	public String AdminRsvManagement(Model model, @RequestParam(value="rsv_code", defaultValue="-1") int rsv_code, @RequestParam(value="page", defaultValue="1") int page) {
		
		if(rsv_code == -1) {	//menu값이 없을 경우
			return "redirect:admin_rsv_management.do?rsv_code=0";
		}
		
		if(rsv_code == 2) {
			return "redirect:admin_rsv_management.do?rsv_code=3";
		}
		//세션아이디
			
		Map<String, Integer> map = aDAO.countAdminRsvTot();
		Map<String, Integer> map1 = new LinkedHashMap<String, Integer>();
		int tot = Integer.parseInt(String.valueOf(map.get("exp")))
				+Integer.parseInt(String.valueOf(map.get("can")));
		
		map1.put("전체", tot);
		map1.put("이용예정", Integer.parseInt(String.valueOf(map.get("exp"))));
		map1.put("예약취소", Integer.parseInt(String.valueOf(map.get("can"))));
		
		
		V1_Reservation vo = new V1_Reservation();
		vo.setPage((page-1)*10);
		vo.setRsv_code(rsv_code);
		
		List<V1_Reservation> list = aDAO.selectAdminRsvList(vo);
		
		model.addAttribute("map", map1);
		model.addAttribute("list", list);
		
		return"v1_admin_rsv_management";
	}
	
	
	@RequestMapping(value="/admin_rev_management.do", method=RequestMethod.GET)
	public String AdminReviewManagement(Model model, @RequestParam(value="page", defaultValue="1") int page) {
		
		List<V1_Store> list = aDAO.selectStoreList();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		
		for(int i= 0; i<list.size(); i++) {
			map.put(list.get(i).getStr_name(), list.get(i).getStr_number());
		}
		System.out.println("AAAAAAAAA"+map);
		
		
		model.addAttribute("list", list);
		
		return"v1_admin_rev_management";
	}
}
