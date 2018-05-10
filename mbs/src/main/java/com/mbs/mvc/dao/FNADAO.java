package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.FNAVO;

@Service
public class FNADAO {
	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlsession = null;
	
	public List<FNAVO> FnaListMain(){
		return sqlsession.selectList("FNA.FnaListMain");
	}
	
	public List<FNAVO> FnaList(FNAVO vo){
		return sqlsession.selectList("FNA.FnaList", vo);
	}
}