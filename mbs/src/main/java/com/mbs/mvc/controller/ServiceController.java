package com.mbs.mvc.controller;

import java.net.URLEncoder;
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

import com.mbs.mvc.dao.FNADAO;
import com.mbs.mvc.dao.QNADAO;
import com.mbs.mvc.dao.ServiceDAO;
import com.mbs.mvc.vo.FNAVO;
import com.mbs.mvc.vo.NoticeVO;
import com.mbs.mvc.vo.QNAVO;

@Controller
public class ServiceController {
	
	@Autowired
	private ServiceDAO sDAO = null;
	
	@Autowired
	private QNADAO qDAO = null;
	
	@Autowired
	private FNADAO fDAO = null;
	
	@RequestMapping(value="/notice.do", method= RequestMethod.GET)
	public String notice(Model model, @RequestParam(value="page", defaultValue="1") int page1) {
		try {
			int page = (page1-1)*10;
			List<NoticeVO> list = sDAO.selectNoticeList(page);
			model.addAttribute("list", list);
			int totPage = sDAO.selectNoticePage();
			model.addAttribute("totPage", (totPage-1)/10+1);
			return "user_custcenter_notice";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:service_main.do";
		}
		
		
	}
	
	@RequestMapping(value="/notice_content.do", method= RequestMethod.GET)
	public String notice_content(Model model, @RequestParam("ntc_no") int ntc_no) {
		try {
			NoticeVO vo = sDAO.selectNoticeContent(ntc_no);
			int ntc_prev = sDAO.selectNoticePrev(ntc_no);
			int ntc_next = sDAO.selectNoticeNext(ntc_no);
			NoticeVO pvo = sDAO.selectNoticeContent(ntc_prev);
			NoticeVO nvo = sDAO.selectNoticeContent(ntc_next);
			vo.setNtc_content(nl2br(vo.getNtc_content()));
			model.addAttribute("pvo", pvo);
			model.addAttribute("nvo", nvo);
			model.addAttribute("vo", vo);
			model.addAttribute("pno",ntc_prev);
			model.addAttribute("nno",ntc_next);
			return "user_custcenter_notice_content";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:service_main.do";
		}
		
	}
	
	@RequestMapping(value="/qna.do", method= RequestMethod.GET)
	public String qna(Model model) {
		try {
			QNAVO vo = new QNAVO();
			/*int no = qDAO.selectQuestionLastNo();
			vo.setQst_no(no+1);
			System.out.println(vo.getQst_no());*/
			model.addAttribute("vo", vo);
			return "user_custcenter_question";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:service_main.do";
		}
	}
	
	@RequestMapping(value="/qna.do", method= RequestMethod.POST)
	public String qna(Model model, @ModelAttribute("vo") QNAVO vo, MultipartHttpServletRequest request) {
			try {
				MultipartFile tmp = request.getFile("qst_img1");
				if(tmp != null && !tmp.getOriginalFilename().equals("")) {
					vo.setQst_img(tmp.getBytes());
				}
				qDAO.insertQuestion(vo);
				return "redirect:service_main.do";
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return "redirect:qna.do";
			}
	}
	
	@RequestMapping(value="/fna.do", method= RequestMethod.GET)
	public String qna1(Model model, @RequestParam(value = "code", defaultValue="-1") int fna_code, 
			@RequestParam(value = "text", defaultValue="") String text) {
		try {
			if(fna_code == -1) {
				return "redirect:fna.do?code=1&text="+URLEncoder.encode(text,"utf-8");
			}
			FNAVO vo = new FNAVO();
			vo.setFna_code(fna_code);
			vo.setFna_sc_text(text);
			List<FNAVO> list = fDAO.FnaList(vo);
			model.addAttribute("list", list);
			return "user_custcenter_faq";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:service_main.do";
		}
		
	}
	@RequestMapping(value="/service_main.do", method= RequestMethod.GET)
	public String qna2(Model model) {
		try {
			List<NoticeVO> list = sDAO.mainNoticeList();
			List<FNAVO> list1 = fDAO.FnaListMain();
			model.addAttribute("list1", list1);
			model.addAttribute("list", list);
			
			return "user_custcenter_main";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:main.do";
		}

	}
	
	private String nl2br(String str) {
		  str = str.replaceAll("\r\n", "<br>");
		  str = str.replaceAll("\r", "<br>");
		  str = str.replaceAll("\n", "<br>");
		  
		  return str;
	}
	
}