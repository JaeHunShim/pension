package com.spring.pension.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.QuestionVO;

@Repository
public class QuestionDAOImpl implements QuestionDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(QuestionDAOImpl.class);
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.spring.mapper.QuestionMapper";
	// 질문등록
	@Override
	public void creat(QuestionVO questionVO) throws Exception {
		
		logger.info("질문등록DAO--------" + questionVO);
		
		sqlSession.insert(namespace+".create", questionVO);
	}
	// 등록된 글목록 불러오기 
	@Override
	public List<QuestionVO> listAll() throws Exception {
		
		return sqlSession.selectList(namespace+".listAll");
	}
	// 게시물 상세 보여주는 부분
	@Override
	public QuestionVO read(Integer qno, String password) throws Exception {
		
		logger.info("보내는 데이터  pw" + qno,password);
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("qno", qno);
		map.put("password", password);
		
		return sqlSession.selectOne(namespace+".read",map);
	}
	//조회수 증가 시키기 
	@Override
	public void updateViewCnt(Integer qno) throws Exception {
		
		logger.info("받아오는 qno" +qno);
		
		sqlSession.update(namespace+".updateViewCnt" ,qno);
		
	}
	//게시물 삭제
	@Override
	public void delete(Integer qno) throws Exception {
		
		sqlSession.delete(namespace+".delete",qno);
	}
	//게시물 수정 
	@Override
	public void modify(QuestionVO questionVO) throws Exception {
		
		sqlSession.update(namespace+".modify", questionVO);
	}
	//qno와 일치하는 데이터 가지고 오기
	@Override
	public QuestionVO getQno(Integer qno) throws Exception {
		
		return sqlSession.selectOne(namespace+".getQno", qno);
	}

}
