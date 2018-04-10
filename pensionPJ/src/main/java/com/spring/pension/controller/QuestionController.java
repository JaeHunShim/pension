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
	
	@Inject
	private QuestionService questionServcie;
	
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	//글 몰록보기
	@RequestMapping(value="/listAll",method=RequestMethod.GET)
	public  void listAll(Model model) throws Exception {
		
		model.addAttribute("list",questionServcie.listAll());
	}
	//글작성 페이지 이동 
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGet(QuestionVO qVO, Model model) throws Exception {
		
		logger.info("글쓰기 페이지로 이동------------------");
	}
	//글작성 처리
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPost(QuestionVO qVO, RedirectAttributes rttr) throws Exception {
		logger.info("글쓰기 처리--------------------");
		logger.info("QuestionVO 에 있는 값" + qVO.toString());
		
		questionServcie.regist(qVO);
		rttr.addFlashAttribute("msg","success");
		logger.info("rttr 메세지........................"+rttr.getFlashAttributes());
		
		return "redirect:/question/list";
	}
	//smartSkin 으로 텍스트 에어리어 불러오기
	@RequestMapping(value="/SmartEditor2Skin",method=RequestMethod.GET)
	public String SmartEditor2Skin() {
		logger.info("SmartEditor2Skin 불러오기---------");
		return "/question/SmartEditor2Skin";
	}
	//inputArea 불러오기
	@RequestMapping(value="/smart_editor2_inputarea",method=RequestMethod.GET)
	public String inputArea() {
		logger.info("inputArea 불러오기-------------");
		return "/question/smart_editor2_inputarea";
	}
}
