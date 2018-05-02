package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.EventVO;

@Service
public class Admin_EventDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
		
	public EventVO selectEventContent(int evt_no) {
		return sqlsession.selectOne("Event.selectEventContent", evt_no);
	}
	
	public EventVO selectEventImg(int evt_no) {
		return sqlsession.selectOne("Event.selectEventImg", evt_no);
	}
	public List<EventVO> Admin_EventImgList() {
		return sqlsession.selectList("Admin_Event.Amind_EventImgList");
	}
	
}