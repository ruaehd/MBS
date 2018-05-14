package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.MemberVO;
import com.mbs.mvc.vo.NoticeVO;
import com.mbs.mvc.vo.QuestionVO;
import com.mbs.mvc.vo.User_EventVO;
import com.mbs.mvc.vo.User_ResoverVO;

@Service
public class UserDAO {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public int updateMemberOne(MemberVO vo) {
		return sqlsession.update("User.updateMemberOne",vo);
	}
	
	public MemberVO selectMemberLogin(MemberVO vo) {
		return sqlsession.selectOne("User.selectMemberLogin",vo);
	}
	
	public int insertMemberJoin(MemberVO vo) {
		return sqlsession.insert("User.insertMemberJoin",vo);
	}
	
	public int selectMemberCheck(String mb_id) {
		return sqlsession.selectOne("User.selectMemberCheck",mb_id);
	}
	
	public int userChangePw(MemberVO vo) {
		return sqlsession.update("User.userChangePw",vo);
	}
	
	public MemberVO selectMemberOne(String mb_id) {
		return sqlsession.selectOne("User.selectMemberOne",mb_id);
	}
	
	public List<User_ResoverVO> selectResoverList(String mb_id){
		return sqlsession.selectList("User.selectResoverList",mb_id);
	}
	
	public List<QuestionVO> selectQuestionList(String mb_id){
		return sqlsession.selectList("User.selectQuestionList",mb_id);
	}
	
	public List<NoticeVO> selectNoticeList(){
		return sqlsession.selectList("User.selectNoticeList");
	}
	
	public List<User_EventVO> selectEventList(){
		return sqlsession.selectList("User.selectEventList");
	}
	
	public List<QuestionVO> selectMemberQuestionList(String mb_id){
		return sqlsession.selectList("User.selectMemberQuestionList",mb_id);
	}
}
