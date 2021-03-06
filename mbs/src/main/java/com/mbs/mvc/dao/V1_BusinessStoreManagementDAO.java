package com.mbs.mvc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Reply;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_RsvMenu;
import com.mbs.mvc.vo.V1_Store;

@Service
public class V1_BusinessStoreManagementDAO {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public List<V1_Store> selectMyStoreList(V1_Store vo){
		return sqlsession.selectList("V1_BizStrMgt.selectMyStoreList", vo);
	}
	
	public List<V1_Reservation> selectBizRsvList(V1_Reservation vo){
		return sqlsession.selectList("V1_BizStrMgt.selectBizRsvList", vo);
	}
	
	public Map<String, Object> countBizRsvTot(V1_Reservation vo) {
		return sqlsession.selectOne("V1_BizStrMgt.countBizRsvTot", vo);
	}
	
	public V1_Reservation selectBizRsvOne(int rsv_no) {
		return sqlsession.selectOne("V1_BizStrMgt.selectBizRsvOne", rsv_no);
	}

	public List<V1_RsvMenu> selectBizRsvMenuList(int rsv_no) {
		return sqlsession.selectList("V1_BizStrMgt.selectBizRsvMenuList", rsv_no);
	}
	
	public List<V1_Comment> selectBizCmtiewList(V1_Comment vo){
		return sqlsession.selectList("V1_BizStrMgt.selectBizCmtiewList", vo);
	}
	
	public int updateStoreChk(V1_Store vo) {
		return sqlsession.update("V1_BizStrMgt.updateStoreChk", vo);
	}
	
	public int insertReply(V1_Reply vo) {
		return sqlsession.insert("V1_BizStrMgt.insertReply", vo);
	}
	
	public V1_Comment selectBizCmtOne(int rsv_cmt_no) {
		return sqlsession.selectOne("V1_BizStrMgt.selectBizCmtOne", rsv_cmt_no);
	}
	
	public V1_Comment selectBizRepOne(int rsv_cmt_no) {
		return sqlsession.selectOne("V1_BizStrMgt.selectBizRepOne", rsv_cmt_no);
	}
	
	public int updateReply(V1_Reply vo) {
		return sqlsession.update("V1_BizStrMgt.updateReply", vo);
	}
	
	public int deleteReply(int rep_no) {
		return sqlsession.update("V1_BizStrMgt.deleteReply", rep_no);
	}
	
	public int selectBizCmtCount(V1_Comment vo) {
		return sqlsession.selectOne("V1_BizStrMgt.selectBizCmtCount", vo);
		
	}
	
	public int selectMyStoreCount(V1_Store vo) {
		return sqlsession.selectOne("V1_BizStrMgt.selectMyStoreCount", vo);
	}
	
}
