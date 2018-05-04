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
	public int Update_Event(EventVO vo) {
		return sqlsession.update("Admin_Event.UpdateEvent", vo);
	}
	
	public EventVO selectEventContent(int evt_no) {
		return sqlsession.selectOne("Event.selectEventContent", evt_no);
	}
	
	public EventVO selectEventImg(int evt_no) {
		return sqlsession.selectOne("Event.selectEventImg", evt_no);
	}
	
	public List<EventVO> Admin_EventImgList(EventVO vo) {
		return sqlsession.selectList("Admin_Event.Amind_EventImgList", vo);
	}
	
	public int insertEvent(EventVO vo){
		return sqlsession.insert("Admin_Event.insertEvent", vo);
	}
	
	public int EventDelete(EventVO vo) {
		return sqlsession.update("Admin_Event.EventDelete", vo);
	}
}