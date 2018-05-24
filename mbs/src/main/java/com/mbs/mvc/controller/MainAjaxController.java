package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mbs.mvc.dao.MainDAO;
import com.mbs.mvc.vo.Main_SearchVO;
import com.mbs.mvc.vo.Map_ListVO;
import com.mbs.mvc.vo.Web_ListVO;

@RestController
public class MainAjaxController {
	
	@Autowired
	private MainDAO maDAO = null;
	
	@RequestMapping(value="/ajax_main_join.do",method = {RequestMethod.GET,RequestMethod.POST})
	public List<Map_ListVO> ajaxmainsearch(
			@RequestParam(value="so",required=false) String so,
			@RequestParam(value="we",required=false) String we,
			@RequestParam(value="no",required=false) String no,
			@RequestParam(value="ea",required=false) String ea,
			Main_SearchVO vo){
			vo.setSo(so);
			vo.setWe(we);
			vo.setNo(no);
			vo.setEa(ea);
			
			List<Map_ListVO> list = maDAO.selectJoinContentList(vo);
			return list;
	}
	
	@RequestMapping(value="/ajax_main_search.do",method = {RequestMethod.GET,RequestMethod.POST})
	public List<Map_ListVO> ajaxmainsearch(
			
			@RequestParam(value="tr",required=false,defaultValue="0") int travel,
			@RequestParam(value="fo",required=false,defaultValue="0") int food,
			@RequestParam(value="date",required=false) String date,
			@RequestParam(value="ps",required=false) int prices,
			@RequestParam(value="pe",required=false) int pricee,
			Main_SearchVO vo
			){
		vo.setCategory(travel+food);
		System.out.println(vo.getCategory());
		vo.setDate(date);
		vo.setPrice_start(prices);
		vo.setPrice_end(pricee);
		
		List<Map_ListVO> list = maDAO.selectContentList(vo);
		return list;
	}
	
	@RequestMapping(value="/ajax_main_dragsearch.do",method = {RequestMethod.GET,RequestMethod.POST})
	public List<Map_ListVO> ajax_main_dragsearch(
			@RequestParam(value="tr",required=false,defaultValue="0") int travel,
			@RequestParam(value="fo",required=false,defaultValue="0") int food,
			@RequestParam(value="date",required=false) String date,
			@RequestParam(value="ps",required=false) int prices,
			@RequestParam(value="pe",required=false) int pricee,
			@RequestParam(value="so",required=false) String so,
			@RequestParam(value="we",required=false) String we,
			@RequestParam(value="no",required=false) String no,
			@RequestParam(value="ea",required=false) String ea,
			Main_SearchVO vo
			){
		vo.setCategory(travel+food);
		System.out.println(vo.getCategory());
		vo.setDate(date);
		vo.setPrice_start(prices);
		vo.setPrice_end(pricee);
		vo.setSo(so);
		vo.setWe(we);
		vo.setNo(no);
		vo.setEa(ea);
		
		List<Map_ListVO> list = maDAO.selectMainDragSearch(vo);
		return list;
	}
	
	@RequestMapping(value="/ajax_web_main_search.do",method = {RequestMethod.GET,RequestMethod.POST})
	public List<Web_ListVO> ajaxwebmainsearch(
			@RequestParam(value="tr",required=false) int travel,
			@RequestParam(value="fo",required=false) int food,
			@RequestParam(value="addr",required=false) String addr,
			@RequestParam(value="date",required=false) String date,
			@RequestParam(value="ps",required=false) int prices,
			@RequestParam(value="pe",required=false) int pricee,
			@RequestParam(value="lat",required=false) String lat,
			@RequestParam(value="lng",required=false) String lng,
			@RequestParam(value="ra",required=false) int ra,
			Main_SearchVO vo){
		try {
		vo.setCategory(travel+food);
		vo.setAddr(addr);
		vo.setDate(date);
		vo.setPrice_start(prices);
		vo.setPrice_end(pricee);
		vo.setLat(lat);
		vo.setLng(lng);
		vo.setRange(ra);
		System.out.println(vo.getRange());
		System.out.println(vo.getCategory());
		List<Web_ListVO> list = maDAO.selectWebContentList(vo);
		return list;
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	
}
