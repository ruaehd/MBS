package com.mbs.mvc.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_TestVO;

@Service		
public class V1_TestDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public int insertTest(V1_TestVO vo ) {
		return sqlsession.insert("Test.insertTest", vo);
	}
}
