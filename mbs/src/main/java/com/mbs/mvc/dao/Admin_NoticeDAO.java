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
	
	public List<NoticeVO> NoticeList(NoticeVO vo){
		return sqlsession.selectList("Admin.noticeList", vo);
	}
	public int NoticePage(NoticeVO vo) {
		return sqlsession.selectOne("Admin.noticePage", vo);
	}
}