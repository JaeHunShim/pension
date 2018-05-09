package com.spring.pension.service;

import com.spring.pension.domain.UserVO;

public interface UserService {
	//회원 가입
	public void join(UserVO userVO) throws Exception;
}
