package com.spring.pension.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.ReserDTO;

@Repository
public class ExcelDAOImpl implements ExcelDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.spring.mapper.ExcelMapper";
	
	@Override
	public List<ReserDTO> getBooks() {
		
		return sqlSession.selectList(namespace+".getReser");
	}

}
