package com.mbs.mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbs.mvc.dao.V1_BizMemDAO;
import com.mbs.mvc.vo.V1_BizJoin;

@Controller
public class V1_BizUser_Controller {
	
	@Autowired
	private V1_BizMemDAO bmDAO = null;
	
	@RequestMapping(value="/getBizImg.do",method = {RequestMethod.GET,RequestMethod.POST})
	public ResponseEntity<byte[]> getBlobImg(
			@RequestParam(value="number") String number,
			@RequestParam(value="no",defaultValue="0") int no,
			HttpServletRequest request,V1_BizJoin vo) {
		vo.setCompany_num(number);
		vo.setStr_img_idx(no);
		Map<String,Object> map= bmDAO.selectImgOne(vo);
		byte[] imgData = null;
		imgData = (byte[]) map.get("str_image");
		try {
			final HttpHeaders headers = new HttpHeaders();
			headers.setContentType(org.springframework.http.MediaType.IMAGE_JPEG);
			return new ResponseEntity<byte[]>(imgData, headers,HttpStatus.OK);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@RequestMapping(value="/biz_stedit.do",method=RequestMethod.GET)
	public String bizstedit(Model model,@RequestParam("no")int no) {
		V1_BizJoin vo = bmDAO.selectStoreOne(no);
		int idx = bmDAO.selectImgCount(no);
		List<V1_BizJoin> mlist = bmDAO.selectMenuCount(no);
		model.addAttribute("vo", vo);
		model.addAttribute("idx", idx);
		model.addAttribute("mlist", mlist);
		return "v1_biz_stedit";
	}

	@RequestMapping(value="/biz_join.do",method=RequestMethod.GET)
	public String businessjoin(Model model,V1_BizJoin vo) {
		model.addAttribute("vo", vo);
		return "v1_biz_join";
	}
	
	
	@RequestMapping(value="/biz_join.do",method=RequestMethod.POST)
	public String businessjoin(@ModelAttribute("vo")V1_BizJoin vo,
			@RequestParam("aaa")String[] aaa,
			@RequestParam("bbb")int[] bbb,
			MultipartHttpServletRequest request,
			HttpSession httpsession) throws IOException {
		
		vo.setCeo_name((String)httpsession.getAttribute("Mem_Id"));
		Map<String, MultipartFile> map = request.getFileMap();
		List<String> keys = new ArrayList<String>();
		
		// store 등록 sql
		MultipartFile file = map.get("business_file");
		vo.setFilename(file.getOriginalFilename());
		vo.setFile(file.getBytes());
		bmDAO.insertBizMember(vo);
		bmDAO.updateMemberBiz(vo);
		httpsession.setAttribute("Mem_Grade","2");
		//menu 등록 sql
		for(int k=0;k<aaa.length;k++) {
			vo.setMenu_name(aaa[k]);
			vo.setMenu_price(bbb[k]);
			vo.setMenu_idx(k+1);
			bmDAO.insertBizMenu(vo);
		}
		//img 등록 sql
		    //등록증 제외 for문
			for(int i=0;i<(map.size()-1);i++) {
				MultipartFile timg = map.get("imgs_"+i);
				if(timg != null && !timg.getOriginalFilename().equals("")) {
						keys.add("imgs_"+i);
				}
			}
			for(int j=0;j<keys.size();j++) {
				MultipartFile timg = map.get(keys.get(j));
				vo.setStr_img_idx(j);
				vo.setImgs(timg.getBytes());
				bmDAO.insertBizImage(vo);
			}
			
			return "redirect:biz_join.do";
	}
	@RequestMapping(value="/biz_stedit.do",method=RequestMethod.POST)
	public String businessedit(@ModelAttribute("vo")V1_BizJoin vo,
			@RequestParam("aaa")String[] aaa,
			@RequestParam("bbb")int[] bbb,
			@RequestParam("no")String no,
			MultipartHttpServletRequest request,
			HttpSession httpsession) throws IOException {
		vo.setCompany_num(no);
		vo.setCeo_name((String)httpsession.getAttribute("Mem_Id"));
		Map<String, MultipartFile> map = request.getFileMap();
		List<String> keys = new ArrayList<String>();
		
		// store 등록 sql
		MultipartFile file = map.get("business_file");
		if(file.getOriginalFilename() != "") {
		vo.setFilename(file.getOriginalFilename());
		vo.setFile(file.getBytes());
		bmDAO.updateBizMember(vo);
		}
		//menu 등록 sql
		for(int k=0;k<aaa.length;k++) {
			vo.setMenu_name(aaa[k]);
			vo.setMenu_price(bbb[k]);
			vo.setMenu_idx(k+1);
			bmDAO.updateBizMenu(vo);
		}
		
		//img 등록 sql
		    //등록증 제외 for문
			for(int i=0;i<(map.size()-1);i++) {
				MultipartFile timg = map.get("imgs_"+i);
				if(timg != null && !timg.getOriginalFilename().equals("")) {
						keys.add("imgs_"+i);
				}
			}
			for(int j=0;j<keys.size();j++) {
				MultipartFile timg = map.get(keys.get(j));
				vo.setStr_img_idx(j);
				vo.setImgs(timg.getBytes());
				bmDAO.updateBizImage(vo);
			}
			
			return "redirect:biz_stedit.do?no="+no;
	}
}
