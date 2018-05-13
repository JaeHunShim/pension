package com.spring.pension;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.pension.domain.UserVO;
import com.spring.pension.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDAOTest {

	@Inject
	private UserDAO userDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAOTest.class);
	
/*	@Test
	public void insert() throws Exception {
		
		UserVO vo = new UserVO();
		
		vo.setUser_id("jeahuniya");
		vo.setUser_email("jaehdfkj@naver.com");
		vo.setUser_name("관리자");
		vo.setUser_password("1");
		vo.setUser_phone("010-201-02945");
		vo.setUser_address("경기도 수원시");
		
		logger.info("회원정보:" + vo.toString());
		userDAO.join(vo);
		
	}*/
	@Test
	public void select() throws Exception{
		String user_id = "jaehuniya";
		String user_password="1";
		
		userDAO.loginCheck(user_id, user_password);
		logger.info("로그인 정보" + userDAO.loginCheck(user_id, user_password).toString());

	}
}
