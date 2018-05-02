package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_Comment;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_TourComment;

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
	
	public List<V1_TourComment> selectTourCmtList(V1_Store vo){
		return sqlsession.selectList("V1_Review.selectTourCmtList", vo);
	}
	
	public V1_Comment selectPreReview(int rsv_no) {
		return sqlsession.selectOne("V1_Review.selectPreReview", rsv_no);
	}
	
	public V1_Store selectTourPreReview(int str_number) {
		return sqlsession.selectOne("V1_Review.selectTourPreReview", str_number);
	}
	
	public int selectReviewcCnt(int str_number) {
		return sqlsession.selectOne("V1_Review.selectReviewcCnt", str_number);
	}
	
	public int selectTourReviewcCnt(int str_number) {
		return sqlsession.selectOne("V1_Review.selectTourReviewcCnt", str_number);
	}
	
	public List<V1_Comment> selectCmtTotList(int str_number){
		return sqlsession.selectList("V1_Review.selectCmtTotList", str_number);
	}
	
	public int insertTourCmt(V1_TourComment vo) {
		return sqlsession.insert("V1_Review.insertTourCmt", vo);
	}
	
	public List<V1_TourComment> selectTourReviewList(int str_number){
		return sqlsession.selectList("V1_Review.selectTourReviewList", str_number);
	}
	
	public int selectTourReviewChk(V1_TourComment vo) {
		return sqlsession.selectOne("V1_Review.selectTourReviewChk", vo);
	}
	
	public V1_TourComment selectTourReviewOne(V1_TourComment vo) {
		return sqlsession.selectOne("V1_Review.selectTourReviewOne", vo);
	}
	
	public int updateTourReview(V1_TourComment vo) {
		return sqlsession.update("V1_Review.updateTourReview", vo);
	}
	
	public int deleteReview(int rsv_cmt_no) {
		return sqlsession.update("V1_Review.deleteReview", rsv_cmt_no);
	}
	
	
	public int deleteTourReview(int tour_cmt_no) {
		return sqlsession.update("V1_Review.deleteTourReview", tour_cmt_no);
	}
}
