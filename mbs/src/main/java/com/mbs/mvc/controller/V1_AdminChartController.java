package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbs.mvc.dao.V1_AdminChartDAO;
import com.mbs.mvc.dao.V1_AdminReservationDAO;
import com.mbs.mvc.dao.V1_AdminUserDAO;
import com.mbs.mvc.vo.V1_AdminStoreChartVO;
import com.mbs.mvc.vo.V1_Admin_SearchVO;
import com.mbs.mvc.vo.V1_AgeVO;
import com.mbs.mvc.vo.V1_MonthChart;

@Controller
public class V1_AdminChartController {
	
	@Autowired
	private V1_AdminChartDAO acDAO = null;
	
	@Autowired
	private V1_AdminUserDAO auDAO = null;
	
	@Autowired
	private V1_AdminReservationDAO arDAO = null;
	
	@RequestMapping(value="/admin_memberchart.do",method=RequestMethod.GET)
	public String adminmemberchart(Model model,V1_Admin_SearchVO asvo) {
		V1_AgeVO vo = acDAO.selectOldManCount();
		V1_AgeVO vo1 = acDAO.selectOldWomanCount();
		List<V1_MonthChart> list = acDAO.selectMonthChartCount();
		asvo.setGubun(1);
		asvo.setSearchval("");
		int memcount = auDAO.selectSearchNameUserCount(asvo);
		model.addAttribute("mvo", vo);
		model.addAttribute("wvo", vo1);
		model.addAttribute("mlist", list);
		model.addAttribute("mcount", memcount);
		return "v1_admin_member_chart";
	}
	
	@RequestMapping(value="/admin_storechart.do",method=RequestMethod.GET)
	public String adminstorechart(Model model) {
		List<V1_MonthChart> list = acDAO.selectStoreMonthChartCount();
		V1_AdminStoreChartVO vo1 = acDAO.selectPriceCount1();
		V1_AdminStoreChartVO vo2 = acDAO.selectPriceCount2();
		int avg = acDAO.selectStorePrice();
		int count = acDAO.selectStoreCount1();
		String point = acDAO.selectStorePoint();
		int gubun = 1;
		int traval = acDAO.selectStoreCount(gubun);
		gubun = 2;
		int food = acDAO.selectStoreCount(gubun);
		
		model.addAttribute("count", count);
		model.addAttribute("avg", avg);
		model.addAttribute("point", point);
		model.addAttribute("vo1", vo1);
		model.addAttribute("vo2", vo2);
		model.addAttribute("traval", traval);
		model.addAttribute("food", food);
		model.addAttribute("slist", list);
		return "v1_admin_store_chart";
	}
	
	@RequestMapping(value="/admin_reservationchart.do",method=RequestMethod.GET)
	public String adminreservationchart(Model model) {
		int allcount = arDAO.selectReservationAllCount();
		int nowcount = arDAO.selectReservationNowCount();
		List<V1_MonthChart> list = arDAO.selectReservationMonth();
		model.addAttribute("rlist", list);
		model.addAttribute("allcount", allcount);
		model.addAttribute("nowcount", nowcount);
		return "v1_admin_reservation_chart";
	}
}
