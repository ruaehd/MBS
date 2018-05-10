package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.FNAVO;
import com.mbs.mvc.vo.QNAVO;

@Service
public class Admin_FNADAO {
	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlsession = null;
	
	
	public int FnaUpdate(FNAVO vo) {
		return sqlsession.update("Admin_Fna.FnaUpdate", vo);
	}
	
	public List<FNAVO> FnaList(FNAVO vo){
		return sqlsession.selectList("Admin_Fna.FnaList", vo);
	}
	
	public int FnaInsert(FNAVO vo) {
		return sqlsession.insert("Admin_Fna.FnaInsert", vo);
	}
	
	public int FnaDelete(FNAVO vo) {
		return sqlsession.update("Admin_Fna.FnaDelete", vo);
	}
	
	public int FnaPage(FNAVO vo) {
		return sqlsession.selectOne("Admin_Fna.FnaPage", vo);
	}
}