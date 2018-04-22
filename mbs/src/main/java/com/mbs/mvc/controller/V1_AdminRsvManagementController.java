package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.V1_AdminDAO;
import com.mbs.mvc.vo.V1_Reservation;

@Controller
public class V1_AdminRsvManagementController {
	
	@Autowired V1_AdminDAO aDAO = null;
	
	@RequestMapping(value="/admin_rsv_management.do", method=RequestMethod.GET)
	public String AdminRsvManagement(Model model, @RequestParam(value="page", defaultValue="1") int page) {
		V1_Reservation vo = new V1_Reservation();
		vo.setPage((page-1)*10);
		vo.setRsv_code(1);
		
		List<V1_Reservation> list = aDAO.selectAdminRsvList(vo);
		int tot = aDAO.countAdminRsvTot(vo);
		
		model.addAttribute("tot", (tot-1)/10+1);
		model.addAttribute("list", list);
		
		return"v1_admin_rsv_management";
	}
	
	@RequestMapping(value="/admin_rev_management.do", method=RequestMethod.GET)
	public String AdminReviewManagement(Model model, @RequestParam(value="page", defaultValue="1") int page) {
		V1_Reservation vo = new V1_Reservation();
		vo.setPage((page-1)*10);
		vo.setRsv_code(2);
		
		List<V1_Reservation> list = aDAO.selectAdminRsvList(vo);
		int tot = aDAO.countAdminRsvTot(vo);
		
		model.addAttribute("tot", (tot-1)/10+1);
		model.addAttribute("list", list);
		
		return"v1_admin_rev_management";
	}
	
	@RequestMapping(value="/admin_can_management.do", method=RequestMethod.GET)
	public String AdminCancelManagement(Model model, @RequestParam(value="page", defaultValue="1") int page) {
		V1_Reservation vo = new V1_Reservation();
		vo.setPage((page-1)*10);
		vo.setRsv_code(3);
		
		List<V1_Reservation> list = aDAO.selectAdminRsvList(vo);
		int tot = aDAO.countAdminRsvTot(vo);
		
		model.addAttribute("tot", (tot-1)/10+1);
		model.addAttribute("list", list);
		
		return"v1_admin_can_management";
	}
}
