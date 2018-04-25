package com.spring.pension.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.ReplyVO;
import com.spring.pension.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO replyDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyServiceImpl.class);
	// 질문게시판의 댓글 삽입
	@Override
	public void addReply(ReplyVO replyVO) throws Exception {
		
		replyDAO.addReply(replyVO);
	}
	// 1.질문 게시판의 댓글 목록
	@Override
	public List<ReplyVO> listReply(Integer qno) throws Exception {
		
		return replyDAO.listReply(qno);
	}
	// 2.질문 게시판의 댓글 목록(페이징 처리)
	@Override
	public List<ReplyVO> listReplyPage(Integer qno, Criteria cri) throws Exception {
		
		return replyDAO.listReplyPage(qno, cri);
	}
	// 질문 게시판의 총 댓글 수
	@Override
	public int count(Integer qno) throws Exception {
		
		return replyDAO.count(qno);
	}
	// 질문 게시판의 댓글 수정
	@Override
	public void modifyReply(ReplyVO replyVO) throws Exception {
		
		replyDAO.modifyReply(replyVO);
	}
	// 질문 게시판의 댓글 삭제 
	@Override
	public void removeReply(Integer rno) throws Exception {
		
		replyDAO.removeReply(rno);
	}

}
