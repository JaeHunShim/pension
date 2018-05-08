package com.spring.pension.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.pension.domain.NoticeVO;
import com.spring.pension.domain.SearchCriteria;
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
	//1. 게시글 목록
	@Override
	public List<NoticeVO> list() throws Exception {
		
		return noticeDAO.list();
	}
	//2. 게시물 목록 (검색과 페이징 정보 파라미터로 받아옴)
	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception {
		
		return noticeDAO.listSearch(cri);
	}
	// 총 게시물 가지고 오기 
	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		
		return noticeDAO.listSearchConunt(cri);
	}
	
	//게시물 상세조회(조회할때 조횟수 증가시키기);
	@Transactional
	@Override
	public NoticeVO read(Integer bno) throws Exception {
		
		noticeDAO.updateViewCnt(bno);
	
		return noticeDAO.read(bno);
	}
	//게시물 삭제
	@Override
	public void remove(Integer bno) throws Exception {
		
		noticeDAO.remove(bno);
	}
	//게시물 수정
	public void update(NoticeVO noticeVO) throws Exception {
		
		noticeDAO.update(noticeVO);
	}
	
}
