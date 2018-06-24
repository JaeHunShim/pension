package com.spring.pension.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.ReserVO;

@Repository
public class ReserDAOImpl implements ReserDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.spring.mapper.ReserMapper";
	//예약정보 삽입
	@Override
	public void insert(ReserVO reserVO) throws Exception {
		
		sqlSession.insert(namespace +".insertReser", reserVO);
	}
	//예약번호 받아오기 
	@Override
	public List<ReserVO> getReserNo() throws Exception {
		
		return sqlSession.selectList(namespace+".getReserNo");
	}

}
