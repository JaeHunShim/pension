package com.spring.pension.persistence;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.ReplyVO;


@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.spring.mapper.ReplyMapper";
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOImpl.class);
	// 질문게시판에서 댓글 삽입
	@Override
	public void addReply(ReplyVO replyVO) throws Exception {
		
		sqlSession.insert(namespace+".create", replyVO);
	}
	// 1. 질문게시판에서  댓글 목록
	@Override
	public List<ReplyVO> listReply(Integer qno) throws Exception {
		
		return sqlSession.selectList(namespace+".list", qno);
	}
	// 2. 질문게시판에서 댓글 목록( 페이징 처리하기 위해서  question 에서 썻던 Criteria 를 그대로 사용)
	@Override
	public List<ReplyVO> listReplyPage(Integer qno, Criteria cri) throws Exception {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("qno", qno);
		map.put("cri", cri);
		
		return sqlSession.selectList(namespace +".listPage", map);
	}
	// 댓글 갯수 가지고오는 부분 (페이징 처리하기 위해)
	@Override
	public int count(Integer qno) throws Exception {
		
		return sqlSession.selectOne(namespace+".count", qno);
	}
	// 질문게시판에서 댓글 수정
	@Override
	public void modifyReply(ReplyVO replyVO) throws Exception {
		
		sqlSession.update(namespace+".update", replyVO);
	}
	// 질문게시판에서 댓글 삭제 
	@Override
	public void removeReply(Integer rno) throws Exception {
		
		sqlSession.delete(namespace+".delete", rno);
	}
}
