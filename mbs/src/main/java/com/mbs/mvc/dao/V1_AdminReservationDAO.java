package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_MonthChart;
import com.mbs.mvc.vo.V1_Reservation;
import com.mbs.mvc.vo.V1_WeekCount;

@Service
public class V1_AdminReservationDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public List<V1_Reservation> selectReservationOne(String name) {
		return sqlsession.selectList("AdminChart.selectReservationOne",name);
	}
	public List<V1_MonthChart> selectReservationMonth(){
		return sqlsession.selectList("AdminChart.selectReservationMonth");
	}
	public V1_WeekCount selectWeekReservationCount(String name){
		return sqlsession.selectOne("AdminChart.selectWeekReservationCount",name);
	}
	public int selectReservationAllCount() {
		return sqlsession.selectOne("AdminChart.selectReservationAllCount");
	}
	public int selectReservationNowCount() {
		return sqlsession.selectOne("AdminChart.selectReservationNowCount");
	}
}