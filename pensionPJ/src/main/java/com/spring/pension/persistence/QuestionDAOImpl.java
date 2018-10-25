package com.spring.pension.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.QuestionVO;
import com.spring.pension.domain.SearchCriteria;

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
	// 1.등록된 글목록 불러오기 
	@Override
	public List<QuestionVO> listAll() throws Exception {
		
		return sqlSession.selectList(namespace+".listAll");
	}
	// 2.등록된 글 목록 불러오기 : 페이징 처리연습 한 부분 
	@Override
	public List<QuestionVO> listPage(int page) throws Exception {
		
		if(page<=0) {
			page=1;
		}
		page=(page-1)*10;
		
		return sqlSession.selectList(namespace+"listPage", page);
	}
	// 3.등록된 글 목록 불러오기 : criteria class 를 이용해서 페이징 처리 하기
	@Override
	public List<QuestionVO> listCriteria(Criteria cri) throws Exception {

		return sqlSession.selectList(namespace+".listCriteria", cri);
	}
	// 4. 등록된 글 목록 불러오기: 검색결과에 따른 게시물 목록
	@Override
	public List<QuestionVO> listSearch(SearchCriteria cri) throws Exception {
			
		return sqlSession.selectList(namespace+".listSearch", cri);
	}
	// 1) 게시물 총 갯수 가지고 오기 
	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return sqlSession.selectOne(namespace+".countPaging", cri);
	}
	// 2) 게시물 총 갯수 가지고 오기(검색조건에 맞는 게시물 가지고오기  )
	@Override
	public int listSearchConunt(SearchCriteria cri) throws Exception {
				
		return sqlSession.selectOne(namespace+".listSearchCount", cri);
	}	
	//비밀번호(qno와 일치하는 passoword) 받아오는 부분
	@Override
	public String getPassword(int qno,String password) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("qno", qno);
		map.put("password", password);
		
		return sqlSession.selectOne(namespace+".getPassword",map);
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
	// 댓글 갯수 가지고 오는 부분
	@Override
	public void updateReplyCnt(Integer qno, int amount) throws Exception {
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("qno", qno);
		map.put("amount", amount);
		
		sqlSession.update(namespace + ".updateReplyCnt", map);
	}
	//이전게시물과 다음 게시물에 대한 정보 받아오는 부분 
	@Override
	public List<QuestionVO> preNePage(Integer qno) throws Exception {
		
		return sqlSession.selectList(namespace+".preNePage", qno);
	}
	
}
