package com.spring.pension.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.ReserVO;

@Repository
public class ReserDAOImpl implements ReserDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace ="com.spring.mapper.ReserMapper";

	@Override
	public List<ReserVO> listAll() throws Exception {
		
		return session.selectList(namespace+".listAll");
	}

	@Override
	public void create(ReserVO vo) throws Exception {
		
		session.insert(namespace+".create", vo);
	}
}
