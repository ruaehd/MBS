package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_AdminReviewVO;
import com.mbs.mvc.vo.V1_Admin_SearchVO;

@Service
public class V1_AdminChartDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	//업체명 검색 리스트
	public List<V1_AdminReviewVO> selectReviewSearchNameList(V1_Admin_SearchVO svo){
		return sqlsession.selectList("AdminReview.selectReviewSearchNameList",svo);
	}
	//사용자 검색 리스트
	public List<V1_AdminReviewVO> selectReviewSearchUserList(V1_Admin_SearchVO svo){
		return sqlsession.selectList("AdminReview.selectReviewSearchUserList",svo);
	}
	public int selectReviewSearchNameCount(V1_Admin_SearchVO svo) {
		return sqlsession.selectOne("AdminReview.selectReviewSearchNameCount",svo);
	}
	public int selectReviewSearchUserCount(V1_Admin_SearchVO svo) {
		return sqlsession.selectOne("AdminReview.selectReviewSearchUserCount",svo);
	}
	public int adminUpdateReview(V1_AdminReviewVO vo) {
		return sqlsession.update("AdminReview.adminUpdateReview",vo);
	}
	public int admindeleteReview(int rsv_cmt_no) {
		return sqlsession.update("AdminReview.admindeleteReview",rsv_cmt_no);
	}
	public int adminReportReview(int rsv_cmt_no) {
		return sqlsession.update("AdminReview.adminReportReview",rsv_cmt_no);
	}
}