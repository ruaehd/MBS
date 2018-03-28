package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_Reservation;

@Service
public class V1_ReservationDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public int insertReservation(V1_Reservation vo) {
		return sqlsession.insert("V1_Reservation.insertReservation", vo);
	}
	
	public List<V1_Reservation> selectRsvListTot(V1_Reservation vo){
		return sqlsession.selectList("V1_Reservation.selectRsvListTot", vo);
	}
	public List<V1_Reservation> selectRsvList(V1_Reservation vo){
		return sqlsession.selectList("V1_Reservation.selectRsvList", vo);
	}
	
	public V1_Reservation selectRsvOne(V1_Reservation vo) {
		return sqlsession.selectOne("V1_Reservation.selectRsvOne", vo);
	}
}
