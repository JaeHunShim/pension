package com.spring.pension.persistence;

import java.util.List;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.ReplyVO;

public interface ReplyDAO {
	// 질문 게시판에 댓글 삽입 
	public void addReply(ReplyVO replyVO) throws Exception;
	// 1. 댓글 목록 보기(qno와 같은)
	public List<ReplyVO> listReply(Integer qno) throws Exception;
	// 2. 댓글 목록 보기 (페이징 처리)
	public List<ReplyVO> listReplyPage(Integer qno, Criteria cri) throws Exception;
	// 페이징 처리 하기 위해서 총 게시물수 가지고 오기
	public int count(Integer qno) throws Exception;
	// 질문 게시판의 댓글 수정
	public void modifyReply(ReplyVO replyVO) throws Exception;
	// 질문 게시판의 댓글 삭제 
	public void removeReply(Integer rno) throws Exception;
}
