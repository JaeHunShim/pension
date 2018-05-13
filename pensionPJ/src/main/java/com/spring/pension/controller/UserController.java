package com.spring.pension.controller;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pension.domain.UserVO;
import com.spring.pension.service.UserService;
import com.spring.pension.util.MailHandler;
import com.spring.pension.util.TempKey;


@RequestMapping("/user/*")
@Controller
public class UserController {

	@Inject
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	//회원가입 폼 불러오는 부분 (modal처리)
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public void join() {
		
	}
	//로그인 폼 불러오는 부분(moadal 처리)
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public void login() {
		
	}
	//회원 가입
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public ResponseEntity<String> join(@RequestBody UserVO userVO) throws Exception {
		
		ResponseEntity<String> entity = null;
		try {
			userService.join(userVO);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//아이디 중복 체크 
	@ResponseBody
	@RequestMapping(value="/idCheck",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> idCheck(@RequestBody String user_id) throws Exception {
		
		ResponseEntity<Map<String,Object>> entity = null;
		try {
				Map<String,Object> map = new HashMap<String,Object>();
				int count = 0;
				count = userService.userIdCheck(user_id);
				map.put("cnt", count);
				entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//이메일 인증번호 발송 
	@ResponseBody
	@RequestMapping(value="/emailCertification",method=RequestMethod.POST)
	public boolean emailAutorization(@RequestBody String user_email,HttpSession session) throws Exception {
		
			String key = new TempKey().getKey(50,false); //키 생성 
			session.setAttribute("key", key); //생성한 키를 session에 저장(view단에서 session값과 입력한 값이 동일한지 검사할거임)
			String subject ="회원가입 승인번호입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("회원가입 승인번호는").append(key).append("입니다.");
			
			return userService.send(subject, sb.toString(),"jaehuniya@gmail.com", user_email);
	}
	//로그인 체크 처리
	@ResponseBody
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public Map<String,Object> loginCheck(@RequestBody UserVO userVO,Model model,HttpSession session) throws Exception {
		logger.info("받아오는 vo 정보:" + userService.loginCheck(userVO));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("vo",userService.loginCheck(userVO));
		session.setAttribute("userVO",userService.loginCheck(userVO));
		return map;
	}
		
}
