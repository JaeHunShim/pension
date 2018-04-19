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
	//조회수 증가 시키기 
	public void updateViewCnt(Integer qno) throws Exception;
	//게시물 삭제 하기
	public void delete(Integer qno) throws Exception;
	//게시물 수정하기 
	public void modify(QuestionVO questionVO) throws Exception;
	//qno와 일치하는 Vo가지고 오기
	public QuestionVO getQno(Integer qno) throws Exception;
}
