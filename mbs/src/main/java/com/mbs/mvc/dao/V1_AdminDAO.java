package com.mbs.mvc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_AdminReview;
import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_TourComment;

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
	
	public List<V1_AdminReview> selectReviewList(V1_Comment vo){
		return sqlsession.selectList("V1_AdminRsvMgt.selectReviewList", vo);
	}
	public List<V1_AdminReview> selectTourReviewList(V1_Comment vo){
		return sqlsession.selectList("V1_AdminRsvMgt.selectTourReviewList", vo);
	}
	
	public int multiDeleteReview(List<V1_Comment> list) {
		return sqlsession.update("V1_AdminRsvMgt.multiDeleteReview", list);
	}
	
	public int multiDeleteTourReview(List<V1_TourComment> list) {
		return sqlsession.update("V1_AdminRsvMgt.multiDeleteTourReview", list);
	}
	
	public int countStoreTot(V1_Store vo) {
		return sqlsession.selectOne("V1_AdminRsvMgt.countStoreTot", vo);
	}
	
	public int countReviewTot(V1_Comment vo) {
		return sqlsession.selectOne("V1_AdminRsvMgt.countReviewTot", vo);
	}
	
	public int countTourReviewTot(V1_Comment vo) {
		return sqlsession.selectOne("V1_AdminRsvMgt.countTourReviewTot", vo);
	}
	
	
	public List<V1_Store> selectStrCat(List<V1_Store> list) {
		return sqlsession.selectList("V1_AdminRsvMgt.selectStrCat", list);
	}
}
