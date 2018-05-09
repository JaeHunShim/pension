package com.spring.pension.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.pension.domain.UserVO;
import com.spring.pension.service.UserService;

@RequestMapping("/user/*")
@Controller
public class UserController {

	@Inject
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	//회원 가입
	@RequestMapping(value="",method=RequestMethod.POST)
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
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		
		return "/user/join";
	}
}
