package com.spring.pension.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.ReserVO;
import com.spring.pension.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace ="com.spring.mapper.UserMapper"; 
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
	
	//회원 가입(daum api 사용해서  주소와 상세주소 문자열을 합쳐서 user_address에 넣음)
	@Override
	public void join(UserVO userVO) throws Exception {
		userVO.setUser_address(userVO.getUser_address()+userVO.getUser_address2());  //문자열 합치는 부분 
		sqlSession.insert(namespace +".create", userVO);
	}
	// 아이디 중복 체크 하기 위해서 userid 가지고오기
	@Override
	public int getId(String user_id) throws Exception {
		
		return sqlSession.selectOne(namespace+".idCheck", user_id);
	}
	//로그인 정보 가지고 오기 
	@Override
	public UserVO loginCheck(UserVO userVO) throws Exception {
		
/*		userVO.setUser_id(userVO.getUser_id());
		userVO.setUser_password(userVO.getUser_password());*/
		
		return sqlSession.selectOne(namespace+".loginCheck",userVO);
	}
	//email받아오기
	@Override
	public UserVO findPassword(UserVO userVO) throws Exception {
		
		return sqlSession.selectOne(namespace+".getpassword", userVO);
	}
	//유저 정보 받아오기 
	@Override
	public UserVO info(String user_id) throws Exception {
	
		return sqlSession.selectOne(namespace+".info",user_id);
	}
	//자신의 예약정보 받아오기
	@Override
	public List<ReserVO> reserInfo(String user_id,Criteria cri) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user_id", user_id);
		map.put("pageStart",cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		
		return sqlSession.selectList(namespace+".reserInfo",map);
	}
	//자신의 예약한 갯수
	@Override
	public int totalCount(String user_id) throws Exception {
		
		return sqlSession.selectOne(namespace+".countInfo",user_id);
	}
	//회원 탈퇴
	@Override
	public void deleteUser(UserVO userVO) throws Exception {
		
		/*Map<String,Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("user_password",user_password);*/
		
		sqlSession.delete(namespace+".deleteUser",userVO);
	}
	//회원정보 수정
	@Override
	public void modify(UserVO userVO) throws Exception {
		
		sqlSession.update(namespace+".modify", userVO);
	}

}
