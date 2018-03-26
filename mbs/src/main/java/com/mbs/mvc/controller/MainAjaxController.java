package com.mbs.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mbs.mvc.dao.MainDAO;
import com.mbs.mvc.vo.Main_SearchVO;
import com.mbs.mvc.vo.Map_ListVO;

@RestController
public class MainAjaxController {
	
	@Autowired
	private MainDAO maDAO = null;
	
	@RequestMapping(value="/ajax_main_search.do",method = {RequestMethod.GET,RequestMethod.POST})
	public List<Map_ListVO> ajaxmainsearch(
			
			@RequestParam(value="tr",required=false) String travel,
			@RequestParam(value="fo",required=false) String food,
			@RequestParam(value="addr",required=false) String addr,
			@RequestParam(value="date",required=false) String date,
			@RequestParam(value="ps",required=false) String prices,
			@RequestParam(value="pe",required=false) String pricee
			){
		Main_SearchVO vo = new Main_SearchVO();
		
		int tr = Integer.parseInt(travel);
		int fo = Integer.parseInt(food);
		vo.setCategory(tr+fo);
		vo.setAddr(addr);
		vo.setDate(date);
		int ps = Integer.parseInt(prices);
		int pe = Integer.parseInt(pricee);
		vo.setPrice_start(ps);
		vo.setPrice_end(pe);
		
		List<Map_ListVO> list = maDAO.selectContentList(vo);
		return list;
	}
	
	@RequestMapping(value="/ajax_main_search.do",method = {RequestMethod.GET,RequestMethod.POST})
	public ResponseEntity<byte[]> getBlobImg(@RequestParam("number") String number, HttpServletRequest request) {
		
	}
}
