package com.spring.pension.service;

import java.util.List;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.QuestionVO;

public interface QuestionService {

	// 질문 등록 
	public void regist(QuestionVO questionVO) throws Exception;
	// 질문 목록 가져오기
	public List<QuestionVO> listAll() throws Exception;
	// 질문 목록 가져오기 :페이징 처리한후 (criteria 클래스 사용 후)
	public List<QuestionVO> listCriteria(Criteria cri) throws Exception;
	// 총게물 가지고 오기
	public int listCountCriteria(Criteria cri) throws Exception;
	// 상세페이지 가지고오기
	public QuestionVO read(Integer qno, String password) throws Exception;
	// 게시물 삭제하기 
	public void remove(Integer qno) throws Exception;
	// 게시물 수정
	public void modify(QuestionVO questionVO) throws Exception;
	// qno와 일치하는 내용들 가지고 오기
	public QuestionVO getQno(Integer qno) throws Exception;
}
