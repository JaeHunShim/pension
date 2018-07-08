package com.spring.pension.persistence;

import java.util.List;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.ReserVO;
import com.spring.pension.domain.UserVO;

public interface UserDAO {
	//회원 가입
	public void join(UserVO userVO) throws Exception;
	//아이디 중복체크
	public int getId(String user_id) throws Exception;
	//로그인  체크
	public UserVO loginCheck(UserVO userVO) throws Exception;
	//email받아오기
	public UserVO findPassword(UserVO userVO) throws Exception;
	//유저정보 받아오기
	public UserVO info(String user_id) throws Exception;
	//자신의 예약정보 받아오기
	public List<ReserVO> reserInfo(String user_id,Criteria cri) throws Exception;
	//자신의 예약정보 갯수 받아오기
	public int totalCount(String user_id) throws Exception;
	//회원 탈퇴하는 부분 
	public void deleteUser(UserVO userVO) throws Exception;
}
