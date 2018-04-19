package com.spring.pension.controller;

import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pension.domain.QuestionVO;
import com.spring.pension.persistence.QuestionDAO;
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
		logger.info("글목록 불러오기------------------");
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
		
		return "redirect:/question/listAll";
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
	//글조회 할때 password 입력창 불러오기
	@RequestMapping(value="/password" ,method=RequestMethod.GET)
	public String password(@RequestParam("qno") int qno ,Model model) {
		logger.info("패스워드 입력창 출력-------------");
		logger.info("받아온 qno-------" + qno);
		model.addAttribute("qno", qno);
		return "/question/password";
	}
	//조건에 맞는 상세페이지 불러오기 
	@RequestMapping(value="/read",method=RequestMethod.POST)
	public void passwordCheck(int qno ,String password,Model model) throws Exception{
		
		logger.info("passwrod에서 받아온  qno: "+qno + " 받오는 password: " +password );
		
		model.addAttribute(questionServcie.read(qno,password));
	
	}
	// 게시글 삭제 하기
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String remove(int qno,RedirectAttributes rttr) throws Exception{
			
		logger.info("삭제페이지에서 받아오는 qno:" + qno);
		questionServcie.remove(qno);
		rttr.addFlashAttribute("msg","success");
		return "redirect:/question/listAll";
	}
	// 게시물 수정하기 위해서 read 페이지에서 qno,password 받아오기 model에 넝어서 modify 페이지에 뿌리기
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public String modifyGET(int qno,Model model) throws Exception{
		
		model.addAttribute(questionServcie.getQno(qno));
		
		return "/question/modify";
	}
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPOST(QuestionVO questionVO,RedirectAttributes rttr) throws Exception{
		
		questionServcie.modify(questionVO);
		return "redirect:/question/listAll";
	}
}
