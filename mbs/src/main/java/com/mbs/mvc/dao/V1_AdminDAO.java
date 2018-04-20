package com.mbs.mvc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_Reservation;

@Service
public class V1_AdminDAO {
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public List<V1_Reservation> selectAdminRsvList(V1_Reservation vo){
		return sqlsession.selectList("V1_AdminRsvMgt.selectAdminRsvList", vo);
	}
	
	public Map<String, Integer> countAdminRsvTot() {
		return sqlsession.selectOne("V1_AdminRsvMgt.countAdminRsvTot");
	}
}
