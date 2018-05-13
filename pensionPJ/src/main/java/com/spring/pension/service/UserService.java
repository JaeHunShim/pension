package com.spring.pension.service;

import com.spring.pension.domain.UserVO;

public interface UserService {
	//회원 가입
	public void join(UserVO userVO) throws Exception;
	//아이디 중복체크
	public int userIdCheck(String user_id) throws Exception;
	// 메일 전송
	public boolean send(String subject,String text, String from, String to);
	// 로그인 체크
	public UserVO loginCheck(String user_id, String user_password) throws Exception;
}
