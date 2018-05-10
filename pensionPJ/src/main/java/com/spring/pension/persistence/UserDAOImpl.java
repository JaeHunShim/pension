package com.spring.pension.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace ="com.spring.mapper.UserMapper"; 
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	
	//회원 가입
	@Override
	public void join(UserVO userVO) throws Exception {
		
		sqlSession.insert(namespace +".create", userVO);
	}
	// 아이디 중복 체크 하기 위해서 userid 가지고오기
	@Override
	public int getId(String user_id) throws Exception {
		
		return sqlSession.selectOne(namespace+".idCheck", user_id);
	}

}
