package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.NoticeVO;

@Service
public class ServiceDAO {
	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlsession = null;
	
	public List<NoticeVO> mainNoticeList(){
		return sqlsession.selectList("Notice.mainNoticeList");
	}
	
	public List<NoticeVO> selectNoticeList(int page){
		return sqlsession.selectList("Notice.selectNoticeList", page);
	}
	
	public NoticeVO selectNoticeContent(int ntc_no) {
		return sqlsession.selectOne("Notice.selectNoticeOne", ntc_no);
	}

	public int selectNoticePrev(int ntc_no) {
		return sqlsession.selectOne("Notice.selectNoticePrev", ntc_no);
	}
	
	public int selectNoticeNext(int ntc_no) {
		return sqlsession.selectOne("Notice.selectNoticeNext", ntc_no);
	}
	
	public int selectNoticePage() {
		return sqlsession.selectOne("Notice.selectNoticePage");
	}
	
	
}
