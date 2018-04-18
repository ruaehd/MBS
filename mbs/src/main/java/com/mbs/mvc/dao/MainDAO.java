package com.mbs.mvc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.Main_SearchVO;
import com.mbs.mvc.vo.Map_ListVO;
import com.mbs.mvc.vo.Web_ListVO;

@Service		
public class MainDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public List<Map_ListVO> selectJoinContentList(Main_SearchVO vo){
		return sqlsession.selectList("Main.selectJoinContentList",vo);
	}
	
	public List<Map_ListVO> selectContentList(Main_SearchVO vo) {
		return sqlsession.selectList("Main.selectContentList", vo);
	}
	public List<Map_ListVO> selectMainDragSearch(Main_SearchVO vo){
		return sqlsession.selectList("Main.selectMainDragSearch",vo);
	}
	
	
	public Map<String,Object> selectImgOne(int no) {
		return sqlsession.selectOne("Main.selectImgOne",no);
	}
	
	public List<Web_ListVO> selectWebContentList(Main_SearchVO vo){
		return sqlsession.selectList("Main.selectWebContentList",vo);
	}
	
}
