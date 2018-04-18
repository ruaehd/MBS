package com.mbs.mvc.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.QNAVO;

@Service
public class QNADAO {
	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlsession = null;
	
	public int insertQuestion(QNAVO vo){
		return sqlsession.insert("QNA.insertQuestion", vo);
	}
	
	/*public int selectQuestionLastNo() {
		return sqlsession.selectOne("QNA.selectQuestionLastNo");
	}*/

}
