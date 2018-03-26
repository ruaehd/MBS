package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.Main_SearchVO;
import com.mbs.mvc.vo.Map_ListVO;

@Service		
public class MainDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public List<Map_ListVO> selectContentList(Main_SearchVO vo) {
		return sqlsession.selectList("Main.selectContentList", vo);
	}
}
