package com.spring.pension.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main/*")
public class IndexController {
	
	@Inject
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value="/index" ,method=RequestMethod.GET)
	public String main() {
		logger.info("메인페이지로 이동");
		return "/index/index";
	}
	@RequestMapping(value="/intro" ,method=RequestMethod.GET)
	public String intro() {
		logger.info("소개 페이지로 이동");
		return "/index/intro";
	}
}
