package com.mbs.mvc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_RsvMenu;

@Service
public class V1_ReservationDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public int insertReservation(V1_Reservation vo) {
		return sqlsession.insert("V1_Reservation.insertReservation", vo);
	}
	
	public List<V1_Reservation> selectRsvList(V1_Reservation vo){
		return sqlsession.selectList("V1_Reservation.selectRsvList", vo);
	}
	
	public V1_Reservation selectRsvOne(V1_Reservation vo) {
		return sqlsession.selectOne("V1_Reservation.selectRsvOne", vo);
	}
	
	public Map<String, Integer> countRsvTot(V1_Reservation vo) {
		return sqlsession.selectOne("V1_Reservation.countRsvTot", vo);
	}
	
	public int updateRsv(V1_Reservation vo) {
		return sqlsession.update("V1_Reservation.updateRsv", vo);
	}
	
	public int cancelRsv(int rsv_no) {
		return sqlsession.update("V1_Reservation.cancelRsv", rsv_no);
	}
	
	public List<V1_RsvMenu> selectRsvMenuList(int rsv_no){
		return sqlsession.selectList("V1_Reservation.selectRsvMenuList", rsv_no);
	}
}
