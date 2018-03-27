package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_Member;
import com.mbs.mvc.vo.V1_Menu;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_StrImg;

@Service
public class V1_UserContentDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public V1_Store selectStoreOne(int str_no) {
		return sqlsession.selectOne("V1_Store.selectStoreOne", str_no);
	}
	
	public List<V1_Menu> selectMenuList(int str_no){
		return sqlsession.selectList("V1_Store.selectMenuList", str_no);
	}
	
	public V1_StrImg selectBlobImg(V1_StrImg obj){
		return sqlsession.selectOne("V1_Store.selectBlobImg", obj);
	}
	
	public int insertImgs(V1_StrImg vo) {
		return sqlsession.insert("V1_Store.insertImgs", vo);
	}
	
	public int selectImgCount(int str_no) {
		return sqlsession.selectOne("V1_Store.selectImgCount", str_no);		
	}
	
	public V1_Member selectMemberOne(String mb_id) {
		return sqlsession.selectOne("V1_Store.selectMemberOne", mb_id);
	}
	
	public int insertReservation(V1_Reservation vo) {
		return sqlsession.insert("V1_Store.insertReservation", vo);
	}
	
	public List<V1_Reservation> selectRsvList(String mb_id){
		return sqlsession.selectList("V1_Store.selectRsvList", mb_id);
	}
	
	public V1_Reservation selectRsvOne(int rsv_no) {
		return sqlsession.selectOne("V1_Store.selectRsvOne", rsv_no);
	}
}
