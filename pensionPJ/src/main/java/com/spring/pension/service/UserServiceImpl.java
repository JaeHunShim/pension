package com.spring.pension.service;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.spring.pension.domain.UserVO;
import com.spring.pension.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO userDAO;
	
	@Inject
	private JavaMailSender mailSender;
	
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
	//메일 전송
	@Override
	public boolean send(String subject, String text, String from, String to) {
		
		MimeMessage message = mailSender.createMimeMessage();
		try {
			
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setSubject(subject);
			helper.setText(text);
			helper.setFrom(from);
			helper.setTo(to);
			
			mailSender.send(message);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	//로그인  체크
	@Override
	public UserVO loginCheck(String user_id, String user_password) throws Exception {
		
		return userDAO.loginCheck(user_id, user_password);
	}

}
