package com.mbs.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mbs.mvc.dao.V1_AdminReservationDAO;
import com.mbs.mvc.dao.V1_AdminUserDAO;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_WeekCount;

@RestController
public class V1_Ajax_AdminController {

	@Autowired
	private V1_AdminUserDAO auDAO = null;
	
	@Autowired
	private V1_AdminReservationDAO arDAO = null;
	
	
	@RequestMapping(value="/ajax_adminuserdelete.do", method= {RequestMethod.GET,RequestMethod.POST})
	public int ajaxadminuserdelete(@RequestParam("mb_id")String mb_id) {
		int ret = auDAO.deleteUser(mb_id);
		return ret;
	}
	
	@RequestMapping(value="/ajax_adminuserdelete1.do", method= {RequestMethod.GET,RequestMethod.POST})
	public int ajaxadminuserdelete1(@RequestParam("mb_id")String mb_id) {
		int ret = auDAO.deleteUser1(mb_id);
		return ret;
	}
	
	@RequestMapping(value="/ajax_searchreservation.do",method= {RequestMethod.GET,RequestMethod.POST})
	public List<V1_Reservation> ajaxsearchreview(@RequestParam("name")String name) {
		List<V1_Reservation> list = new ArrayList<V1_Reservation>();
		list = arDAO.selectReservationOne(name);
		return list;
	}
	
	@RequestMapping(value="/ajax_weekreservation.do",method = {RequestMethod.GET,RequestMethod.POST})
	public V1_WeekCount ajaxweekreservation(@RequestParam("name")String name,V1_WeekCount wvo) {
		wvo = arDAO.selectWeekReservationCount(name);
		return wvo;
	}
}
