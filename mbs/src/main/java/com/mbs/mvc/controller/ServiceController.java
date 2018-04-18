package com.mbs.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbs.mvc.dao.QNADAO;
import com.mbs.mvc.dao.ServiceDAO;
import com.mbs.mvc.vo.NoticeVO;
import com.mbs.mvc.vo.QNAVO;

@Controller
public class ServiceController {
	
	@Autowired
	private ServiceDAO sDAO = null;
	
	@Autowired
	private QNADAO qDAO = null;
	
	@RequestMapping(value="/notice.do", method= RequestMethod.GET)
	public String notice(Model model, @RequestParam(value="page", defaultValue="1") int page1) {
		
		int page = (page1-1)*10;
		List<NoticeVO> list = sDAO.selectNoticeList(page);
		model.addAttribute("list", list);
		int totPage = sDAO.selectNoticePage();
		model.addAttribute("totPage", (totPage-1)/10+1);
		
		
		return "user_custcenter_notice";
	}
	
	@RequestMapping(value="/notice_content.do", method= RequestMethod.GET)
	public String notice_content(Model model, @RequestParam("ntc_no") int ntc_no) {
		NoticeVO vo = sDAO.selectNoticeContent(ntc_no);
		NoticeVO pvo = sDAO.selectNoticeContent(ntc_no-1);
		NoticeVO nvo = sDAO.selectNoticeContent(ntc_no+1);
		int ntc_prev = sDAO.selectNoticePrev(ntc_no);
		int ntc_next = sDAO.selectNoticeNext(ntc_no);
		
		model.addAttribute("pvo", pvo);
		model.addAttribute("nvo", nvo);
		model.addAttribute("vo", vo);
		model.addAttribute("pno",ntc_prev);
		model.addAttribute("nno",ntc_next);
		return "user_custcenter_notice_content";
	}
	
	@RequestMapping(value="/qna.do", method= RequestMethod.GET)
	public String qna(Model model) {
		QNAVO vo = new QNAVO();
		
		
		/*int no = qDAO.selectQuestionLastNo();
	
		vo.setQst_no(no+1);
		System.out.println(vo.getQst_no());*/
		model.addAttribute("vo", vo);
		return "user_custcenter_question";
	}
	
	@RequestMapping(value="/qna.do", method= RequestMethod.POST)
	public String qna(Model model, @ModelAttribute("vo") QNAVO vo, MultipartHttpServletRequest request) {
		
	
			try {
				MultipartFile tmp = request.getFile("qst_img1");
				vo.setQst_img(tmp.getBytes());
				qDAO.insertQuestion(vo);
				return "redirect:service_main.do";
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return "redirect:qna.do";
			}
		
		
		
		
	}
	
	@RequestMapping(value="/fna.do", method= RequestMethod.GET)
	public String qna1() {
		return "user_custcenter_faq";
	}
	@RequestMapping(value="/service_main.do", method= RequestMethod.GET)
	public String qna2(Model model) {
		List<NoticeVO> list = sDAO.mainNoticeList();
		model.addAttribute("list", list);
		
		return "user_custcenter_main";
	}
	

	
}

