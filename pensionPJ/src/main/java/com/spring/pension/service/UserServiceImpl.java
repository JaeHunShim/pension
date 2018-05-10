package com.spring.pension.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.spring.pension.domain.UserVO;
import com.spring.pension.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO userDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	//회원 가입
	@Override
	public void join(UserVO userVO) throws Exception {
		
		userDAO.join(userVO);
	}
	//회원 아이디 체크
	@Override
	public int userIdCheck(String user_id) throws Exception {
		logger.info("count갯수:" + userDAO.getId(user_id));
		return userDAO.getId(user_id);
	}

}
