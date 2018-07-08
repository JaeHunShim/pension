package com.spring.pension.service;

import java.util.List;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.ReserVO;
import com.spring.pension.domain.UserVO;

public interface UserService {
	//회원 가입
	public void join(UserVO userVO) throws Exception;
	//아이디 중복체크
	public int userIdCheck(String user_id) throws Exception;
	// 메일 전송
	public boolean send(String subject,String text, String from, String to);
	// 로그인 체크
	public UserVO loginCheck(UserVO userVO) throws Exception;
	// 아이디로 email가지고 오기
	public boolean findPassword(UserVO userVO) throws Exception;
	//유저 정보 받아오기 
	public UserVO userInfo(String user_id) throws Exception;
	//자신의 예약한 정보 갯수 가지고 오기
	public int totalInfo(String user_id) throws Exception;
	//자신의 예약 정보 받아오기
	public List<ReserVO> reserInfo(String user_id,Criteria cri) throws Exception;
	//회원 탈퇴하기 
	public void deleteUser(UserVO userVO) throws Exception;
}
