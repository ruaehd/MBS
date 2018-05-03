package com.mbs.mvc.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.mbs.mvc.dao.V1_ReviewDAO;
import com.mbs.mvc.dao.V1_UserContentDAO;
import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Member;
import com.mbs.mvc.vo.V1_Menu;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_StrImg;
import com.mbs.mvc.vo.V1_TourComment;

@Controller
public class V1_UserContentController {
	
	@Autowired private V1_UserContentDAO ucDAO = null;
	@Autowired private V1_ReviewDAO reDAO = null;
	/*
	 * 점포 정보
	 */
	@RequestMapping(value="/usr_content.do", method = RequestMethod.GET)
	public String userContent(Model model, 
			@RequestParam(value="page", defaultValue="1") int page, 
			@RequestParam("str_number") int str_number,
			HttpSession httpSession) {
		
		httpSession.setAttribute("_gr",1);
		httpSession.setAttribute("_id", "shop1");
		
		//파람
		V1_Store vo = ucDAO.selectStoreOne(str_number);
		int cnt = ucDAO.selectImgCount(str_number);
		
		if(vo.getStr_category()==1) {
			
			List<V1_Menu> mlist = ucDAO.selectMenuList(str_number);
			int tot = reDAO.selectReviewcCnt(str_number);
			List<V1_Comment> ctlist = reDAO.selectCmtTotList(str_number);
			
			double sum = 0;
			double taste = 0;
			double service = 0;
			double price = 0;
			double avg = 0;
						
			for(V1_Comment tmp : ctlist) {
				sum += tmp.getRsv_cmt_point();
				
				if(tmp.getRsv_cmt_taste().equals("맛은 별로에요")) {
					taste = taste + 1/(double)3;
				}
				else if(tmp.getRsv_cmt_taste().equals("맛은 보통이에요")) {
					taste = taste + 2/(double)3;
				}
				else if(tmp.getRsv_cmt_taste().equals("맛있어요")) {
					taste = taste + 3/(double)3;
				}
				
				if(tmp.getRsv_cmt_service().equals("서비스는 불친절해요")) {
					service = service + 1/(double)3;
				}
				else if(tmp.getRsv_cmt_service().equals("서비스는 보통이에요")) {
					service = service + 2/(double)3;
				}
				else if(tmp.getRsv_cmt_service().equals("서비스는 친절해요")) {
					service = service + 3/(double)3;
				}
				
				if(tmp.getRsv_cmt_price().equals("가격은 비싸요")) {
					price = price + 1/(double)3;
				}
				else if(tmp.getRsv_cmt_price().equals("가격은 적절해요")) {
					price = price + 2/(double)3;
				}
				else if(tmp.getRsv_cmt_price().equals("가격은 저렴해요")) {
					price = price + 3/(double)3;
				}
			}
			
			if(tot != 0) {
				avg = Math.round(sum/tot);
				taste = Math.round(taste/tot*100d)/100d;
				service = Math.round(service/tot*100d)/100d;
				price = Math.round(price/tot*100d)/100d;
			}
			
			model.addAttribute("vo", vo);	
			model.addAttribute("cnt", cnt-1);
			model.addAttribute("mlist", mlist);
			model.addAttribute("avg", avg);
			model.addAttribute("taste", taste);
			model.addAttribute("service", service);
			model.addAttribute("price", price);
			model.addAttribute("recnt", tot);
			model.addAttribute("totPage", (tot-1)/5+1);
			
			return "v1_usr_content";
		}
		else {
			
			int tot = reDAO.selectTourReviewcCnt(str_number);
			List<V1_TourComment> list = reDAO.selectTourReviewList(str_number);
			
			int sum=0;
			double avg = 0;
			
			for(V1_TourComment tmp : list) {
				sum += tmp.getTour_cmt_point();
			}
			
			if(tot != 0) {
				avg = Math.round(sum/tot);
			}
			
			
			V1_TourComment vo1 = new V1_TourComment();
			vo1.setStr_number(str_number);
			vo1.setTour_cmt_writer((String)httpSession.getAttribute("_id"));
			
			
			int chk = reDAO.selectTourReviewChk(vo1);
			
			model.addAttribute("vo", vo);	
			model.addAttribute("cnt", cnt);
			model.addAttribute("chk", chk);
			model.addAttribute("recnt", tot);
			model.addAttribute("totPage", (tot-1)/5+1);
			model.addAttribute("avg", avg);
			
			return "v1_usr_tour_content";
		}
	}
	
	/*
	 * 예약하기
	 */
	@RequestMapping(value="/usr_content_pay.do", method = RequestMethod.GET)
	public String userContentPay(Model model, 
			@RequestParam("str_number") int str_number, 
			@RequestParam(value="rsv_id", defaultValue="") String rsv_id,
			HttpSession httpSession,
			HttpServletRequest request) {
		
		V1_Member mvo = new V1_Member();
		
		if((Integer)httpSession.getAttribute("_gr")>1) {	//관리자라면
			mvo = ucDAO.selectMemberOne(rsv_id);
		}
		else {
			String user_id = (String)httpSession.getAttribute("_id");
			mvo = ucDAO.selectMemberOne(user_id);	//관리자가 아니라면
		}
		
		V1_Reservation rvo = new V1_Reservation();
		int cnt = ucDAO.selectImgCount(str_number);
		V1_Store svo = ucDAO.selectStoreOne(str_number);
		
		List<V1_Menu> mlist = ucDAO.selectMenuList(str_number);
		
		String back_url = request.getHeader("REFERER");
		
		model.addAttribute("mlist", mlist);
		model.addAttribute("cnt", cnt);
		model.addAttribute("svo", svo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("rvo", rvo);
		model.addAttribute("url", back_url);
		
		return "v1_usr_content_pay";
	}
	
	
	/*
	 * 이미지 로딩
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/get_blob_img.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getBlobImg(@RequestParam("idx") int idx, HttpServletRequest request, @RequestParam("str_number") int str_number) {
		byte[] imgs = null;
		//헤드 => 이진데이터를 어떠한 type으로 표현할 것인가?
		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);
		try {
			//기본값으로 default.jpg이미지를 보관함.
			InputStream is= request.getSession().getServletContext().getResourceAsStream("/resources/imgs/default.png");
			imgs = IOUtils.toByteArray(is);	
			
			V1_StrImg obj = new V1_StrImg();
			obj.setStr_number(str_number);
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
