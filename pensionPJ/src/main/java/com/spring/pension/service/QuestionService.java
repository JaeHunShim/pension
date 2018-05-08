package com.spring.pension.service;

import java.util.List;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.QuestionVO;
import com.spring.pension.domain.SearchCriteria;

public interface QuestionService {

	// 질문 등록 
	public void regist(QuestionVO questionVO) throws Exception;
	// 1. 질문 목록 가져오기
	public List<QuestionVO> listAll() throws Exception;
	// 2. 질문 목록 가져오기 :페이징 처리한후 (criteria 클래스 사용 후)
	public List<QuestionVO> listCriteria(Criteria cri) throws Exception;
	// 3. 질문 목록 가져오기: 검색기능 추가해서 목록 가져오기
	public List<QuestionVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	// 1) 총게시물 수 가지고 오기
	public int listCountCriteria(Criteria cri) throws Exception;
	// 2) 총게시물 수 가져오기(검색결과와 같은 )
	public int listSearchCount(SearchCriteria cri) throws Exception;
	// 상세페이지 가지고오기
	public QuestionVO read(Integer qno, String password) throws Exception;
	// 게시물 삭제하기 
	public void remove(Integer qno) throws Exception;
	// 게시물 수정
	public void modify(QuestionVO questionVO) throws Exception;
	// qno와 일치하는 내용들 가지고 오기(댓글 때문에)
	public QuestionVO getQno(Integer qno) throws Exception;
	// 이전글과 다음글 불러오는 부분 
	public List<QuestionVO> preNePage(Integer qno) throws Exception;
}
