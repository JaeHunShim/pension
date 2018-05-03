package com.spring.pension.service;

import com.spring.pension.domain.NoticeVO;

public interface NoticeService {
	//게시물 삽입
	public void insertBoard(NoticeVO noticeVO) throws Exception;
}
