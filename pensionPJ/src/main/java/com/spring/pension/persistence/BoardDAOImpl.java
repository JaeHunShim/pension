package com.spring.pension.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace ="com.spring.mapper.BoardMapper";

	@Override
	public List<BoardVO> listAll() throws Exception {
		
		return session.selectList(namespace+".listAll");
	}

	@Override
	public void create(BoardVO vo) throws Exception {
		
		session.insert(namespace+".create", vo);
	}
}
