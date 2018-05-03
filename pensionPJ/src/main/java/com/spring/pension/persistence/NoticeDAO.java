package com.spring.pension.persistence;

import com.spring.pension.domain.NoticeVO;

public interface NoticeDAO {
	//공지사항 입력
	public void create(NoticeVO noticeVO) throws Exception;
}
