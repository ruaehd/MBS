package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_Menu;
import com.mbs.mvc.vo.V1_Store;
import com.mbs.mvc.vo.V1_StrImg;

@Service
public class V1_UserContentDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public V1_Store selectStoreOne(int str_no) {
		return sqlsession.selectOne("V1_Store.selectStoreOne", str_no);
	}
	
	public List<V1_Menu> selectMenuList(int str_no){
		return sqlsession.selectList("V1_Store.selectMenuList", str_no);
	}
	
	public List<V1_StrImg> selectBlobImg(int str_no){
		return sqlsession.selectList("V1_Store.selectBlobImg", str_no);
	}
	
	public V1_StrImg selectBlobImg1(V1_StrImg obj) {
		return sqlsession.selectOne("V1_Store.selectBlobImg1", obj);
	}
}
