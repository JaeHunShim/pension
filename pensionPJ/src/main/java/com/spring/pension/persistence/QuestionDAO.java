package com.spring.pension.persistence;

import java.util.List;

import com.spring.pension.domain.QuestionVO;

public interface QuestionDAO {
	
	//질문등록
	public void creat(QuestionVO questionVO) throws Exception;
	//천체글 목록 보여주기
	public List<QuestionVO>listAll() throws Exception;
	//게시글 상세 페이지 보여주는 부분 
	public QuestionVO read(Integer qno, String password) throws Exception;
}
