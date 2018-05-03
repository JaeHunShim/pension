package com.spring.pension.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.spring.pension.domain.NoticeVO;
import com.spring.pension.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeDAO noticeDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	//게시글 입력
	@Override
	public void insertBoard(NoticeVO noticeVO) throws Exception {
		
		noticeDAO.create(noticeVO);
	}
	
}
