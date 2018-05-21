package com.mbs.mvc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_BizJoin;

@Service
public class V1_BizMemDAO {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public int selectCompanyNum(String num) {
		return sqlsession.selectOne("BizMem.selectCompanyNum",num);
	}
	public int insertBizImage(V1_BizJoin vo) {
		return sqlsession.insert("BizMem.insertBizImage",vo);
	}
	public int insertBizMember(V1_BizJoin vo) {
		return sqlsession.insert("BizMem.insertBizMember",vo);
	}
	public int tourinsert(V1_BizJoin vo) {
		return sqlsession.insert("BizMem.tourinsert",vo);
	}
	
	public int insertBizMenu(V1_BizJoin vo) {
		return sqlsession.insert("BizMem.insertBizMenu",vo);
	}
	public int updateMemberBiz(V1_BizJoin vo) {
		return sqlsession.update("BizMem.updateMemberBiz",vo);
	}
	public V1_BizJoin selectStoreOne(int no) {
		return sqlsession.selectOne("BizMem.selectStoreOne",no);
	}
	public int selectImgCount(int no) {
		return sqlsession.selectOne("BizMem.selectImgCount",no);
	}
	public Map<String,Object> selectImgOne(V1_BizJoin vo){
		return sqlsession.selectOne("BizMem.selectImgOne",vo);
	}
	public List<V1_BizJoin> selectMenuCount(int no) {
		return sqlsession.selectList("BizMem.selectMenuCount",no);
	}
	public int updateBizMember(V1_BizJoin vo) {
		return sqlsession.update("BizMem.updateBizMember",vo);
	}
	public int updateBizMenu(V1_BizJoin vo) {
		return sqlsession.update("BizMem.updateBizMenu",vo);
	}
	public int updateBizImage(V1_BizJoin vo) {
		return sqlsession.insert("BizMem.updateBizImage",vo);
	}
}
