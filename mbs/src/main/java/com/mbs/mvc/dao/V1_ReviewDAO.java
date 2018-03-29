package com.mbs.mvc.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_Reservation;

@Service
public class V1_ReviewDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public V1_Reservation selectRsvInfo(int rsv_no) {
		return sqlsession.selectOne("V1_Comment.selectRsvInfo", rsv_no);
	}
}
