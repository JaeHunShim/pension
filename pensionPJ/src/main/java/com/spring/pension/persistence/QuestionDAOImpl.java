package com.spring.pension.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.QuestionVO;

@Repository
public class QuestionDAOImpl implements QuestionDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.spring.mapper.QuestionMapper";
	// 질문등록
	@Override
	public void creat(QuestionVO questionVO) throws Exception {
		
		sqlSession.insert(namespace+".create", questionVO);
	}

}
