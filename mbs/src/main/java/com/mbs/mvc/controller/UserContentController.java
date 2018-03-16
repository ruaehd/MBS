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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbs.mvc.dao.V1_UserContentDAO;
import com.mbs.mvc.vo.V1_Menu;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_StrImg;

@Controller
public class UserContentController {
	
	@Autowired private V1_UserContentDAO ucDAO = null;
	
	@RequestMapping(value="/usr_content.do", method = RequestMethod.GET)
	public String userContent(Model model) {
		
		V1_Store vo = ucDAO.selectStoreOne(1234567890);
		List<V1_Menu> list = ucDAO.selectMenuList(1234567890);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return "v1_usr_content";
	}
	
	
	@RequestMapping(value="/usr_content_pay.do", method = RequestMethod.GET)
	public String userContentPay(Model model) {
		
		V1_Store vo = ucDAO.selectStoreOne(1234567890);
		model.addAttribute("vo", vo);
		return "v1_usr_content_pay";
	}
	
	
	@SuppressWarnings("finally")
	@RequestMapping(value = "/get_blob_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getBlobImg(HttpServletRequest request) {
		byte[] imgs = null;
		//헤드 => 이진데이터를 어떠한 type으로 표현할 것인가?
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);
		try {
			//기본값으로 default.jpg이미지를 보관함.
			InputStream is= request.getSession().getServletContext().getResourceAsStream("/resources/imgs/default.png");
			imgs = IOUtils.toByteArray(is);	

			//DAO로 코드번호를 전달하면 이미지를 읽어서 vo에 저장해서 리턴 
			List<V1_StrImg> list = ucDAO.selectBlobImg(1234567890);
			
			if(list != null) {
				
			}
			/*if(vo.getImg1() != null) {
	 			imgs = vo.getImg1();
			}*/
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			ResponseEntity<byte[]> r_data = new ResponseEntity<byte[]>(imgs, header,HttpStatus.OK);
			return r_data;
		}
	}
	
	
}
