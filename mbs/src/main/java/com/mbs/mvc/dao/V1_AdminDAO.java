package com.mbs.mvc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_Store;

@Service
public class V1_AdminDAO {
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public List<V1_Reservation> selectAdminRsvList(V1_Reservation vo){
		return sqlsession.selectList("V1_AdminRsvMgt.selectAdminRsvList", vo);
	}
	
	public Map<String, Object> countAdminRsvTot(V1_Reservation vo) {
		return sqlsession.selectOne("V1_AdminRsvMgt.countAdminRsvTot", vo);
	}
	
	public List<V1_Store> selectStoreList(V1_Store vo){
		return sqlsession.selectList("V1_AdminRsvMgt.selectStoreList", vo);
	}
	
	public List<V1_Comment> selectReviewList(V1_Comment vo){
		return sqlsession.selectList("V1_AdminRsvMgt.selectReviewList", vo);
	}
	
	public int multiDeleteReview(List<V1_Comment> list) {
		return sqlsession.update("V1_AdminRsvMgt.multiDeleteReview", list);
	}
	
}
