package com.spring.pension.persistence;

import com.spring.pension.domain.UserVO;

public interface UserDAO {
	//회원 가입
	public void join(UserVO userVO) throws Exception;
	//아이디 중복체크
	public int getId(String user_id) throws Exception;
	//로그인  체크
	public UserVO loginCheck(UserVO userVO) throws Exception;
}
