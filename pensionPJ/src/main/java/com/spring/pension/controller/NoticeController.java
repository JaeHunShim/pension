package com.spring.pension.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public String listAll() throws Exception {
		
		return "/notice/listAll";
	}
}
