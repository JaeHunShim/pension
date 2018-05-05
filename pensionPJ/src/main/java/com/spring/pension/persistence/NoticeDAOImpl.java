package com.spring.pension.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.NoticeVO;
@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.spring.mapper.NoticeMapper";
	//게시물 삽입
	@Override
	public void create(NoticeVO noticeVO) throws Exception {
		logger.info("게시물 삽입 DAO------------------------");
		logger.info("파라미터로 받아오는 내용:" + noticeVO.toString());
		sqlSession.insert(namespace+".create", noticeVO);
		logger.info("-----------------------------------");
	}
	//게시물 목록 가지고 오기
	@Override
	public List<NoticeVO> list() throws Exception {
		logger.info("게시물 목록 DAO------------------------");
		
		return sqlSession.selectList(namespace+".list");
	}
	//세부내용 가지고 오기
	@Override
	public NoticeVO read(Integer bno) throws Exception {
		logger.info("세부내용 DAO --------------------------");
		logger.info("파라미터로 받아오는 bno:" + bno);
		return sqlSession.selectOne(namespace+".read", bno);
	}
	// 글삭제 
	@Override
	public void remove(Integer bno) throws Exception {
		logger.info("글삭제 DAO----------------------------");
		
		sqlSession.update(namespace+".delete", bno);
	}
	// 글 수정
	@Override
	public void update(NoticeVO noticeVO) throws Exception {
		
		logger.info("파라미터로 받아오는 noticeVO 정보:" + noticeVO.toString());
		
		sqlSession.update(namespace+".update",noticeVO);
	}
	// 댓글 갯수 증가 시키기
	@Override
	public void updateViewCnt(Integer bno) throws Exception {

		logger.info("댓글 갯수증가 DAO--------------------------");
		logger.info("가지고오는 bno:" + bno);
		sqlSession.update(namespace+".updateViewCnt",bno);
	}

}
