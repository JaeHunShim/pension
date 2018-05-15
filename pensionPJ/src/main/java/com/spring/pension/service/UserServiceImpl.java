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
import com.spring.pension.util.MailHandler;

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
	public UserVO loginCheck(UserVO userVO) throws Exception {
		
		return userDAO.loginCheck(userVO);
	}
	// 이메일 뽑아와서 이메일 보내기(패스워드 찾기 위해서 )
	@Override
	public boolean findPassword(UserVO userVO) throws Exception {
		
		logger.info("파라미터로 가지고온 user_id값: " + userVO.getUser_id());
		UserVO vo = userDAO.findPassword(userVO);
		if(vo == null) {
			return false;
		}else {
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[비밀번호 찾기 ]");
			sendMail.setText(new StringBuffer().append("<h1>비밀번호 찾기</h1>").append("비밀번호는 <br>")
					.append(vo.getUser_password()).toString());
			sendMail.setFrom("jaehuniya@gmail.com", "관리자");
			sendMail.setTo(vo.getUser_email());
			sendMail.send();
			
			return true;
		}
		
	}

}
