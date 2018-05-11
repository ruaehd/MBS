package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.NoticeVO;

@Service
public class Admin_NoticeDAO {
	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlsession = null;
	
	public int NoticeUpdate(NoticeVO vo) {
		return sqlsession.update("Admin_Notice.noticeUpdate", vo);
	}
	
	public int NoticeDelete(NoticeVO vo) {
		return sqlsession.update("Admin_Notice.noticeDelete", vo);
	}
	
	public int NoticeInsert(NoticeVO vo) {
		return sqlsession.insert("Admin_Notice.noticeInsert", vo);
	}
	
	public List<NoticeVO> NoticeList(NoticeVO vo){
		return sqlsession.selectList("Admin_Notice.noticeList", vo);
	}
	public int NoticePage(NoticeVO vo) {
		return sqlsession.selectOne("Admin_Notice.noticePage", vo);
	}
}