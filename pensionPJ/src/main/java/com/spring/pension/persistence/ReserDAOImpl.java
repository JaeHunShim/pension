package com.spring.pension.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.ReserDTO;
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
	//1.관리자가볼 에약정보 받아오기 
	@Override
	public List<ReserDTO> admin() throws Exception {
		
		return sqlSession.selectList(namespace+".adminList");
	}
	// 예약테이블 데이터 갯수 구하기 (페이징 처리 하기 위해서)
	@Override
	public int conutPage(Criteria cri) throws Exception {
		
		return sqlSession.selectOne(namespace+".count",cri);
	}
	//2. 관리자가 볼 예약정보 받아오기(페이징 처리)
	@Override
	public List<Map<String, Object>> management(Criteria cri) throws Exception {
		
		return sqlSession.selectList(namespace+".adminListCri", cri);
	}
	//관리자가 게시물 삭제
	@Override
	public void delete(int reserNo) throws Exception {
		
		sqlSession.delete(namespace+".delete", reserNo);
	}
	//입금현황 수정하는 부분 
	@Override
	public void modiDeposit(int reserNo) throws Exception {
		
		sqlSession.update(namespace+".modiDeposit", reserNo);
	}

}
