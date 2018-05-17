package com.mbs.mvc.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.Admin_QNADAO;
import com.mbs.mvc.vo.NoticeVO;
import com.mbs.mvc.vo.QNAVO;
import com.mbs.mvc.vo.Qst_AnswerVO;

@Controller
public class Admin_QNAController {
	@Autowired
	private Admin_QNADAO aqDAO = null;
	
	@RequestMapping(value = "/qnaImg.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> selectEventImg(@RequestParam("qst_no") int qst_no, HttpServletRequest request){
		QNAVO vo = aqDAO.QnaImg(qst_no);
		byte[] qstImg = null;
		
		try {
			InputStream is= request.getSession().getServletContext().getResourceAsStream("/resources/imgs/default.jpg");
			qstImg = IOUtils.toByteArray(is);	
				if(vo.getQst_img() != null) {
					qstImg = vo.getQst_img();
				}
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			return new ResponseEntity<byte[]>(qstImg,headers,HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@RequestMapping(value="/admin_qna.do", method= RequestMethod.GET)
	public String admin_qna(Model model, @RequestParam(value = "sel_code", defaultValue="유형") String sel_code, 
			@RequestParam(value = "type", defaultValue="all") String type, @RequestParam(value = "text", defaultValue="") String text, 
			@RequestParam(value = "sel_type", defaultValue="all") String sel_type, @RequestParam(value = "page", defaultValue="1") int page1) {
		if(page1 == -1) {
			return "redirect:admin_qna.do?type=all&text=&sel_type=all&page=1";
		}
		
		Qst_AnswerVO vo = new Qst_AnswerVO();
		QNAVO vo1 = new QNAVO();
		int page = (page1-1)*10;
		vo1.setQst_page(page);
		vo1.setQst_sel_type(sel_type);
		vo1.setQst_code(sel_code);
		vo1.setQst_type(type);
		vo1.setQst_text(text);
		List<QNAVO> list = aqDAO.Admin_QnaList(vo1);
		
		for(QNAVO tmp:list) {
			tmp.setQst_content( nl2br(tmp.getQst_content()) );
		}
		
		int totPage = aqDAO.QnaTotPage(vo1);
		model.addAttribute("totPage", (totPage-1)/10+1);
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
	
	private String nl2br(String str) {
		  str = str.replaceAll("\r\n", "<br>");
		  str = str.replaceAll("\r", "<br>");
		  str = str.replaceAll("\n", "<br>");
		  
		  return str;
	}
}
