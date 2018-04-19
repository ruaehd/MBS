package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_Store;

@Service
public class V1_ReviewDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public V1_Reservation selectRsvInfo(int rsv_no) {
		return sqlsession.selectOne("V1_Comment.selectRsvInfo", rsv_no);
	}
	
	public int selectReviewChk(V1_Comment vo) {
		return sqlsession.selectOne("V1_Review.selectReviewChk", vo);
	}
	
	public int insertComment(V1_Comment vo) {
		return sqlsession.insert("V1_Review.insertComment", vo);
	}
	
	public V1_Comment selectReviewOne(V1_Comment vo) {
		return sqlsession.selectOne("V1_Review.selectReviewOne", vo);
	}
	
	public int updateComment(V1_Comment vo) {
		return sqlsession.update("V1_Review.updateComment", vo);
	}
	
	public List<V1_Comment> selectCmtList(V1_Store vo){
		return sqlsession.selectList("V1_Review.selectCmtList", vo);
	}
	
	public V1_Comment selectPreReview(int rsv_no) {
		return sqlsession.selectOne("V1_Review.selectPreReview", rsv_no);
	}
	
	public int selectReviewcCnt(int str_no) {
		return sqlsession.selectOne("V1_Review.selectReviewcCnt", str_no);
	}
	
	public List<V1_Comment> selectCmtTotList(int str_no){
		return sqlsession.selectList("V1_Review.selectCmtTotList", str_no);
	}
	
}
