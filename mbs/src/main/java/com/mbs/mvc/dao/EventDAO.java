package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.EventVO;

@Service
public class EventDAO {
	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlsession = null;
	
	public int eventCountEnd() {
		return sqlsession.selectOne("Event.eventCountEnd");
	}
	
	public int eventCountBegin() {
		return sqlsession.selectOne("Event.eventCountBegin");
	}
	
	public EventVO selectEventContent(int evt_no) {
		return sqlsession.selectOne("Event.selectEventContent", evt_no);
	}
	
	public EventVO selectEventImg(int evt_no) {
		return sqlsession.selectOne("Event.selectEventImg", evt_no);
	}
	public List<EventVO> selectEventImgBegin() {
		return sqlsession.selectList("Event.selectEventImgBegin");
	}
	
	public List<EventVO> selectEventImgEnd() {
		return sqlsession.selectList("Event.selectEventImgEnd");
	}
	
	public int eventAutoDelete() {
	return sqlsession.update("Event.autodelete");
	}
}