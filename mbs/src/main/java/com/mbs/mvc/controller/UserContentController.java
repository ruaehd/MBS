package com.mbs.mvc.controller;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mbs.mvc.dao.V1_UserContentDAO;
import com.mbs.mvc.vo.V1_Menu;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_StrImg;

@Controller
public class UserContentController {
	
	@Autowired private V1_UserContentDAO ucDAO = null;
	
	@RequestMapping(value="/usr_content.do", method = RequestMethod.GET)
	public String userContent(Model model) throws UnsupportedEncodingException {
		
		V1_Store vo = ucDAO.selectStoreOne(1234567890);
		List<V1_Menu> mlist = ucDAO.selectMenuList(1234567890);
		int cnt = ucDAO.selectImgCount(1234567890);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("vo", vo);
		model.addAttribute("mlist", mlist);
		return "v1_usr_content";
	}
	
	
	@RequestMapping(value="/usr_content_pay.do", method = RequestMethod.GET)
	public String userContentPay(Model model) {
		
		int cnt = ucDAO.selectImgCount(1234567890);
		V1_Store vo = ucDAO.selectStoreOne(1234567890);
		List<V1_Menu> mlist = ucDAO.selectMenuList(1234567890);
		
		model.addAttribute("mlist", mlist);
		model.addAttribute("cnt", cnt);
		model.addAttribute("vo", vo);
		return "v1_usr_content_pay";
	}
	
	@SuppressWarnings("finally")
	@RequestMapping(value = "/get_blob_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getBlobImg(@RequestParam("idx") int idx, HttpServletRequest request) {
		byte[] imgs = null;
		//헤드 => 이진데이터를 어떠한 type으로 표현할 것인가?
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);
		try {
			//기본값으로 default.jpg이미지를 보관함.
			InputStream is= request.getSession().getServletContext().getResourceAsStream("/resources/imgs/default.png");
			imgs = IOUtils.toByteArray(is);	
			
			V1_StrImg obj = new V1_StrImg();
			obj.setStr_number(1234567890);
			obj.setStr_image_idx(idx);
			
			//DAO로 코드번호를 전달하면 이미지를 읽어서 vo에 저장해서 리턴 
			V1_StrImg vo = ucDAO.selectBlobImg(obj);
				
			if(vo.getStr_image() != null) {
	 			imgs = vo.getStr_image();
			}
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
