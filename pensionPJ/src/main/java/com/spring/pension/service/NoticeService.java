package com.spring.pension.service;

import java.util.List;

import com.spring.pension.domain.NoticeVO;

public interface NoticeService {
	//게시물 삽입
	public void insertBoard(NoticeVO noticeVO) throws Exception;
	//게시물 목록
	public List<NoticeVO> list() throws Exception;
	//게시물 세부사항
	public NoticeVO read(Integer bno) throws Exception;
	//게시물 삭제
	public void remove(Integer bno) throws Exception;
	//게시물 수정 
	public void update(NoticeVO noticeVO) throws Exception;
}
