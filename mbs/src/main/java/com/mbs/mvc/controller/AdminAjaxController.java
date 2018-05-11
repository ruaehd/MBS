package com.mbs.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mbs.mvc.dao.Admin_QNADAO;
import com.mbs.mvc.vo.Qst_AnswerVO;

@RestController
public class AdminAjaxController {
	@Autowired
	private Admin_QNADAO aqDAO = null;
	
	@RequestMapping(value = "/ajax_qst_answer.do", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody Qst_AnswerVO ajax_qst_answer(@RequestParam(value="qst_no")int qst_no) {
		Qst_AnswerVO vo1 = aqDAO.qst_answer(qst_no);
		return vo1;
	}
}
