package com.spring.pension.persistence;

import com.spring.pension.domain.UserVO;

public interface UserDAO {
	//회원 가입
	public void join(UserVO userVO) throws Exception;
}
