package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.MemberVO;
import com.mbs.mvc.vo.V1_Admin_SearchVO;

@Service
public class V1_AdminUserDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	
	//검색 회원 리스트
	public List<MemberVO> selectSearchNameUserList(V1_Admin_SearchVO vo){
		return sqlsession.selectList("AdminUser.selectSearchNameUserList",vo);
	}
	public int selectSearchNameUserCount(V1_Admin_SearchVO vo) {
		return sqlsession.selectOne("AdminUser.selectSearchNameUserCount",vo);
	}
	public List<MemberVO> selectSearchIdUserList(V1_Admin_SearchVO vo){
		return sqlsession.selectList("AdminUser.selectSearchIdUserList",vo);
	}
	public int selectSearchIdUserCount(V1_Admin_SearchVO vo) {
		return sqlsession.selectOne("AdminUser.selectSearchIdUserCount",vo);
	}
	//회원차단
	public int deleteUser(String mb_id) {
		return sqlsession.update("AdminUser.deleteUser", mb_id);
	}
	//차단해제
	public int deleteUser1(String mb_id) {
		return sqlsession.update("AdminUser.deleteUser1", mb_id);
	}

}