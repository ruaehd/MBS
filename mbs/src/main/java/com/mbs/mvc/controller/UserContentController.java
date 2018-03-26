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

import com.mbs.mvc.dao.V1_UserContentDAO;
import com.mbs.mvc.vo.V1_Member;
import com.mbs.mvc.vo.V1_Menu;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_StrImg;

@Controller
public class UserContentController {
	
	@Autowired private V1_UserContentDAO ucDAO = null;
	
	/*
	 * 점포 정보
	 */
	@RequestMapping(value="/usr_content.do", method = RequestMethod.GET)
	public String userContent(Model model) {
		
		V1_Store vo = ucDAO.selectStoreOne(1234567890);
		List<V1_Menu> mlist = ucDAO.selectMenuList(1234567890);
		int cnt = ucDAO.selectImgCount(1234567890);
		
		model.addAttribute("cnt", cnt);
		
		model.addAttribute("vo", vo);
		model.addAttribute("mlist", mlist);
		return "v1_usr_content";
	}
	
	/*
	 * 예약하기
	 */
	@RequestMapping(value="/usr_content_pay.do", method = RequestMethod.GET)
	public String userContentPay(Model model) {
		
		V1_Reservation rvo = new V1_Reservation();
		
		int cnt = ucDAO.selectImgCount(1234567890);
		V1_Store vo = ucDAO.selectStoreOne(1234567890);
		V1_Member mvo = ucDAO.selectMemberOne("user");
		List<V1_Menu> mlist = ucDAO.selectMenuList(1234567890);
		
		model.addAttribute("mlist", mlist);
		model.addAttribute("cnt", cnt);
		model.addAttribute("vo", vo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("rvo", rvo);
		return "v1_usr_content_pay";
	}
	
	@RequestMapping(value="/usr_content_pay.do", method = RequestMethod.POST)
	public String userContentPay(@ModelAttribute("rvo") V1_Reservation vo) {
		
		vo.setRsv_sub_id("user");
		vo.setStr_number(1234567890);
		int ret = ucDAO.insertReservation(vo);
		if(ret!=0) {
			return "redirect:usr_resrv_list.do";
		}
		return "redirect:usr_content_pay.do";
	}
	
	/*
	 * 이미지 로딩
	 */
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
	
	/*
	 * 예약 리스트
	 */
	@RequestMapping(value="/usr_resrv_list.do", method = RequestMethod.GET)
	public String userReservationList(Model model) {
		return "v1_usr_resrv_list";
	}
}
