package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbs.mvc.dao.Admin_QNADAO;
import com.mbs.mvc.vo.QNAVO;
import com.mbs.mvc.vo.Qst_AnswerVO;

@Controller
public class Admin_QNAController {
	@Autowired
	private Admin_QNADAO aqDAO = null;
	
	@RequestMapping(value="/admin_qna.do", method= RequestMethod.GET)
	public String admin_qna(Model model) {
		Qst_AnswerVO vo = new Qst_AnswerVO();
		List<QNAVO> list = aqDAO.Admin_QnaList();
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		
		return "admin_qna";
	}
	
	@RequestMapping(value="/admin_qna.do", method= RequestMethod.POST)
	public String admin_qna(@ModelAttribute("vo") Qst_AnswerVO vo) {
		aqDAO.Admin_Answer(vo);
		return "redirect:admin_qna.do";
	}
	
	@RequestMapping(value="/admin_qna_update.do", method= RequestMethod.POST)
	public String admin_qna_update(@ModelAttribute("vo") Qst_AnswerVO vo) {
		aqDAO.qst_answer_update(vo);
		return "redirect:admin_qna.do";
	}
}
