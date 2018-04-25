package com.spring.pension.service;

import java.util.List;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.ReplyVO;

public interface ReplyService {
	// 질문게시판의 댓글 삽입
	public void addReply(ReplyVO replyVO) throws Exception;
	// 1.질문 게시판의 댓글 목록
	public List<ReplyVO> listReply(Integer qno) throws Exception;
	// 2.질문 게시판의 댓글 목록(페이징 처리)
	public List<ReplyVO> listReplyPage(Integer qno, Criteria cri) throws Exception;
	// 질문 게시판의 총 댓글 수
	public int count(Integer qno) throws Exception;
	// 질문 게시판의 댓글 수정
	public void modifyReply(ReplyVO replyVO) throws Exception;
	// 질문 게시판의 댓글 삭제 
	public void removeReply(Integer rno) throws Exception;
}
