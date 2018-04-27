package com.mbs.mvc.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class V1_AdminChartDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public String[] selectOldCount(Map<String , Integer> map) {
		return sqlsession.selectOne("AdminChart.selectoldCount",map);
	}
	
}