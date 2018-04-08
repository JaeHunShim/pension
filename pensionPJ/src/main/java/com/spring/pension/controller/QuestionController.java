package com.spring.pension.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pension.domain.QuestionVO;
import com.spring.pension.service.QuestionService;

@Controller
@RequestMapping("/question/*")
public class QuestionController {
	
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Inject
	private QuestionService questionService;
	// 질문과 답변 으로 이동
	@RequestMapping(value="/register" ,method= RequestMethod.GET)
	public void regiserGet(QuestionVO questionVO,Model model) throws Exception{
		logger.info("질문와 답변 게시판으로 이동------------------------");
		
	}
	// 질문등록 처리
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPost(QuestionVO questionVO, RedirectAttributes rttr) throws Exception{
		logger.info("질문과 답변 등록처리 -----------------------------");
		logger.info("가져오는 vo 객체 :" + questionVO.toString());	
		
		questionService.regist(questionVO);
		
		rttr.addFlashAttribute("msg","sucess");
		
		logger.info("rttr 메세지........................"+rttr.getFlashAttributes());
		return "redirect:/main/index";
	}
	//smartEditor페이지 불러오는 부분
	@RequestMapping(value="/SmartEditor2Skin", method=RequestMethod.GET)
	public String SmartEditor2Skin() throws Exception{
		
		return "SmartEditor2Skin";
	}
	//smart_editor inputarea 불러오는 부분
	@RequestMapping(value="/smart_editor2_inputarea",method=RequestMethod.GET)
	public String inputArea() throws Exception {
		return "/smart_editor2_inputarea";
	}
}
