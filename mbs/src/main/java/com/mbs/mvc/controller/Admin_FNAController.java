package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.Admin_FNADAO;
import com.mbs.mvc.vo.FNAVO;

@Controller
public class Admin_FNAController {
	
	@Autowired
	private Admin_FNADAO afDAO = null;
	
	@RequestMapping(value="/fna_update.do", method= RequestMethod.POST)
	public String updateNotice(@ModelAttribute("vo") FNAVO vo) {
		afDAO.FnaUpdate(vo);
		return "redirect:admin_fna.do";
	}
	
	@RequestMapping(value="/fna_delete.do", method= RequestMethod.GET)
	public String notice_delete(@ModelAttribute("fna_no")int fna_no, @ModelAttribute("fna_delete")int fna_delete) {
		FNAVO vo = new FNAVO();
		vo.setFna_no(fna_no);
		if (fna_delete == 0) {
			vo.setFna_delete(1);
		}
		else if (fna_delete == 1) {
			vo.setFna_delete(0);
		}
		afDAO.FnaDelete(vo);
		return "redirect:admin_fna.do";
	}
	
	@RequestMapping(value="/admin_fna.do", method= RequestMethod.GET)
	public String admin_fna(Model model, @RequestParam(value = "sel_code", defaultValue="0") int sel_code, 
			@RequestParam(value = "sel_type", defaultValue="2") int sel_type, @RequestParam(value = "type", defaultValue="all") String type, 
			@RequestParam(value = "text", defaultValue="") String text, @RequestParam(value="page", defaultValue="1") int page1) {
		int page = (page1-1)*10;
		FNAVO vo = new FNAVO();
		vo.setFna_page(page);
		vo.setFna_sc_type(type);
		vo.setFna_sc_text(text);
		vo.setFna_delete(sel_type);
		vo.setFna_code(sel_code);
		List<FNAVO> list = afDAO.FnaList(vo);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		//int totPage = afDAO.FnaPage(vo);
		//model.addAttribute("totPage", (totPage-1)/10+1);
		return "admin_fna";
	}
	
	@RequestMapping(value="/admin_fna.do", method= RequestMethod.POST)
	public String admin_fna(@ModelAttribute("vo") FNAVO vo) {
		vo.setMb_id("admin");
		afDAO.FnaInsert(vo);
		return "redirect:admin_fna.do";
	}
	
	
}
