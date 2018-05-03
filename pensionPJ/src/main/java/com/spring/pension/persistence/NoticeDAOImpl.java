package com.spring.pension.persistence;

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
		
		sqlSession.insert(namespace+".create", noticeVO);
	}

}
