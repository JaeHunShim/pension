package com.spring.pension.persistence;

import java.util.List;

import com.spring.pension.domain.NoticeVO;
import com.spring.pension.domain.QuestionVO;
import com.spring.pension.domain.SearchCriteria;

public interface NoticeDAO {
	//공지사항 입력
	public void create(NoticeVO noticeVO) throws Exception;
	//1. 질문 list들 가지고 오기
	public List<NoticeVO> list() throws Exception;
	//2. 질문 list가지고 오기
	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception;
	// 총게시물 갯수 가지고 오기 (페이징 처리때문에)
	public int listSearchConunt(SearchCriteria cri) throws Exception;
	// 세부내용
	public NoticeVO read(Integer bno) throws Exception;
	// 글삭제
	public void remove(Integer bno) throws Exception;
	// 글 수정
	public void update(NoticeVO noticeVO) throws Exception;
	// 조횟수 증가 시키기
	public void updateViewCnt(Integer bno) throws Exception;
	
}
