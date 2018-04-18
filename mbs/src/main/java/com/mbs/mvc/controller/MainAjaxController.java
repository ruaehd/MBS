package com.mbs.mvc.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mbs.mvc.vo.Main_SearchVO;

@RestController
public class MainAjaxController {

	@RequestMapping(value="ajax_map_main_search" , method = {RequestMethod.GET,RequestMethod.POST})
	public Main_SearchVO mainsearch(
			
			@RequestParam("category_food") String food,
			@RequestParam("category_travel") String travel,
			@RequestParam("addr") String addr,
			@RequestParam("date") String date,
			@RequestParam("price_start") int p_start,
			@RequestParam("price_end") int p_end) {
		return null;
	}
	
}
