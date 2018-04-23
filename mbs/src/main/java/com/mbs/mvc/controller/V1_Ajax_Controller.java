package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mbs.mvc.dao.V1_ReviewDAO;
import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Store;

@RestController
public class V1_Ajax_Controller {

	@Autowired private V1_ReviewDAO reDAO = null;
	
	@RequestMapping(value="/ajax_reviewlist.do", method = RequestMethod.GET)
	public List<V1_Comment> reviewlist(@RequestParam(value="page", defaultValue="1") int page, @RequestParam("str_number") int str_number) {
		
		//파람
		V1_Store vo1 = new V1_Store();
		vo1.setPage((page-1)*5);
		vo1.setStr_number(str_number);
		
		List<V1_Comment> clist = reDAO.selectCmtList(vo1);
		
		return clist;
	}
}
