package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.QNAVO;
import com.mbs.mvc.vo.Qst_AnswerVO;

@Service
public class Admin_QNADAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public List<QNAVO> Admin_QnaList(){
		return sqlsession.selectList("Admin_Qna.Amind_QnaList");
	}
	
	public int Admin_Answer(Qst_AnswerVO vo) {
		return sqlsession.insert("Admin_Qna.Admin_Asnwer", vo);
	}
	public Qst_AnswerVO qst_answer(int a) {
		return sqlsession.selectOne("Admin_Qna.Qst_Answer", a);
	}
	
	public int qst_answer_update(Qst_AnswerVO vo) {
		return sqlsession.update("Admin_Qna.Qst_AnswerUpdate", vo);
	}
}