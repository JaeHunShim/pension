package com.spring.pension.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pension.domain.NoticeVO;
import com.spring.pension.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Inject
	private NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	// 글 삽입 페이지로 이동
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public void registerGET() throws Exception {
		
		logger.info("글쓰기 페이지로 이동------------");
	}
	// 글삽입후 처리
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(NoticeVO noticeVO,RedirectAttributes rttr) throws Exception {
		logger.info("글쓰기 처리 -----------------------------------------------------------");
		
		noticeService.insertBoard(noticeVO);
		logger.info("글등록에서 받아오는 VO" + noticeVO.toString());
		rttr.addFlashAttribute("msg", "success");
		
		logger.info("-------------------------------------------------------------------");
		return "redirect:/notice/list";
	}
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void list() throws Exception {
		
	}
}
