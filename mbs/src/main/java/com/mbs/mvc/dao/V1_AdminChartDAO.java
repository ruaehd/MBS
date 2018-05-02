package com.mbs.mvc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbs.mvc.vo.V1_AdminStoreChartVO;
import com.mbs.mvc.vo.V1_AgeVO;
import com.mbs.mvc.vo.V1_MonthChart;

@Service
public class V1_AdminChartDAO {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlsession = null;
	
	public V1_AgeVO selectOldManCount() {
		return sqlsession.selectOne("AdminChart.selectOldManCount");
	}
	public V1_AgeVO selectOldWomanCount() {
		return sqlsession.selectOne("AdminChart.selectOldWomanCount");
	}
	public List<V1_MonthChart> selectMonthChartCount() {
		return sqlsession.selectList("AdminChart.selectMonthChartCount");
	}
	
	public V1_AdminStoreChartVO selectPriceCount1() {
		return sqlsession.selectOne("AdminChart.selectPriceCount1");
	}
	public V1_AdminStoreChartVO selectPriceCount2() {
		return sqlsession.selectOne("AdminChart.selectPriceCount2");
	}
	public int selectStoreCount(int gubun) {
		return sqlsession.selectOne("AdminChart.selectStoreCount",gubun);
	}
	public List<V1_MonthChart> selectStoreMonthChartCount() {
		return sqlsession.selectList("AdminChart.selectStoreMonthChartCount");
	}
	public int selectStorePrice() {
		return sqlsession.selectOne("AdminChart.selectStorePrice");
	}
	public int selectStoreCount1() {
		return sqlsession.selectOne("AdminChart.selectStoreCount1");
	}
	public String selectStorePoint() {
		return sqlsession.selectOne("AdminChart.selectStorePoint");
	}
}